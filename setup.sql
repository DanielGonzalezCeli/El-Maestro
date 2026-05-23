
-- ── 1. TABLAS ─────────────────────────────────────────────

create table if not exists usuarios (
  id         uuid primary key default gen_random_uuid(),
  nombre     text not null,
  apellido   text not null,
  correo     text unique not null,
  rol        text not null default 'usuario' check (rol in ('usuario', 'admin')),
  created_at timestamptz default now()
);

create table if not exists profesionales (
  id             uuid primary key default gen_random_uuid(),
  nombre         text not null,
  oficio         text not null,
  zona           text,
  calificacion   numeric(3,1) default 0.0,
  resenas        integer default 0,
  precio         integer,
  unidad         text default 'hora',
  descripcion    text,
  disponibilidad text default 'semana',
  verificado     boolean default false,
  whatsapp       text,
  cedula         char(10),
  telefono       char(10),
  direccion      text,
  created_at     timestamptz default now()
);

create table if not exists servicios (
  id     serial primary key,
  nombre text not null,
  icono  text not null
);

create table if not exists contactos (
  id         uuid primary key default gen_random_uuid(),
  nombre     text not null,
  correo     text not null,
  asunto     text,
  mensaje    text,
  created_at timestamptz default now()
);


-- ── 2. SERVICIOS ──────────────────────────────────────────

insert into servicios (nombre, icono) values
  ('Electricista',       'fa-bolt'),
  ('Plomero',            'fa-faucet'),
  ('Cerrajero',          'fa-lock'),
  ('Pintor',             'fa-paint-roller'),
  ('Aire acondicionado', 'fa-wind'),
  ('Carpintero',         'fa-hammer'),
  ('Limpieza',           'fa-broom'),
  ('Mudanzas',           'fa-truck-moving');


-- ── 3. PROFESIONALES ──────────────────────────────────────
-- WhatsApp: cada profesional tiene un número ecuatoriano único (formato 09XXXXXXXX)

-- ELECTRICISTAS
insert into profesionales (nombre, oficio, zona, calificacion, resenas, precio, unidad, descripcion, disponibilidad, verificado, whatsapp, cedula, telefono, direccion) values
  ('José Antonio Ramírez Guerrero',   'Electricista', 'norte',  4.9, 87, 25, 'hora', 'Especialista en instalaciones residenciales y comerciales, tableros eléctricos y corrección de cortocircuitos. Más de 10 años de experiencia en Quito Norte.',       'hoy',    true,  '0984512367', '1712345675', '0987654321', 'La Floresta, av. 6 de Diciembre y Whymper'),
  ('Carlos Iván Villacís Proaño',     'Electricista', 'norte',  4.7, 63, 22, 'hora', 'Instalación de tomacorrientes, iluminación LED, tableros de distribución y mantenimiento preventivo. Trabajo garantizado con factura.',                                'hoy',    true,  '0971234589', '1723456784', '0976543218', 'El Batán, av. República del Salvador y Naciones Unidas'),
  ('Marco Vinicio Espinosa Andrade',  'Electricista', 'norte',  4.5, 41, 20, 'hora', 'Reparación de instalaciones eléctricas, cambio de breakers, cableado estructurado y sistemas de puesta a tierra. Atención rápida.',                                   'semana', false, '0963456781', '1734567892', '0965432107', 'Cotocollao, calle Machala y Manuel Freire'),
  ('Eduardo Patricio Morales Jiménez','Electricista', 'centro', 4.8, 72, 28, 'hora', 'Técnico eléctrico con experiencia en instalaciones industriales y residenciales. Disponible para emergencias las 24 horas.',                                          'hoy',    true,  '0952345678', '1745678902', '0954321096', 'La Mariscal, av. Amazonas y Patria'),
  ('Diego Fernando Cifuentes Iza',    'Electricista', 'sur',    4.3, 29, 18, 'hora', 'Mantenimiento eléctrico preventivo y correctivo, instalación de generadores, UPS y sistemas de alarma para hogares y negocios.',                                       'semana', false, '0943217896', '1756789010', '0943210985', 'Chillogallo, av. Maldonado y Rumichaca');

