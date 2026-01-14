/*
 * PERMEÁMETRO MEJORADO - BASE CON SOPORTE
 * 
 * Componente: Base inferior con sistema de drenaje y patas niveladoras
 * Material: Acrílico o PVC
 * Función: Soporte, drenaje y nivelación del permeámetro
 */

// ============================================
// PARÁMETROS
// ============================================

// Dimensiones de la columna
diametro_interno_columna = 63.0;
diametro_externo_columna = 73.0;

// Base
diametro_base = 110;              // mm
espesor_base = 10;                // mm

// Puerto de salida
diametro_puerto_salida = 8;       // mm
posicion_lateral_puerto = 35;     // mm desde centro
altura_puerto = 5;                // mm desde base

// Patas niveladoras (3 unidades a 120°)
numero_patas = 3;
diametro_perno_pata = 8.5;        // mm - Para M8
diametro_circulo_patas = 85;      // mm
profundidad_rosca_pata = 12;      // mm

// Cámara de sedimentación
altura_camara = 10;               // mm

// Calidad
$fn = 100;

// ============================================
// MÓDULOS
// ============================================

// Cuerpo principal de la base
module cuerpo_base() {
    difference() {
        // Disco principal
        cylinder(h = espesor_base, d = diametro_base);
        
        // Rebaje para cámara de sedimentación
        translate([0, 0, espesor_base - altura_camara + 0.01])
            cylinder(h = altura_camara, d = diametro_interno_columna);
    }
}

// Puerto de salida lateral
module puerto_salida() {
    rotate([0, 90, 0])
        translate([-(espesor_base - altura_puerto), posicion_lateral_puerto, -0.1])
            cylinder(h = diametro_base/2, d = diametro_puerto_salida);
}

// Perforaciones para patas niveladoras
module perforaciones_patas() {
    for (i = [0:numero_patas-1]) {
        rotate([0, 0, i * 360/numero_patas])
            translate([diametro_circulo_patas/2, 0, -1])
                cylinder(h = profundidad_rosca_pata + 1, d = diametro_perno_pata);
    }
}

// Rejilla de soporte (opcional - previene colapso del suelo)
module rejilla_soporte() {
    translate([0, 0, espesor_base - altura_camara - 1]) {
        // Anillo de soporte
        difference() {
            cylinder(h = 1, d = diametro_interno_columna - 1);
            translate([0, 0, -0.5])
                cylinder(h = 2, d = diametro_interno_columna - 8);
        }
        
        // Barras radiales
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([0, -1, 0])
                    cube([diametro_interno_columna/2 - 4, 2, 1]);
        }
    }
}

// ============================================
// ENSAMBLAJE
// ============================================

module base_completa() {
    difference() {
        union() {
            // Cuerpo principal
            cuerpo_base();
            
            // Rejilla de soporte
            rejilla_soporte();
        }
        
        // Puerto de salida
        puerto_salida();
        
        // Perforaciones para patas
        perforaciones_patas();
    }
}

// ============================================
// RENDERIZADO
// ============================================

base_completa();

// Mostrar patas (para visualización, no para fabricar)
/*
color("gray") {
    for (i = [0:numero_patas-1]) {
        rotate([0, 0, i * 360/numero_patas])
            translate([diametro_circulo_patas/2, 0, -40])
                cylinder(h = 40, d = 7);
    }
}
*/

/*
 * NOTAS DE FABRICACIÓN:
 * 
 * COMPONENTES DE LA BASE:
 * 1. Disco principal (este modelo)
 * 2. Patas niveladoras M8 × 60mm (compradas separadamente)
 * 3. Inserto roscado para puerto de salida
 * 
 * PROCESO DE FABRICACIÓN:
 * 1. Cortar disco de Ø110mm × 10mm
 * 2. Mecanizar rebaje para cámara de sedimentación
 * 3. Fabricar o comprar rejilla de soporte
 * 4. Perforar puerto lateral (ángulo 15° hacia abajo opcional)
 * 5. Perforar 3 agujeros para patas (roscar M8 si es posible)
 * 6. Instalar inserto roscado en puerto de salida
 * 
 * ENSAMBLAJE:
 * - La base puede pegarse al cuerpo de la columna
 * - O usar sistema modular con O-rings (similar a la tapa)
 * - Las patas se atornillan desde abajo
 * 
 * PATAS NIVELADORAS (comprar):
 * - Tornillos M8 × 60mm con punta de nylon
 * - Contratuercas M8 de seguridad
 * - Rango de ajuste: ±10mm
 * 
 * REJILLA FILTRANTE:
 * - Se coloca sobre la rejilla de soporte
 * - Malla 100-200 mesh
 * - Evita salida de partículas finas
 * - Debe ser removible para limpieza
 */
