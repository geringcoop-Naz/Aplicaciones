/*
 * PERMEÁMETRO - DISEÑO FINAL REV.I
 * CILINDRO BRIDADO CON PARED GRUESA (1/2")
 * 
 * TODO IMPRESO EN 3D excepto:
 * - Boquillas de latón (4)
 * - O-rings (2)
 * - Hardware (pernos, tuercas)
 * 
 * COMPONENTES:
 * 1. Cilindro bridado (bridas integradas ambos extremos)
 * 2. Tapa macho superior (puerto entrada)
 * 3. Tapa macho inferior (puerto salida)
 * 4. Difusor superior
 * 5. Difusor inferior
 * 6. Base de soporte
 */

// ============================================
// PARÁMETROS GLOBALES
// ============================================

// CILINDRO PRINCIPAL
diametro_interior = 63.0;                    // mm - espacio para muestra
espesor_pared = 12.7;                        // 1/2 pulgada = 12.7mm (pared gruesa)
diametro_exterior = diametro_interior + 2 * espesor_pared;  // 88.4mm
altura_cilindro = 300;                       // mm

// BRIDAS DEL CILINDRO (integradas)
diametro_brida = 120;                        // mm
espesor_brida = 10;                          // mm
pcd_pernos = 105;                            // mm (Pitch Circle Diameter)
numero_pernos = 8;
diametro_agujero_perno = 6.5;                // mm (para M6)

// TAPAS MACHO
espesor_tapa = 15;                           // mm (parte superior)
profundidad_plug = 20;                       // mm (porción que se inserta)
diametro_plug = diametro_interior - 1;       // 62mm (holgura 1mm para O-ring)

// O-RING (en el plug de las tapas)
diametro_oring = 58;                         // mm (ID del O-ring)
seccion_oring = 4;                           // mm (sección transversal)
profundidad_canal_oring = 2.0;               // mm
ancho_canal_oring = 5.0;                     // mm

// PUERTOS - Boquillas de latón
diametro_puerto_flujo = 10;                  // mm (para rosca 1/4" NPT ~ G1/4")
diametro_puerto_instrumentacion = 8;         // mm (para rosca 1/8" NPT ~ G1/8")

// Posiciones puertos instrumentación en cilindro
altura_puerto_p1 = 50;                       // mm desde base del cilindro
altura_puerto_p2 = 250;                      // mm desde base del cilindro

// BASE
diametro_base = 130;
altura_base = 25;

// Resolución
$fn = $preview ? 40 : 80;

// ============================================
// MÓDULO: CILINDRO BRIDADO
// ============================================