-- PLOMEROS
insert into profesionales (nombre, oficio, zona, calificacion, resenas, precio, unidad, descripcion, disponibilidad, verificado, whatsapp, cedula, telefono, direccion) values
  ('Mario Sebastián Pinto Salazar',      'Plomero', 'centro', 4.6, 54, 20, 'hora', 'Reparación de tuberías, instalación de sanitarios, detección de fugas y mantenimiento de sistemas de agua fría y caliente. Materiales incluidos.',      'hoy',    true,  '0935678912', '1767890120', '0932109874', 'Centro Histórico, García Moreno y Sucre'),
  ('Roberto Carlos Cevallos Guamán',     'Plomero', 'sur',    4.4, 38, 18, 'hora', 'Destape de cañerías, instalación de calefones, reparación de llaves y mantenimiento general de plomería residencial y comercial.',                       'hoy',    false, '0926789123', '1778901239', '0921098763', 'Solanda, av. Teniente Hugo Ortiz y Cusubamba'),
  ('Gonzalo Rodrigo Hidalgo Toapanta',   'Plomero', 'norte',  4.7, 61, 22, 'hora', 'Instalación de tuberías PVC y cobre, reparación de fugas, instalación de medidores y sistemas de filtración de agua. Certificado por el MIDUVI.',        'semana', true,  '0917890234', '1789012349', '0910987652', 'Calderón, av. Geovanni Calles y Carapungo'),
  ('Luis Eduardo Zambrano Albán',        'Plomero', 'valles', 4.5, 45, 25, 'hora', 'Plomería en general, instalación de sistemas de riego, mantenimiento de tanques y cisternas residenciales. Servicio para los valles de Quito.',           'hoy',    true,  '0908901345', '1790123457', '0909876541', 'Cumbayá, av. Interoceánica y Flores Jijón'),
  ('Patricio Rubén Andrade Rosero',      'Plomero', 'centro', 4.2, 22, 16, 'hora', 'Reparación de baños completos, cambio de tubería, impermeabilización y detección de fugas con equipos especializados.',                                   'semana', false, '0991234567', '1701234567', '0998765430', 'Iñaquito, av. Brasil y Mariana de Jesús');

-- CERRAJEROS
insert into profesionales (nombre, oficio, zona, calificacion, resenas, precio, unidad, descripcion, disponibilidad, verificado, whatsapp, cedula, telefono, direccion) values
  ('Luis Miguel Cabrera Molina',        'Cerrajero', 'sur',    4.3, 31, 18, 'servicio', 'Apertura de puertas, cambio de chapas, instalación de cerraduras de seguridad y duplicado de llaves. Atención de emergencias 24/7.',                     'semana', false, '0985678901', '1712398765', '0987123454', 'Quito Sur, av. Mariscal Sucre y Camal'),
  ('Cristian Oswaldo Rosero Peñafiel',  'Cerrajero', 'centro', 4.6, 47, 20, 'servicio', 'Instalación de cerraduras digitales, cajas fuertes y sistemas de control de acceso. Trabajo garantizado con garantía de 6 meses.',                       'hoy',    true,  '0976789012', '1723489025', '0976234563', 'La Magdalena, av. La Prensa y Machala'),
  ('Pablo Andrés Guamán Quishpe',       'Cerrajero', 'norte',  4.4, 35, 15, 'servicio', 'Duplicado de llaves, cambio de seguros, reparación de puertas y portones automáticos. Precios accesibles y servicio rápido.',                            'hoy',    false, '0967890123', '1734590134', '0965345672', 'El Condado, av. Occidental y Diego de Almagro'),
  ('Miguel Ángel Toapanta Lara',        'Cerrajero', 'sur',    4.1, 19, 15, 'servicio', 'Apertura de vehículos, cambio de chapa y servicio de cerrajería en general para hogares y empresas del sur de Quito.',                                  'semana', false, '0958901234', '1745601243', '0954456781', 'Turubamba, av. Morán Valverde y Quitumbe'),
  ('Ramiro Arturo Iza Naranjo',         'Cerrajero', 'valles', 4.7, 58, 22, 'servicio', 'Especialista en cerraduras de alta seguridad, blindajes de puertas y sistemas biométricos. Atención en los valles de Quito.',                            'hoy',    true,  '0949012345', '1756712350', '0943567890', 'Sangolquí, av. General Enríquez y Espejo');

