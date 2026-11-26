-- ==============================================================================
-- TAXISEGURO: NOTIFICACIONES AUTOMÁTICAS (WHATSAPP + ONESIGNAL) EN RADIO DE 5 KM
-- Y COBERTURA NACIONAL (SIN RESTRICCIÓN REGIONAL)
-- ==============================================================================

-- 1. Eliminar cualquier restricción regional de Chiapas en la tabla trips
DROP TRIGGER IF EXISTS tr_check_trip_origin_in_chiapas ON public.trips;
DROP FUNCTION IF EXISTS public.check_trip_origin_in_chiapas();

-- 2. Habilitar extensión pg_net para llamadas HTTP asíncronas desde Supabase (WhatsApp y OneSignal)
CREATE EXTENSION IF NOT EXISTS pg_net;

-- 3. Asegurar columnas de ubicación en conductores y bandera de notificación en trips
ALTER TABLE public.conductores 
ADD COLUMN IF NOT EXISTS "isActivo" BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS current_lat DOUBLE PRECISION,
ADD COLUMN IF NOT EXISTS current_lng DOUBLE PRECISION,
ADD COLUMN IF NOT EXISTS last_location_at TIMESTAMPTZ;

ALTER TABLE public.trips
ADD COLUMN IF NOT EXISTS notified_drivers BOOLEAN DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_conductores_activo_ubicacion 
ON public.conductores ("isActivo", current_lat, current_lng);

-- 4. Función RPC: get_nearby_active_drivers (corregida para soportar desfase de zona horaria UTC-6)
DROP FUNCTION IF EXISTS public.get_nearby_active_drivers(DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION);

