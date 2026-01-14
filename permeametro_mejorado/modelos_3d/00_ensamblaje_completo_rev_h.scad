/*
 * PERMEÁMETRO - DISEÑO FINAL REV.H
 * ENSAMBLAJE COMPLETO CORREGIDO
 * 
 * CONFIGURACIÓN:
 * - Cilindro: Tubo acrílico comercial Ø73×300mm (COMPRADO)
 * - Tapas superior/inferior: Impresión 3D con O-rings
 * - Bridas superior/inferior: Impresión 3D (sistema apriete)
 * - Difusores superior/inferior: Impresión 3D
 * - Base: Impresión 3D
 * - 2 puertos presión en cilindro
 * - Puertos entrada/salida en tapas
 */

// ============================================
// PARÁMETROS GLOBALES
// ============================================

// Cilindro principal (TUBO COMERCIAL)
diametro_exterior_cilindro = 73.0;
diametro_interior_cilindro = 63.0;
altura_cilindro = 300;

// Tapas (superior e inferior - IMPRESAS)
diametro_tapa = 100;
espesor_tapa = 15;
diametro_puerto_flujo = 8;  // 1/4" NPT

// Bridas de apriete (IMPRESAS)
diametro_brida = 110;
espesor_brida = 8;
pcd_pernos = 95;
numero_pernos = 8;
diametro_agujero_perno = 6.5;  // M6

// Difusores (IMPRESOS)
diametro_difusor = 50;
espesor_difusor = 2;
numero_perforaciones_difusor = 37;

// O-rings (COMPRADOS)
diametro_oring = 67;
seccion_oring = 5;

// Base (IMPRESA)
diametro_base = 110;
altura_base = 20;

// Puertos de medición (en cilindro)
altura_puerto_p1 = 50;
altura_puerto_p2 = 250;

// Controles visualización
mostrar_cilindro = true;
mostrar_tapa_superior = true;
mostrar_tapa_inferior = true;
mostrar_brida_superior = true;
mostrar_brida_inferior = true;
mostrar_difusor_superior = true;
mostrar_difusor_inferior = true;
mostrar_base = true;
mostrar_orings = true;
mostrar_pernos = true;

modo_explosionado = false;
distancia_explosion = 40;

$fn = $preview ? 30 : 60;

// ============================================
// MÓDULOS DE COMPONENTES
// ============================================