-- PINTORES
insert into profesionales (nombre, oficio, zona, calificacion, resenas, precio, unidad, descripcion, disponibilidad, verificado, whatsapp, cedula, telefono, direccion) values
  ('Ana Lucía Torres Vega',              'Pintor', 'norte',  4.8, 62, 22, 'hora', 'Pintura interior y exterior, acabados de primera, preparación de superficies y asesoría en paletas de color. Trabajo limpio y puntual.',                  'hoy',    true,  '0930123456', '1767823469', '0932678909', 'González Suárez, av. González Suárez y 12 de Octubre'),
  ('Silvia Carolina Molina Cifuentes',   'Pintor', 'centro', 4.5, 43, 19, 'hora', 'Pintura decorativa, murales, estuco y texturizados. Especialista en pintura de departamentos y oficinas con materiales de calidad.',                       'semana', true,  '0921234567', '1778934578', '0921789018', 'La Floresta, Toledo y Madrid'),
  ('Carmen Isabel Naranjo Zambrano',     'Pintor', 'sur',    4.3, 28, 17, 'hora', 'Pintura de casas, galpones y locales comerciales. Presupuesto sin costo. Materiales de primera línea incluidos en el precio.',                             'semana', false, '0912345678', '1789045687', '0910890127', 'El Recreo, av. Pedro Vicente Maldonado y El Recreo'),
  ('Verónica Paola Proaño Cevallos',     'Pintor', 'norte',  4.6, 51, 20, 'hora', 'Pintura residencial y comercial, impermeabilización de terrazas y fachadas. Más de 8 años de experiencia en el sector norte de Quito.',                   'hoy',    true,  '0903456789', '1790156796', '0909901236', 'Cotocollao, av. Diego de Vásquez y Machala'),
  ('Héctor Enrique Rivadeneira Hidalgo', 'Pintor', 'valles', 4.4, 37, 21, 'hora', 'Pintura profesional interior y exterior, tratamiento de humedad, colocación de papel tapiz y revestimientos decorativos en los valles.',                  'semana', false, '0994567890', '1701267807', '0998012345', 'Tumbaco, av. Interoceánica y Ruta Viva');

-- AIRE ACONDICIONADO
insert into profesionales (nombre, oficio, zona, calificacion, resenas, precio, unidad, descripcion, disponibilidad, verificado, whatsapp, cedula, telefono, direccion) values
  ('Andrés Mauricio Salazar Guerrero', 'Aire acondicionado', 'norte',  4.7, 56, 30, 'servicio', 'Instalación, mantenimiento y reparación de aires acondicionados split y central. Certificado por ANCE. Todas las marcas.',                           'hoy',    true,  '0985671234', '1712378916', '0987234565', 'Iñaquito, av. Amazonas y Gaspar de Villarroel'),
  ('Felipe Santiago Albán Espinosa',   'Aire acondicionado', 'norte',  4.5, 39, 28, 'servicio', 'Mantenimiento preventivo de equipos de climatización, recarga de gas refrigerante y reparación de unidades condensadoras y evaporadoras.',         'semana', true,  '0976782345', '1723489124', '0976345674', 'El Batán, av. 6 de Diciembre y Naciones Unidas'),
  ('Xavier Bolívar Peñafiel Andrade',  'Aire acondicionado', 'sur',    4.4, 32, 25, 'servicio', 'Instalación de minisplit, aires de ventana y sistemas centrales. Presupuesto gratis. Servicio post venta garantizado.',                             'semana', false, '0967893456', '1734590233', '0965456783', 'Solanda, av. Teniente Hugo Ortiz y Solanda'),
  ('Byron Gustavo Jiménez Rosero',     'Aire acondicionado', 'valles', 4.8, 67, 35, 'servicio', 'Técnico certificado en sistemas de climatización VRF, chiller y fan coil. Especialista en proyectos residenciales y corporativos en los valles.', 'hoy',    true,  '0958904567', '1745601342', '0954567892', 'Cumbayá, vía Interoceánica km 9'),
  ('Iván Darío Quishpe Molina',        'Aire acondicionado', 'centro', 4.3, 24, 27, 'servicio', 'Reparación de toda marca de aire acondicionado, limpieza de filtros, cambio de compresor y revisión del sistema eléctrico.',                        'semana', false, '0949015678', '1756712459', '0943678901', 'La Mariscal, av. Patria y 9 de Octubre');

