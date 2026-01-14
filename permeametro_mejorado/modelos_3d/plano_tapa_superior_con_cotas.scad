/*
 * PLANO TÉCNICO - TAPA SUPERIOR (Annotated)
 */

use <01_tapa_superior.scad>
use <lib_cotas.scad>

// Configuración de visualización
$fn = 100;

// === VISTA SUPERIOR (Izquierda) ===
translate([-80, 0, 0]) {
    // Proyección de la geometría
    projection(cut = false) 
        tapa_completa();
    
    // -- COTAS --
    color("blue") {
        // Diámetro Exterior
        cota_diametro([0,0], 120, 45, "120");
        
        // PCD Pernos
        cota_diametro([0,0], 95, 135, "95 (PCD)");
        
        // Diámetro Canal O-ring
        cota([35,0], [-35,0], "Ø 70 (Canal)", offset=-50);
        
        // Detalle Pernos
        etiqueta([95/2, 0], [70, 20], "8x Ø6.5 Pasante");
    }
    
    // Título de la vista
    translate([0, -80]) 
        text("VISTA SUPERIOR", halign="center", size=5);
}

// === VISTA DE CORTE A-A (Derecha) ===
translate([80, 0, 0]) {
    // Corte transversal
    projection(cut = true) 
        rotate([0, 90, 0]) 
            tapa_completa();
            
    // -- COTAS --
    color("blue") {
        // Espesor Total
        cota([60, 11.5], [60, -11.5], "23", offset=15);
        
        // Espesor Tapa
        cota([-60, 11.5], [-60, -3.5], "15", offset=-15);
        
        // Canal O-ring (Detalle Crítico)
        // Nota: Coordenadas ajustadas según el modelo rotado
        // Profundidad 2.5mm
        etiqueta([35, 1], [50, 20], "Prof. 2.5");
        
        // Ancho 6mm
        cota([32, 3], [38, 3], "6.0", offset=5);
    }
    
    // Línea de centro
    color("red") linea([-70, 0], [70, 0], 0.2);
    
    // Título de la vista
    translate([0, -80]) 
        text("CORTE A-A", halign="center", size=5);
}

// === MARCO Y FORMATO ===
color("black") {
    translate([-160, -100])
        marco_plano(320, 220, "PERMEAMETRO MEJORADO", "TAPA SUPERIOR (PRM-001)");
}