// TAPA SUPERIOR con puerto entrada
module tapa_superior() {
    difference() {
        union() {
            // Disco principal
            cylinder(h = espesor_tapa, d = diametro_tapa);
            
            // Reborde de sellado (se inserta en cilindro)
            translate([0, 0, espesor_tapa])
                cylinder(h = 5, d = diametro_interior_cilindro - 1);
        }
        
        // Puerto entrada central
        translate([0, 0, -1])
            cylinder(h = espesor_tapa + 10, d = diametro_puerto_flujo);
        
        // Agujeros para pernos
        for (i = [0:numero_pernos-1]) {
            rotate([0, 0, i * 360/numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_tapa + 2, d = diametro_agujero_perno);
        }
        
        // Canal O-ring
        translate([0, 0, espesor_tapa + 2.5])
            rotate_extrude()
                translate([(diametro_interior_cilindro - 1)/2 - 3, 0, 0])
                    square([6, 2.5]);
    }
}

// TAPA INFERIOR con puerto salida
module tapa_inferior() {
    difference() {
        union() {
            // Disco principal
            cylinder(h = espesor_tapa, d = diametro_tapa);
            
            // Reborde de sellado
            translate([0, 0, espesor_tapa])
                cylinder(h = 5, d = diametro_interior_cilindro - 1);
        }
        
        // Puerto salida lateral
        translate([diametro_tapa/2 - 5, 0, espesor_tapa/2])
            rotate([0, 90, 0])
                cylinder(h = 10, d = diametro_puerto_flujo);
        
        // Agujeros para pernos
        for (i = [0:numero_pernos-1]) {
            rotate([0, 0, i * 360/numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_tapa + 2, d = diametro_agujero_perno);
        }
        
        // Canal O-ring
        translate([0, 0, espesor_tapa + 2.5])
            rotate_extrude()
                translate([(diametro_interior_cilindro - 1)/2 - 3, 0, 0])
                    square([6, 2.5]);
    }
}

// BRIDA (superior o inferior - mismo diseño)
module brida() {
    difference() {
        cylinder(h = espesor_brida, d = diametro_brida);
        
        // Agujero central para cilindro
        translate([0, 0, -1])
            cylinder(h = espesor_brida + 2, d = diametro_exterior_cilindro + 0.5);
        
        // Agujeros para pernos
        for (i = [0:numero_pernos-1]) {
            rotate([0, 0, i * 360/numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
    }
}

// DIFUSOR perforado
module difusor() {
    difference() {
        cylinder(h = espesor_difusor, d = diametro_difusor);
        
        // Perforación central
        translate([0, 0, -1])
            cylinder(h = espesor_difusor + 2, d = 8);
        
        // Perforaciones en anillos
        // Anillo 1: 6 perforaciones @ R8mm
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
                translate([8, 0, -1])
                    cylinder(h = espesor_difusor + 2, d = 2);
        }
        
        // Anillo 2: 12 perforaciones @ R16mm
        for (i = [0:11]) {
            rotate([0, 0, i * 30])
                translate([16, 0, -1])
                    cylinder(h = espesor_difusor + 2, d = 2);
        }
        
        // Anillo 3: 18 perforaciones @ R24mm
        for (i = [0:17]) {
            rotate([0, 0, i * 20])
                translate([24, 0, -1])
                    cylinder(h = espesor_difusor + 2, d = 2);
        }
        
        // 4 agujeros montaje
        for (i = [0:3]) {
            rotate([0, 0, i * 90 + 45])
                translate([21, 0, -1])
                    cylinder(h = espesor_difusor + 2, d = 3.2);
        }
    }
}

// BASE de soporte
module base() {
    difference() {
        cylinder(h = altura_base, d = diametro_base);
        
        // Cavidad central
        translate([0, 0, 5])
            cylinder(h = altura_base, d = diametro_exterior_cilindro + 0.5);
        
        // 3 agujeros para patas niveladoras
        for (i = [0:2]) {
            rotate([0, 0, i * 120])
                translate([85/2, 0, -1])
                    cylinder(h = altura_base + 2, d = 8.5);
        }
    }
}

// CILINDRO (visualización - comprado)
module cilindro_comercial() {
    color("LightBlue", 0.3)
    difference() {
        cylinder(h = altura_cilindro, d = diametro_exterior_cilindro);
        translate([0, 0, -1])
            cylinder(h = altura_cilindro + 2, d = diametro_interior_cilindro);
            
        // Puertos de medición
        translate([diametro_exterior_cilindro/2, 0, altura_puerto_p1])
            rotate([0, 90, 0])
                cylinder(h = 10, d = 5, center = true);
                
        translate([diametro_exterior_cilindro/2, 0, altura_puerto_p2])
            rotate([0, 90, 0])
                cylinder(h = 10, d = 5, center = true);
    }
}

// O-RING visualización
module oring_visual(pos_z) {
    color("Black")
    translate([0, 0, pos_z])
        rotate_extrude()
            translate([diametro_oring/2, 0, 0])
                circle(d = seccion_oring);
}

// PERNOS visualización
module pernos_conjunto(pos_z) {
    color("Silver")
    for (i = [0:numero_pernos-1]) {
        rotate([0, 0, i * 360/numero_pernos])
            translate([pcd_pernos/2, 0, pos_z]) {
                // Cabeza
                cylinder(h = 4, d = 10, $fn=6);
                // Vástago
                translate([0, 0, -30])
                    cylinder(h = 30, d = 6);
            }
    }
}

// ============================================
// ENSAMBLAJE COMPLETO
// ============================================

module ensamblaje_completo() {
    offset = modo_explosionado ? distancia_explosion : 0;
    
    // BASE (z=0)
    if (mostrar_base) {
        color("SteelBlue")
        base();
    }
    
    // BRIDA INFERIOR (sobre la base)
    if (mostrar_brida_inferior) {
        color("Orange")
        translate([0, 0, altura_base - offset])
            brida();
    }
    
    // CILINDRO COMERCIAL
    if (mostrar_cilindro) {
        translate([0, 0, altura_base])
            cilindro_comercial();
    }
    
    // DIFUSOR INFERIOR
    if (mostrar_difusor_inferior) {
        color("Gray")
        translate([0, 0, altura_base + 10 - offset])
            difusor();
    }
    
    // TAPA INFERIOR
    if (mostrar_tapa_inferior) {
        color("DodgerBlue")
        translate([0, 0, altura_base - offset])
            rotate([0, 180, 0])
                tapa_inferior();
    }
    
    // O-RING INFERIOR
    if (mostrar_orings) {
        oring_visual(altura_base + 17);
    }
    
    // DIFUSOR SUPERIOR
    if (mostrar_difusor_superior) {
        color("Gray")
        translate([0, 0, altura_base + altura_cilindro - 10 + offset])
            difusor();
    }
    
    // TAPA SUPERIOR
    if (mostrar_tapa_superior) {
        color("RoyalBlue")
        translate([0, 0, altura_base + altura_cilindro + offset])
            tapa_superior();
    }
    
    // O-RING SUPERIOR
    if (mostrar_orings) {
        oring_visual(altura_base + altura_cilindro + 17);
    }
    
    // BRIDA SUPERIOR (sobre cilindro)
    if (mostrar_brida_superior) {
        color("Orange")
        translate([0, 0, altura_base + altura_cilindro + offset])
            brida();
    }
    
    // PERNOS SUPERIORES
    if (mostrar_pernos) {
        pernos_conjunto(altura_base + altura_cilindro + espesor_brida + offset);
    }
    
    // PERNOS INFERIORES
    if (mostrar_pernos) {
        pernos_conjunto(altura_base + espesor_brida - offset);
    }
}

// ============================================
// VISUALIZACIÓN
// ============================================

ensamblaje_completo();

// Anotaciones
if ($preview) {
    color("Black")
    translate([-60, -80, 380])
        text("PERMEÁMETRO REV.H", size = 7);
    
    color("Black")
    translate([-60, -80, 370])
        text("Sistema Completo", size = 5);
}

/*
COMPONENTES A IMPRIMIR (7 piezas):
1. Tapa superior → export STL
2. Tapa inferior → export STL
3. Brida superior → export STL
4. Brida inferior → export STL
5. Difusor superior → export STL
6. Difusor inferior → export STL
7. Base → export STL

COMPONENTES A COMPRAR:
- Cilindro acrílico Ø73×300mm (tubo comercial)
- 2× O-rings Viton Ø67×5mm
- 16× Pernos M6×30mm
- 16× Arandelas M6
- 16× Tuercas M6
- 3× Patas niveladoras M8
- 2× Insertos 1/8" NPT (puertos presión)
- 2× Fittings 1/4" NPT (puertos flujo)

TOTAL MATERIAL IMPRESIÓN: ~400g PETG
TOTAL TIEMPO: ~35 horas
*/
