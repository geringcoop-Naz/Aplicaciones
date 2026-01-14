/*
 * PLANO TÉCNICO - DIFUSOR (Annotated)
 */

use <03_difusor_entrada.scad>
use <lib_cotas.scad>

$fn = 100;

translate([0, 10, 0]) {
    projection(cut = false)
        difusor();
        
    color("blue") {
        // Diámetro del disco
       // cota_diametro([0,0], 50, 45, "50");
        
        // Perforación central
      //  cota([-4,0], [4,0], "Ø 8", offset=15);
        
        // Perforaciones de montaje
       // cota_diametro([0,0], 42, 135, "42 (Montaje)");
        etiqueta([21*cos(45), 21*sin(45)], [35, 30], "4x Ø3.2 (M3)");
        
        // Patrón de perforaciones
        etiqueta([8, 0], [40, 10], "Anillo 1 (R8) - 6x");
        etiqueta([16, 0], [40, 0], "Anillo 2 (R16) - 12x");
        etiqueta([24, 0], [40, -10], "Anillo 3 (R24) - 18x");
        
        etiqueta([0, -26], [0, -40], "Total: 37 perforaciones Ø2mm");
    }
    
    translate([0, 37]) 
        text("VISTA DE PLANTA", halign="center", size=4);
}

color("black") {
    translate([-80, -80])
        marco_plano(180, 160, "PERMEAMETRO MEJORADO", "DIFUSOR ENTRADA (PRM-007)");
}
