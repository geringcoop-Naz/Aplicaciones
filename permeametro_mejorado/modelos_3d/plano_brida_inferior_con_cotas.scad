/*
 * PLANO TÉCNICO - BRIDA INFERIOR (Annotated)
 */

use <02_brida_inferior.scad>
use <lib_cotas.scad>

$fn = 100;

// === VISTA SUPERIOR ===
translate([0, 20, 0]) {
    projection(cut = false)
        brida_inferior();
        
    color("blue") {
        // Ø Exterior
        cota_diametro([0,0], 110, 20, "110");
        
        // Ø Interior (Paso de columna)
        cota([-36.75, 0], [36.75, 0], "73.5 (Holgura)", offset=-10);
        
        // PCD (Crítico)
        //cota_diametro([0,0], 95, 150, "95 (PCD)");
        
        // Espesor (Indicado en etiqueta ya que es vista plana)
        etiqueta([55, 0], [70, -30], "Espesor: 8mm");
        
        // Pernos
        etiqueta([95/2, 0], [70, 20], "8x Ø6.5 Pasante");
    }
    
    translate([0, -70]) 
        text("VISTA SUPERIOR", halign="center", size=5);
}

// === VISTA LATERAL (Simple) ===
translate([0, -40, 0]) {
    projection(cut = true)
        rotate([0, 90, 0])
             brida_inferior();
             
 //   color("blue") {
  //      cota([55, 4], [55, -4], "8", offset=10);
    //}
}

// === MARCO ===
color("black") {
    translate([-110, -110])
        marco_plano(220, 200, "PERMEAMETRO MEJORADO", "BRIDA INFERIOR (PRM-002)");
}