-- CARPINTEROS
insert into profesionales (nombre, oficio, zona, calificacion, resenas, precio, unidad, descripcion, disponibilidad, verificado, whatsapp, cedula, telefono, direccion) values
  ('Roberto Alexis Mora Cifuentes',   'Carpintero', 'valles', 4.5, 43, 30, 'hora', 'Fabricación de muebles a medida, reparación de estructuras de madera, instalación de closets y puertas. Materiales de calidad garantizados.',            'semana', true,  '0937261890', '1767823568', '0932789010', 'Sangolquí, av. General Enríquez y Río Pita'),
  ('Fabricio David Guamán Iza',       'Carpintero', 'norte',  4.7, 55, 28, 'hora', 'Muebles de cocina a medida, puertas de madera maciza, pisos flotantes y enchapes. Diseño personalizado con presupuesto sin costo.',                      'hoy',    true,  '0928372901', '1778934677', '0921890121', 'Calderón, av. Carapungo y John F. Kennedy'),
  ('Marcelo Hernán Toapanta Lara',    'Carpintero', 'sur',    4.4, 38, 25, 'hora', 'Reparación de muebles, puertas y ventanas de madera. Instalación de closets, modulares y divisiones de oficina en el sur de Quito.',                     'semana', false, '0919483012', '1789045786', '0910901232', 'La Magdalena, av. La Prensa y Bahía de Caráquez'),
  ('Hugo Arturo Cevallos Naranjo',    'Carpintero', 'centro', 4.6, 48, 32, 'hora', 'Carpintería fina en madera solida y MDF. Cocinas integrales, vestidores y muebles de baño. Garantía de 1 año en todos los trabajos.',                     'hoy',    true,  '0900594123', '1790156895', '0909012343', 'La Floresta, Toledo y Versalles'),
  ('Álvaro Javier Proaño Zambrano',   'Carpintero', 'norte',  4.3, 27, 26, 'hora', 'Instalación de pisos de madera, bambú y laminado. Lijado y lacado de muebles. Reparación de parquet y entablados deteriorados.',                        'semana', false, '0991605234', '1701267906', '0998123454', 'El Condado, av. Occidental y Condado Shopping');

