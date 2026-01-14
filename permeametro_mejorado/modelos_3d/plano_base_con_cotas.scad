/*
 * PLANO TÉCNICO - BASE INFERIOR (Annotated)
 */

use <04_base_inferior.scad>
use <lib_cotas.scad>

$fn = 100;

// === VISTA SUPERIOR ===
translate([-70, 0, 0]) {
    projection(cut = false)
        base_completa();
        
    color("blue") {
        cota_diametro([0,0], 110, 135, "110");
        cota_diametro([0,0], 85, 45, "85 (PCD Patas)");
        
        // Cámara
        cota([-31.5, 0], [31.5, 0], "Ø 63 (Cámara)", offset=-45);
        
        // Puerto salida
        etiqueta([0, 35], [-30, 45], "Puerto Salida Ø8");
        cota([0,0], [0,35], "35", offset=20);
        
        // Patas
        etiqueta([85/2, 0], [57, -20], "3x Ø8.5 (M8)");
    }
    translate([0, -70]) text("VISTA SUPERIOR", halign="center", size=5);
}

// === CORTE A-A ===
translate([70, 7, 0]) {
    projection(cut = true)
        rotate([0, 90, 0])
            base_completa();
            
    color("blue") {
        // Espesor
        cota([55, 5], [55, -5], "10", offset=15);
        
        // Profundidad cámara
        cota([-31.5, 5], [-31.5, -5], "10", offset=-10);
        
        // Puerto lateral
        etiqueta([0, 2], [20, 20], "Alt. 5mm");
    }
    
    color("red") linea([-60, 0], [60, 0], 0.2);
    translate([0, 57]) text("SECCIÓN A-A", halign="center", size=5);
}

color("black") {
    translate([-140, -90])
        marco_plano(280, 180, "PERMEAMETRO MEJORADO", "BASE INFERIOR (PRM-008)");
}
