/*
 * PERMEÁMETRO MEJORADO - DISEÑO REV.G
 * Componente: CUERPO CON BRIDA INTEGRADA (1 PIEZA)
 * 
 * Innovación: Cilindro + brida superior integrados
 * Elimina necesidad de brida separada pegada
 * Más robusto, una sola impresión continua
 */

// ============================================
// PARÁMETROS GLOBALES
// ============================================

// Cilindro principal
diametro_exterior_cilindro = 73.0;    // mm
diametro_interior_cilindro = 63.0;    // mm
altura_cilindro = 300;                 // mm
espesor_pared = (diametro_exterior_cilindro - diametro_interior_cilindro) / 2;

// Brida integrada en el borde superior
diametro_brida = 110;                  // mm
espesor_brida = 8;                     // mm
pcd_pernos = 95;                       // mm (Pitch Circle Diameter)
diametro_agujero_perno = 6.5;          // mm (M6 con holgura)
numero_pernos = 8;

// Puertos de medición de presión
altura_puerto_p1 = 50;                 // mm desde base
altura_puerto_p2 = 250;                // mm desde base
diametro_puerto_medicion = 5.0;        // mm (para inserto 1/8" NPT)

// Base (refuerzo en borde inferior)
altura_base_refuerzo = 10;             // mm
diametro_base = 80;                    // mm

// Resolución
$fn = $preview ? 30 : 80;

// ============================================
// MÓDULO PRINCIPAL
// ============================================

module cuerpo_con_brida() {
    difference() {
        union() {
            // Cilindro principal
            translate([0, 0, 0])
                cylinder(h = altura_cilindro, 
                        d = diametro_exterior_cilindro);
            
            // Brida integrada en el borde superior
            translate([0, 0, altura_cilindro])
                cylinder(h = espesor_brida, 
                        d = diametro_brida);
            
            // Refuerzo en base (opcional, para estabilidad)
            translate([0, 0, 0])
                cylinder(h = altura_base_refuerzo, 
                        d1 = diametro_base, 
                        d2 = diametro_exterior_cilindro);
        }
        
        // Cavidad interior (hueco del cilindro)
        translate([0, 0, -0.5])
            cylinder(h = altura_cilindro + 1, 
                    d = diametro_interior_cilindro);
        
        // Agujeros para pernos en la brida
        for (i = [0 : numero_pernos - 1]) {
            angulo = i * 360 / numero_pernos;
            rotate([0, 0, angulo])
                translate([pcd_pernos/2, 0, altura_cilindro - 0.5])
                    cylinder(h = espesor_brida + 1, 
                            d = diametro_agujero_perno);
        }
        
        // Puerto de medición P1 (inferior)
        translate([diametro_exterior_cilindro/2, 0, altura_puerto_p1])
            rotate([0, 90, 0])
                cylinder(h = espesor_pared + 1, 
                        d = diametro_puerto_medicion, 
                        center = true);
        
        // Puerto de medición P2 (superior)
        translate([diametro_exterior_cilindro/2, 0, altura_puerto_p2])
            rotate([0, 90, 0])
                cylinder(h = espesor_pared + 1, 
                        d = diametro_puerto_medicion, 
                        center = true);
    }
}

// ============================================
// VISUALIZACIÓN
// ============================================

// Vista de corte para preview (opcional)
if ($preview) {
    difference() {
        cuerpo_con_brida();
        // Corte para ver interior
        // translate([-100, 0, -1])
        //     cube([100, 200, 400]);
    }
} else {
    cuerpo_con_brida();
}

// ============================================
// NOTAS DE FABRICACIÓN
// ============================================

/*
ESPECIFICACIONES DE IMPRESIÓN 3D:

Material: PETG
Orientación: VERTICAL (brida arriba)
Layer Height: 0.2mm
Walls: 5 (mínimo)
Infill: 40-50%
Supports: Mínimos, solo si overhang en brida >50°
Adhesión: BRIM 10-15mm + RAFT recomendado
Temperatura nozzle: 240°C
Temperatura cama: 80°C
Velocidad: 35-40mm/s (pieza alta, reducir warping)

IMPORTANTE:
- Requiere impresora con altura Z ≥ 320mm
- Usar enclosure cerrado (control temperatura)
- Aplicar adhesivo en cama (glue stick o laca)
- Monitorear primeras 20 capas cuidadosamente

ESTIMACIONES:
- Peso: ~350g de PETG
- Tiempo: 24-28 horas
- Costo material: ~$9 USD

POST-PROCESAMIENTO:
1. Remover soportes (si aplica)
2. Limpiar agujeros de pernos con broca Ø6.5mm
3. Limpiar puertos de presión con broca Ø5mm
4. Lijar cara superior de brida con grano 400
5. Verificar que interior está limpio

ALTERNATIVA (Impresora pequeña):
- Dividir en 2 secciones:
  * Sección inferior: 200mm
  * Sección superior con brida: 108mm
- Pegar con solvente acrílico IPS Weld-On #4
- Reforzar junta interior con epoxi si es necesario

TOLERANCIAS CRÍTICAS:
- Diámetro interior: 63.0 ±0.3mm (para plug Ø62mm)
- PCD pernos: 95.0 ±0.2mm (alineación con tapa)
- Agujeros pernos: Ø6.5mm +0.5/-0mm (pernos M6 entran fácil)
*/