-- LIMPIEZA
insert into profesionales (nombre, oficio, zona, calificacion, resenas, precio, unidad, descripcion, disponibilidad, verificado, whatsapp, cedula, telefono, direccion) values
  ('Carmen Beatriz Vega Salazar',       'Limpieza', 'norte',  4.7, 78, 15, 'hora', 'Limpieza profunda de hogares, oficinas y departamentos. Incluye cocina, baños y ventanas. Productos de limpieza incluidos en el servicio.',              'hoy',    true,  '0982716345', '1712389012', '0987345676', 'La Mariscal, av. 6 de Diciembre y Colón'),
  ('Patricia Elena Espinosa Guerrero',  'Limpieza', 'centro', 4.5, 62, 14, 'hora', 'Limpieza de apartamentos, casas y oficinas. Especialista en limpieza post obra y mudanza. Puntualidad y discreción garantizadas.',                       'hoy',    true,  '0973827456', '1723490122', '0976456787', 'Iñaquito, av. Brasil y Naciones Unidas'),
  ('Gabriela Fernanda Andrade Hidalgo', 'Limpieza', 'sur',    4.6, 55, 13, 'hora', 'Limpieza residencial y comercial. Lavado de muebles tapizados, alfombras y cortinas. Desinfección con productos biodegradables certificados.',            'semana', true,  '0964938567', '1734501230', '0965567898', 'Chillogallo, av. Maldonado y Turubamba'),
  ('Daniela Stefanía Rosero Albán',     'Limpieza', 'valles', 4.4, 41, 16, 'hora', 'Limpieza de casas y quintas en los valles. Servicio de niñera y cuidado de adultos mayores. Referenciada y con experiencia comprobable.',                 'hoy',    false, '0956049678', '1745612349', '0954678909', 'Cumbayá, urbanización Santa Lucía'),
  ('Mónica Susana Jiménez Cifuentes',   'Limpieza', 'norte',  4.3, 33, 12, 'hora', 'Limpieza de hogares por horas o contrato mensual. Organización de espacios y destinkle de ropa incluidos. Precios accesibles.',                          'semana', false, '0947150789', '1756723456', '0943789010', 'Cotocollao, av. Diego de Vásquez y Brasil');

-- MUDANZAS
insert into profesionales (nombre, oficio, zona, calificacion, resenas, precio, unidad, descripcion, disponibilidad, verificado, whatsapp, cedula, telefono, direccion) values
  ('Fernando Geovanny Molina Peñafiel', 'Mudanzas', 'norte',  4.6, 52, 40, 'servicio', 'Mudanzas locales y nacionales con camión propio. Embalaje profesional, desmontaje y montaje de muebles. Seguro de carga incluido.',                  'hoy',    true,  '0938261890', '1767834565', '0932890121', 'Calderón, av. Carapungo y Simón Bolívar'),
  ('Ernesto Wilmer Iza Quishpe',        'Mudanzas', 'sur',    4.4, 38, 35, 'servicio', 'Servicio de mudanza con personal capacitado. Transporte de enseres, electrodomésticos y objetos frágiles con garantía de entrega.',                   'semana', false, '0929372901', '1778945673', '0921901232', 'Turubamba, av. Morán Valverde y Quitumbe Ñan'),
  ('Rodrigo Fabricio Guerrero Toapanta','Mudanzas', 'valles', 4.7, 61, 45, 'servicio', 'Mudanzas en los valles y Quito. Camión 3.5 toneladas con rampa hidráulica. Embalaje con plástico stretch y cajas reforzadas.',                       'hoy',    true,  '0910483012', '1789056783', '0910012343', 'Tumbaco, av. Interoceánica y Club Los Arrayanes'),
  ('Wilmer Renato Lara Guamán',         'Mudanzas', 'centro', 4.3, 29, 38, 'servicio', 'Traslado de muebles y equipos de oficina. Embalaje especializado para obras de arte y equipos sensibles. Servicio puntual.',                         'semana', false, '0901594123', '1790167892', '0909123454', 'La Magdalena, av. La Prensa y Zamora'),
  ('Hernán Napoleón Zambrano Cevallos', 'Mudanzas', 'norte',  4.5, 44, 42, 'servicio', 'Mudanzas express para departamentos y casas. Servicio de guardamuebles temporal disponible. Cobertura en todo el Distrito Metropolitano.',            'hoy',    true,  '0992705234', '1701278903', '0998234565', 'El Batán, av. 6 de Diciembre y Naciones Unidas');


-- ── 4. USUARIOS DE PRUEBA ─────────────────────────────────

insert into usuarios (nombre, apellido, correo, rol) values
  ('Daniel',  'González', 'admin@elmaestro.ec',   'admin'),
  ('María',   'Pérez',    'maria@ejemplo.com',    'usuario'),
  ('Carlos',  'López',    'carlos@ejemplo.com',   'usuario');
