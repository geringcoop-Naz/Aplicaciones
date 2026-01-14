/*
 * PERMEÁMETRO MEJORADO - ENSAMBLAJE COMPLETO
 * Versión funcional sin errores de importación
 */

// ============================================
// PARÁMETROS GLOBALES
// ============================================

diametro_interno_columna = 63.0;
diametro_externo_columna = 73.0;
altura_columna = 300;  // mm

// Controles de visualización
mostrar_tapa = true;
mostrar_brida = true;
mostrar_cuerpo = true;
mostrar_difusor = true;
mostrar_base = true;
mostrar_oring = true;
mostrar_pernos = true;

$fn = 80;

// ============================================
// IMPORTAR MÓDULOS (usar 'use' en lugar de 'import')
// ============================================

use <01_tapa_superior.scad>
use <02_brida_inferior.scad>
use <03_difusor_entrada.scad>
use <04_base_inferior.scad>

// ============================================
// ENSAMBLAJE
// ============================================

// Tapa superior
if (mostrar_tapa) {
    color("SkyBlue", 0.7)
        translate([0, 0, altura_columna])
            tapa_completa();
}

// Brida inferior (pegada al borde superior del cuerpo)
if (mostrar_brida) {
    color("SteelBlue", 0.7)
        translate([0, 0, altura_columna - 8])
            brida_inferior();
}

// Difusor de entrada (montado a la tapa)
if (mostrar_difusor) {
    color("Silver", 0.9)
        translate([0, 0, altura_columna + 15 - 2])
            difusor();
}

// Base inferior
if (mostrar_base) {
    color("LightSteelBlue", 0.7)
        translate([0, 0, -10])
            base_completa();
}

// Cuerpo de la columna (tubo transparente)
if (mostrar_cuerpo) {
    color("WhiteSmoke", 0.3)
        difference() {
            cylinder(h = altura_columna, d = diametro_externo_columna);
            translate([0, 0, -1])
                cylinder(h = altura_columna + 2, d = diametro_interno_columna);
        }
}

// O-ring de sellado (visualización)
if (mostrar_oring) {
    color("Black", 0.9)
        translate([0, 0, altura_columna + 15 - 2.5])
            rotate_extrude(convexity = 10)
                translate([70/2, 0, 0])
                    circle(d = 5);
}

// Pernos M6 (visualización simplificada)
if (mostrar_pernos) {
    color("DarkGray", 0.8)
        for (i = [0:7]) {
            rotate([0, 0, i * 45])
                translate([95/2, 0, altura_columna - 8])
                    cylinder(h = 23, d = 6);
        }
}

/*
 * NOTAS:
 * - Use F5 para preview rápido
 * - Use F6 para render completo (más lento pero mejor calidad)
 * - Modifique los valores true/false arriba para mostrar/ocultar componentes
 */
