// ════════════════════════════════════════════════════════════
// Supabase — El Maestro
// Añadir en cada página HTML, ANTES de este script:
//   <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
//   <script src="supabase.js"></script>
// ════════════════════════════════════════════════════════════

const SUPABASE_URL = 'https://qwqtibesyudquvguguut.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3cXRpYmVzeXVkcXV2Z3VndXV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkyMjEyMzEsImV4cCI6MjA5NDc5NzIzMX0.1FMfvV0HCdRhWPAz0nZoCdx-tIXRJ9AfuJVhshd-BAY';

const db = supabase.createClient(SUPABASE_URL, SUPABASE_KEY);

// ── Profesionales ─────────────────────────────────────────
const Profesionales = {
  listar: () =>
    db.from('profesionales').select('*').order('calificacion', { ascending: false }),

  porOficio: (oficio) =>
    db.from('profesionales').select('*').eq('oficio', oficio).order('calificacion', { ascending: false }),

  porZona: (zona) =>
    db.from('profesionales').select('*').eq('zona', zona),

  porId: (id) =>
    db.from('profesionales').select('*').eq('id', id).single(),

  buscar: (texto) =>
    db.from('profesionales').select('*')
      .or(`nombre.ilike.%${texto}%,oficio.ilike.%${texto}%,descripcion.ilike.%${texto}%`)
      .order('calificacion', { ascending: false }),
};

// ── Servicios ─────────────────────────────────────────────
const Servicios = {
  listar: () =>
    db.from('servicios').select('*').order('id'),
};

// ── Contactos ─────────────────────────────────────────────
const Contactos = {
  guardar: (data) =>
    db.from('contactos').insert([data]),
};

// ── Usuarios ──────────────────────────────────────────────
const Usuarios = {
  registrar: (data) =>
    db.from('usuarios').insert([data]),

  porCorreo: (correo) =>
    db.from('usuarios').select('*').eq('correo', correo).single(),
};