CREATE OR REPLACE FUNCTION public.get_nearby_active_drivers(
    origin_lat DOUBLE PRECISION,
    origin_lng DOUBLE PRECISION,
    max_radius_km DOUBLE PRECISION DEFAULT 5.0
)
RETURNS TABLE (
    user_id TEXT,
    nombre TEXT,
    telefono TEXT,
    distancia_km DOUBLE PRECISION
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        COALESCE(c.user_id::TEXT, c.id::TEXT) AS user_id,
        COALESCE(c.nombre_completo, c.nombre, 'Conductor')::TEXT AS nombre,
        COALESCE(c.telefono, '')::TEXT AS telefono,
        (6371 * acos(
            LEAST(1.0, GREATEST(-1.0,
                cos(radians(origin_lat)) * cos(radians(c.current_lat)) *
                cos(radians(c.current_lng) - radians(origin_lng)) +
                sin(radians(origin_lat)) * sin(radians(c.current_lat))
            ))
        )) AS distancia_km
    FROM public.conductores c
    WHERE (
          COALESCE(c."isActivo", false) = true
          OR COALESCE(c.estatus, '') = 'activo'
          OR (c.last_location_at IS NOT NULL AND c.last_location_at >= NOW() - INTERVAL '30 minutes')
      )
      AND c.current_lat IS NOT NULL
      AND c.current_lng IS NOT NULL
      AND (c.last_location_at IS NULL OR c.last_location_at >= NOW() - INTERVAL '24 hours')
      AND (6371 * acos(
            LEAST(1.0, GREATEST(-1.0,
                cos(radians(origin_lat)) * cos(radians(c.current_lat)) *
                cos(radians(c.current_lng) - radians(origin_lng)) +
                sin(radians(origin_lat)) * sin(radians(c.current_lat))
            ))
        )) <= max_radius_km
    ORDER BY distancia_km ASC;
END;
$$;

GRANT EXECUTE ON FUNCTION public.get_nearby_active_drivers(DOUBLE PRECISION, DOUBLE PRECISION, DOUBLE PRECISION) TO anon, authenticated, service_role;

-- 5. Trigger en Supabase para despachar WhatsApp y OneSignal automáticamente al crear un viaje
CREATE OR REPLACE FUNCTION public.fn_notify_nearby_drivers_on_trip_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    r_driver RECORD;
    v_phone TEXT;
    v_clean_name TEXT;
    v_wa_content TEXT;
    v_fare_str TEXT;
    v_origin_str TEXT;
    v_dest_str TEXT;
    v_driver_ids JSONB := '[]'::jsonb;
    v_wa_token TEXT := 'TU_META_WHATSAPP_TOKEN';
    v_wa_phone_id TEXT := '116188304913165';
    v_os_app_id TEXT := 'e31e6d9c-3560-4565-ae62-3dfec8feea87';
    v_os_api_key TEXT := 'TU_ONESIGNAL_REST_API_KEY';
BEGIN
    IF COALESCE(NEW.status, 'pending') = 'pending' AND NEW.origin_lat IS NOT NULL AND NEW.origin_lng IS NOT NULL THEN
        BEGIN
            v_fare_str := '$' || ROUND(COALESCE(NEW.fare, 0)::numeric, 2)::TEXT || ' MXN';
            v_origin_str := COALESCE(NEW.origin_address, 'Ubicacion en el mapa');
            v_dest_str := COALESCE(NEW.destination_address, 'Por definir');

            FOR r_driver IN
                SELECT * FROM public.get_nearby_active_drivers(NEW.origin_lat, NEW.origin_lng, 5.0)
            LOOP
                -- Agregar user_id a la lista de destinatarios de OneSignal
                IF r_driver.user_id IS NOT NULL AND LENGTH(r_driver.user_id) > 0 THEN
                    v_driver_ids := v_driver_ids || to_jsonb(r_driver.user_id);
                END IF;

                -- Formatear teléfono para WhatsApp (estándar México 521 + 10 dígitos)
                v_phone := REGEXP_REPLACE(COALESCE(r_driver.telefono, ''), '\D', '', 'g');
                IF LENGTH(v_phone) = 10 THEN
                    v_phone := '521' || v_phone;
                ELSIF LENGTH(v_phone) = 12 AND v_phone LIKE '52%' THEN
                    v_phone := '521' || SUBSTRING(v_phone FROM 3);
                END IF;

                -- Enviar notificación por WhatsApp a este conductor cercano (solo si el token real está configurado en SQL)
                IF LENGTH(v_phone) >= 12 AND v_wa_token IS NOT NULL AND v_wa_token <> '' AND v_wa_token NOT LIKE 'TU_%' THEN
                    v_clean_name := REGEXP_REPLACE(COALESCE(r_driver.nombre, 'Conductor'), '[\r\n\t]+', ' ', 'g');
                    v_wa_content := REGEXP_REPLACE(
                        'NUEVO VIAJE SOLICITADO A ' || ROUND(r_driver.distancia_km::numeric, 1)::TEXT || ' KM DE TI. ' ||
                        'Punto de recogida: ' || v_origin_str || '. ' ||
                        'Destino: ' || v_dest_str || '. ' ||
                        'Tarifa estimada: ' || v_fare_str || '. ' ||
                        'Abre la app de TaxiSeguro ahora mismo para aceptar el viaje.',
                        '[\r\n\t]+', ' ', 'g'
                    );

                    PERFORM net.http_post(
                        url := 'https://graph.facebook.com/v21.0/' || v_wa_phone_id || '/messages',
                        headers := jsonb_build_object(
                            'Content-Type', 'application/json',
                            'Authorization', 'Bearer ' || v_wa_token
                        ),
                        body := jsonb_build_object(
                            'messaging_product', 'whatsapp',
                            'recipient_type', 'individual',
                            'to', v_phone,
                            'type', 'template',
                            'template', jsonb_build_object(
                                'name', 'notificacion_servicio',
                                'language', jsonb_build_object('code', 'es_MX'),
                                'components', jsonb_build_array(
                                    jsonb_build_object(
                                        'type', 'body',
                                        'parameters', jsonb_build_array(
                                            jsonb_build_object('type', 'text', 'text', v_clean_name),
                                            jsonb_build_object('type', 'text', 'text', v_wa_content)
                                        )
                                    )
                                )
                            )
                        )
                    );
                END IF;
            END LOOP;

            -- Enviar notificación Push por OneSignal a los conductores cercanos dentro de 5 km
            -- IMPORTANTE: Si v_os_api_key tiene el marcador 'TU_ONESIGNAL_REST_API_KEY', NO marcar notified_drivers = true
            -- para que la app Flutter despache la notificación Push y WhatsApp usando las llaves reales de Env.dart.
            IF jsonb_array_length(v_driver_ids) > 0 AND v_os_api_key IS NOT NULL AND v_os_api_key <> '' AND v_os_api_key NOT LIKE 'TU_%' THEN
                PERFORM net.http_post(
                    url := 'https://onesignal.com/api/v1/notifications',
                    headers := jsonb_build_object(
                        'Content-Type', 'application/json',
                        'Authorization', 'Key ' || v_os_api_key
                    ),
                    body := jsonb_build_object(
                        'app_id', v_os_app_id,
                        'headings', jsonb_build_object('es', 'Nuevo Viaje Solicitado', 'en', 'Nuevo Viaje Solicitado'),
                        'contents', jsonb_build_object(
                            'es', v_fare_str || ' • ' || v_origin_str || '. Toca para ver y aceptar.',
                            'en', v_fare_str || ' • ' || v_origin_str || '. Toca para ver y aceptar.'
                        ),
                        'priority', 10,
                        'android_visibility', 1,
                        'ios_sound', 'default',
                        'ttl', 300,
                        'data', jsonb_build_object('type', 'new_trip', 'trip_id', NEW.id),
                        'include_aliases', jsonb_build_object('external_id', v_driver_ids),
                        'include_external_user_ids', v_driver_ids,
                        'target_channel', 'push'
                    )
                );
                NEW.notified_drivers := true;
            ELSE
                NEW.notified_drivers := false;
            END IF;
        EXCEPTION WHEN OTHERS THEN
            -- Si pg_net no está activo o ocurre un error de red, permitir que la app Flutter envíe las notificaciones
            NEW.notified_drivers := false;
        END;
    END IF;

    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS tr_notify_nearby_drivers_on_new_trip ON public.trips;

CREATE TRIGGER tr_notify_nearby_drivers_on_new_trip
BEFORE INSERT ON public.trips
FOR EACH ROW
EXECUTE FUNCTION public.fn_notify_nearby_drivers_on_trip_insert();
