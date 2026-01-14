/*
 * PERMEÁMETRO REV.I - TAPA MACHO SUPERIOR
 * Con brida de apriete
 * Puerto ENTRADA central para boquilla latón
 * Canal O-ring en plug
 */

// ============================================
// PARÁMETROS
// ============================================

// Dimensiones base (coinciden con cilindro)
diametro_interior_cilindro = 63.0;
espesor_pared_cilindro = 12.7;
diametro_exterior_cilindro = diametro_interior_cilindro + 2 * espesor_pared_cilindro;

// Brida
diametro_brida = 120;
espesor_brida = 10;
pcd_pernos = 105;
numero_pernos = 8;
diametro_agujero_perno = 6.5;

// Cuerpo de la tapa
espesor_tapa = 15;

// Plug macho
diametro_plug = diametro_interior_cilindro - 1;  // 62mm (1mm holgura para O-ring)
profundidad_plug = 20;

// Canal O-ring
profundidad_canal = 2.0;
ancho_canal = 5.0;
posicion_canal = profundidad_plug / 2;  // A mitad del plug

// Puerto entrada (boquilla latón 1/4" NPT)
diametro_puerto = 10;

$fn = $preview ? 40 : 100;

// ============================================
// MODELO
// ============================================

module tapa_macho_superior() {
    difference() {
        union() {
            // Brida de apriete
            cylinder(h = espesor_brida, d = diametro_brida);
            
            // Cuerpo principal
            translate([0, 0, espesor_brida])
                cylinder(h = espesor_tapa, d = diametro_exterior_cilindro);
            
            // Plug macho (se inserta en cilindro)
            translate([0, 0, -profundidad_plug])
                cylinder(h = profundidad_plug, d = diametro_plug);
        }
        
        // PUERTO ENTRADA (agujero pasante central)
        translate([0, 0, -profundidad_plug - 1])
            cylinder(h = profundidad_plug + espesor_brida + espesor_tapa + 2, 
                    d = diametro_puerto);
        
        // Agujeros para pernos (8×)
        for (i = [0 : numero_pernos - 1]) {
            rotate([0, 0, i * 360 / numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
        
        // Canal O-ring en plug (ranura anular)
        translate([0, 0, -posicion_canal])
            rotate_extrude()
                translate([diametro_plug/2 - profundidad_canal, 0, 0])
                    square([profundidad_canal * 2, ancho_canal], center = true);
    }
}

// Renderizar
tapa_macho_superior();

/*
NOTAS DE IMPRESIÓN:

ORIENTACIÓN: Brida en cama (plug hacia arriba)

    CAMA ═════════════
    ║     BRIDA      ║
    ║═══════════════ ║
    ║  CUERPO TAPA   ║
    ╚═══════════════ ╝
            ║║
         PLUG ↑ (arriba)

MATERIAL: PETG
ALTURA CAPA: 0.15mm (mejor acabado canal O-ring)
PAREDES: 5
RELLENO: 50%
SOPORTES: SÍ (tree supports)
   - Para el plug colgante
   - Z-distance: 0.2mm
ADHESIÓN: Brim 8mm

PESO ESTIMADO: ~150g
TIEMPO: ~12 horas

POST-PROCESO:
1. Remover soportes CUIDADOSAMENTE del canal O-ring
2. Limpiar canal con navaja/cutter
3. Lijar canal suavemente (600 grit)
4. Roscar puerto con macho 1/4" NPT
   O usar inserto roscado de latón
5. Limpiar agujeros de pernos (broca Ø6.5mm)
6. Verificar planicidad de cara de brida

BOQUILLA A INSTALAR:
- Latón 1/4" NPT con espiga para manguera
- Sellar con cinta PTFE (3 vueltas)
- Conectar manguera de entrada

O-RING:
- Viton Ø58mm × 4mm sección
- Lubricar con grasa silicona
- Colocar en canal antes de insertar en cilindro
*/
