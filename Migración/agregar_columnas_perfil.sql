-- SCRIPT: Agregar columnas para documentos y datos bancarios
-- Tabla: public.conductores

ALTER TABLE public.conductores
ADD COLUMN IF NOT EXISTS anio_auto TEXT,
ADD COLUMN IF NOT EXISTS ine_url TEXT,
ADD COLUMN IF NOT EXISTS licencia_url TEXT,
ADD COLUMN IF NOT EXISTS seguro_url TEXT,
ADD COLUMN IF NOT EXISTS tarjeta_circulacion_url TEXT,
ADD COLUMN IF NOT EXISTS banco TEXT,
ADD COLUMN IF NOT EXISTS cuenta_bancaria TEXT,
ADD COLUMN IF NOT EXISTS clabe TEXT;