module cilindro_bridado() {
    difference() {
        union() {
            // Cilindro principal (pared gruesa 1/2")
            cylinder(h = altura_cilindro, d = diametro_exterior);
            
            // Brida inferior (z = 0)
            cylinder(h = espesor_brida, d = diametro_brida);
            
            // Brida superior (z = altura - espesor)
            translate([0, 0, altura_cilindro - espesor_brida])
                cylinder(h = espesor_brida, d = diametro_brida);
        }
        
        // Cavidad interior
        translate([0, 0, -1])
            cylinder(h = altura_cilindro + 2, d = diametro_interior);
        
        // Agujeros pernos BRIDA INFERIOR
        for (i = [0 : numero_pernos - 1]) {
            rotate([0, 0, i * 360 / numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
        
        // Agujeros pernos BRIDA SUPERIOR
        for (i = [0 : numero_pernos - 1]) {
            rotate([0, 0, i * 360 / numero_pernos])
                translate([pcd_pernos/2, 0, altura_cilindro - espesor_brida - 1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
        
        // PUERTO INSTRUMENTACIÓN P1 (inferior)
        translate([diametro_exterior/2, 0, altura_puerto_p1])
            rotate([0, 90, 0])
                cylinder(h = espesor_pared + 2, d = diametro_puerto_instrumentacion, center = true);
        
        // PUERTO INSTRUMENTACIÓN P2 (superior)
        translate([diametro_exterior/2, 0, altura_puerto_p2])
            rotate([0, 90, 0])
                cylinder(h = espesor_pared + 2, d = diametro_puerto_instrumentacion, center = true);
    }
}

// ============================================
// MÓDULO: TAPA MACHO SUPERIOR
// ============================================

module tapa_macho_superior() {
    difference() {
        union() {
            // Brida de la tapa
            cylinder(h = espesor_brida, d = diametro_brida);
            
            // Cuerpo principal de la tapa
            translate([0, 0, espesor_brida])
                cylinder(h = espesor_tapa, d = diametro_exterior);
            
            // Plug macho (se inserta en cilindro)
            translate([0, 0, -profundidad_plug])
                cylinder(h = profundidad_plug, d = diametro_plug);
        }
        
        // Puerto ENTRADA central (rosca para boquilla latón 1/4" NPT)
        translate([0, 0, -profundidad_plug - 1])
            cylinder(h = profundidad_plug + espesor_brida + espesor_tapa + 2, 
                    d = diametro_puerto_flujo);
        
        // Agujeros para pernos
        for (i = [0 : numero_pernos - 1]) {
            rotate([0, 0, i * 360 / numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
        
        // Canal O-ring en el plug
        translate([0, 0, -profundidad_plug/2])
            rotate_extrude()
                translate([diametro_plug/2 - profundidad_canal_oring, 0, 0])
                    square([profundidad_canal_oring * 2, ancho_canal_oring], center = true);
    }
}

// ============================================
// MÓDULO: TAPA MACHO INFERIOR
// ============================================

module tapa_macho_inferior() {
    difference() {
        union() {
            // Brida de la tapa
            cylinder(h = espesor_brida, d = diametro_brida);
            
            // Cuerpo principal de la tapa
            translate([0, 0, espesor_brida])
                cylinder(h = espesor_tapa, d = diametro_exterior);
            
            // Plug macho
            translate([0, 0, -profundidad_plug])
                cylinder(h = profundidad_plug, d = diametro_plug);
        }
        
        // Puerto SALIDA lateral (rosca para boquilla latón 1/4" NPT)
        // Posición: lateral, a media altura de la sección sólida
        translate([diametro_exterior/2, 0, espesor_brida + espesor_tapa/2])
            rotate([0, 90, 0])
                cylinder(h = espesor_pared + 10, d = diametro_puerto_flujo);
        
        // Agujeros para pernos
        for (i = [0 : numero_pernos - 1]) {
            rotate([0, 0, i * 360 / numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
        
        // Canal O-ring en el plug
        translate([0, 0, -profundidad_plug/2])
            rotate_extrude()
                translate([diametro_plug/2 - profundidad_canal_oring, 0, 0])
                    square([profundidad_canal_oring * 2, ancho_canal_oring], center = true);
        
        // Cavidad interna para drenaje (conecta con puerto salida)
        translate([0, 0, -profundidad_plug - 1])
            cylinder(h = profundidad_plug + espesor_brida + espesor_tapa/2, 
                    d = diametro_plug - 10);
    }
}

// ============================================
// MÓDULO: DIFUSOR
// ============================================

module difusor() {
    difference() {
        cylinder(h = 3, d = diametro_interior - 2);
        
        // Perforación central
        translate([0, 0, -1])
            cylinder(h = 5, d = 10);
        
        // Anillo 1: 6 perforaciones
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([10, 0, -1])
                    cylinder(h = 5, d = 3);
        }
        
        // Anillo 2: 12 perforaciones
        for (i = [0:11]) {
            rotate([0, 0, i * 30])
                translate([18, 0, -1])
                    cylinder(h = 5, d = 3);
        }
        
        // Anillo 3: 18 perforaciones
        for (i = [0:17]) {
            rotate([0, 0, i * 20])
                translate([26, 0, -1])
                    cylinder(h = 5, d = 3);
        }
    }
}

// ============================================
// MÓDULO: BASE DE SOPORTE
// ============================================

module base_soporte() {
    difference() {
        union() {
            // Disco base
            cylinder(h = altura_base, d = diametro_base);
            
            // Collar central para cilindro
            cylinder(h = altura_base + 5, d = diametro_exterior + 2);
        }
        
        // Hueco para asentar cilindro
        translate([0, 0, altura_base])
            cylinder(h = 10, d = diametro_exterior + 0.5);
        
        // 3 agujeros para patas niveladoras M8
        for (i = [0:2]) {
            rotate([0, 0, i * 120])
                translate([diametro_base/2 - 10, 0, -1])
                    cylinder(h = altura_base + 2, d = 8.5);
        }
    }
}

// ============================================
// VISUALIZACIÓN DE BOQUILLAS (representación)
// ============================================

module boquilla_flujo() {
    color("Gold")
    union() {
        // Rosca externa
        cylinder(h = 15, d = 12);
        // Espiga para manguera
        translate([0, 0, 15])
            cylinder(h = 20, d1 = 10, d2 = 8);
    }
}

module boquilla_instrumentacion() {
    color("Gold")
    union() {
        // Rosca externa
        cylinder(h = 10, d = 10);
        // Conexión manómetro
        translate([0, 0, 10])
            cylinder(h = 5, d = 8);
    }
}

// ============================================
// ENSAMBLAJE COMPLETO
// ============================================

// Controles de visualización
mostrar_cilindro = true;
mostrar_tapa_superior = true;
mostrar_tapa_inferior = true;
mostrar_difusores = true;
mostrar_base = true;
mostrar_boquillas = true;

modo_explosionado = false;
distancia_explosion = 50;

module ensamblaje_completo() {
    offset = modo_explosionado ? distancia_explosion : 0;
    
    // BASE
    if (mostrar_base) {
        color("SteelBlue")
        translate([0, 0, 0])
            base_soporte();
    }
    
    // CILINDRO BRIDADO
    if (mostrar_cilindro) {
        color("CornflowerBlue", 0.7)
        translate([0, 0, altura_base + 5])
            cilindro_bridado();
    }
    
    // TAPA INFERIOR (invertida, plug hacia arriba)
    if (mostrar_tapa_inferior) {
        color("DodgerBlue")
        translate([0, 0, altura_base + 5 - offset])
            rotate([180, 0, 0])
                translate([0, 0, -espesor_brida - espesor_tapa])
                    tapa_macho_inferior();
    }
    
    // TAPA SUPERIOR (plug hacia abajo)
    if (mostrar_tapa_superior) {
        color("RoyalBlue")
        translate([0, 0, altura_base + 5 + altura_cilindro + offset])
            rotate([180, 0, 0])
                tapa_macho_superior();
    }
    
    // DIFUSOR INFERIOR
    if (mostrar_difusores) {
        color("Gray")
        translate([0, 0, altura_base + 5 + 15 - offset/2])
            difusor();
    }
    
    // DIFUSOR SUPERIOR
    if (mostrar_difusores) {
        color("Gray")
        translate([0, 0, altura_base + 5 + altura_cilindro - 15 + offset/2])
            difusor();
    }
    
    // BOQUILLAS DE LATÓN
    if (mostrar_boquillas) {
        // Boquilla entrada (tapa superior)
        translate([0, 0, altura_base + 5 + altura_cilindro + espesor_brida + espesor_tapa + offset])
            boquilla_flujo();
        
        // Boquilla salida (tapa inferior - lateral)
        translate([diametro_exterior/2 + 5, 0, altura_base + espesor_tapa/2 - offset])
            rotate([0, 90, 0])
                boquilla_flujo();
        
        // Boquilla P1 (instrumentación)
        translate([diametro_exterior/2 + espesor_pared/2 + 5, 0, altura_base + 5 + altura_puerto_p1])
            rotate([0, 90, 0])
                boquilla_instrumentacion();
        
        // Boquilla P2 (instrumentación)
        translate([diametro_exterior/2 + espesor_pared/2 + 5, 0, altura_base + 5 + altura_puerto_p2])
            rotate([0, 90, 0])
                boquilla_instrumentacion();
    }
}

// Renderizar ensamblaje
ensamblaje_completo();

// Anotaciones
if ($preview) {
    color("Black")
    translate([-70, -100, 400])
        text("PERMEÁMETRO REV.I", size = 8);
    
    color("Black")
    translate([-70, -100, 385])
        text("Cilindro bridado 1/2\" pared", size = 6);
        
    color("Black")
    translate([-70, -100, 370])
        text("4 boquillas latón", size = 6);
}

// ============================================
// NOTAS DE FABRICACIÓN
// ============================================

/*
COMPONENTES A IMPRIMIR (6 piezas PETG):

1. CILINDRO BRIDADO
   - Peso: ~600g
   - Tiempo: ~40 horas
   - Requiere impresora Z > 320mm
   - Orientación: Vertical
   - Walls: 6 mínimo
   - Infill: 60%
   
2. TAPA MACHO SUPERIOR
   - Peso: ~150g
   - Tiempo: ~12 horas
   - Orientación: Brida en cama
   
3. TAPA MACHO INFERIOR
   - Peso: ~150g
   - Tiempo: ~12 horas
   - Orientación: Brida en cama

4. DIFUSOR SUPERIOR
   - Peso: ~20g
   - Tiempo: ~2 horas
   
5. DIFUSOR INFERIOR
   - Peso: ~20g
   - Tiempo: ~2 horas
   
6. BASE
   - Peso: ~200g
   - Tiempo: ~15 horas

TOTAL IMPRESIÓN: ~1140g PETG, ~83 horas

COMPONENTES A COMPRAR:

4× BOQUILLAS LATÓN:
  - 2× Boquilla 1/4" NPT con espiga manguera (flujo)
  - 2× Boquilla 1/8" NPT (instrumentación)
  
2× O-RINGS:
  - Viton Ø58mm × 4mm sección
  
16× PERNOS M6×35mm acero inox
32× ARANDELAS M6
16× TUERCAS M6 autoblocante
3× PATAS NIVELADORAS M8

2× MANÓMETROS DIGITALES 0-3 bar

DIMENSIONES CLAVE:
- Diámetro interior: 63mm
- Espesor pared: 12.7mm (1/2")
- Diámetro exterior: 88.4mm
- Altura cilindro: 300mm
- Altura total: ~370mm
*/
