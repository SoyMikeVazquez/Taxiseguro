-- ==============================================================================
-- TABLA: configuracion_tarifas
-- Sistema de gestión de tarifas manuales y dinámicas para TaxiSeguro / EJETUR
-- ==============================================================================

CREATE TABLE IF NOT EXISTS public.configuracion_tarifas (
  id TEXT PRIMARY KEY DEFAULT 'principal',
  usar_tarifa_manual BOOLEAN NOT NULL DEFAULT true,
  -- 1. Mapa de calor automático / por demanda en tiempo real
  activar_mapa_calor_demanda BOOLEAN NOT NULL DEFAULT false,
  -- 2. Círculos o zonas manuales establecidas por el administrador
  activar_zonas_manuales BOOLEAN NOT NULL DEFAULT false,
  -- Parámetros del tabulador
  precio_km_adicional DOUBLE PRECISION NOT NULL DEFAULT 7.50,
  banderazo_base DOUBLE PRECISION NOT NULL DEFAULT 25.00,
  costo_por_minuto DOUBLE PRECISION NOT NULL DEFAULT 0.00,
  tabulador_json JSONB NOT NULL DEFAULT '[
    {"km": 1, "tarifa": 25.0},
    {"km": 2, "tarifa": 25.0},
    {"km": 3, "tarifa": 35.0},
    {"km": 4, "tarifa": 45.0},
    {"km": 5, "tarifa": 55.0},
    {"km": 6, "tarifa": 62.0},
    {"km": 7, "tarifa": 70.0},
    {"km": 8, "tarifa": 77.0},
    {"km": 9, "tarifa": 85.0},
    {"km": 10, "tarifa": 92.0},
    {"km": 11, "tarifa": 100.0},
    {"km": 12, "tarifa": 107.0},
    {"km": 13, "tarifa": 115.0},
    {"km": 14, "tarifa": 122.0},
    {"km": 15, "tarifa": 130.0},
    {"km": 16, "tarifa": 137.0},
    {"km": 17, "tarifa": 145.0},
    {"km": 18, "tarifa": 152.0},
    {"km": 19, "tarifa": 160.0},
    {"km": 20, "tarifa": 167.0},
    {"km": 21, "tarifa": 175.0},
    {"km": 22, "tarifa": 182.0},
    {"km": 23, "tarifa": 190.0},
    {"km": 24, "tarifa": 197.0},
    {"km": 25, "tarifa": 205.0}
  ]'::jsonb,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Si la tabla ya fue creada previamente, añadir las columnas nuevas de forma segura:
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='configuracion_tarifas' AND column_name='activar_mapa_calor_demanda') THEN
    ALTER TABLE public.configuracion_tarifas ADD COLUMN activar_mapa_calor_demanda BOOLEAN NOT NULL DEFAULT false;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='configuracion_tarifas' AND column_name='activar_zonas_manuales') THEN
    ALTER TABLE public.configuracion_tarifas ADD COLUMN activar_zonas_manuales BOOLEAN NOT NULL DEFAULT false;
  END IF;
END $$;

-- Habilitar RLS y otorgar permisos
ALTER TABLE public.configuracion_tarifas ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Lectura de tarifas publica" ON public.configuracion_tarifas;
CREATE POLICY "Lectura de tarifas publica" ON public.configuracion_tarifas FOR SELECT USING (true);

DROP POLICY IF EXISTS "Actualizacion de tarifas total" ON public.configuracion_tarifas;
CREATE POLICY "Actualizacion de tarifas total" ON public.configuracion_tarifas FOR ALL USING (true);

-- Insertar registro base si no existe (con los valores del Periódico Oficial de Chiapas)
INSERT INTO public.configuracion_tarifas (
  id,
  usar_tarifa_manual,
  activar_mapa_calor_demanda,
  activar_zonas_manuales,
  precio_km_adicional,
  banderazo_base,
  costo_por_minuto,
  tabulador_json,
  updated_at
)
VALUES (
  'principal',
  true,
  false,
  false,
  7.50,
  25.00,
  0.00,
  '[
    {"km": 1, "tarifa": 25.0},
    {"km": 2, "tarifa": 25.0},
    {"km": 3, "tarifa": 35.0},
    {"km": 4, "tarifa": 45.0},
    {"km": 5, "tarifa": 55.0},
    {"km": 6, "tarifa": 62.0},
    {"km": 7, "tarifa": 70.0},
    {"km": 8, "tarifa": 77.0},
    {"km": 9, "tarifa": 85.0},
    {"km": 10, "tarifa": 92.0},
    {"km": 11, "tarifa": 100.0},
    {"km": 12, "tarifa": 107.0},
    {"km": 13, "tarifa": 115.0},
    {"km": 14, "tarifa": 122.0},
    {"km": 15, "tarifa": 130.0},
    {"km": 16, "tarifa": 137.0},
    {"km": 17, "tarifa": 145.0},
    {"km": 18, "tarifa": 152.0},
    {"km": 19, "tarifa": 160.0},
    {"km": 20, "tarifa": 167.0},
    {"km": 21, "tarifa": 175.0},
    {"km": 22, "tarifa": 182.0},
    {"km": 23, "tarifa": 190.0},
    {"km": 24, "tarifa": 197.0},
    {"km": 25, "tarifa": 205.0}
  ]'::jsonb,
  NOW()
)
ON CONFLICT (id) DO NOTHING;
