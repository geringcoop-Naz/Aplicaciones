/*
 * PERMEÁMETRO REV.I - DIFUSOR
 * Disco perforado para distribución uniforme del flujo
 * Se usa tanto arriba como abajo
 */

// ============================================
// PARÁMETROS
// ============================================

diametro_difusor = 60;     // mm (cabe dentro del cilindro Ø63mm)
espesor = 3;               // mm

// Perforaciones
diametro_perforacion = 3;  // mm

$fn = $preview ? 30 : 60;

// ============================================
// MODELO
// ============================================

module difusor() {
    difference() {
        // Disco base
        cylinder(h = espesor, d = diametro_difusor);
        
        // Perforación central (más grande)
        translate([0, 0, -1])
            cylinder(h = espesor + 2, d = 10);
        
        // Anillo 1: 6 perforaciones a R = 10mm
        for (i = [0 : 5]) {
            rotate([0, 0, i * 60])
                translate([10, 0, -1])
                    cylinder(h = espesor + 2, d = diametro_perforacion);
        }
        
        // Anillo 2: 12 perforaciones a R = 18mm
        for (i = [0 : 11]) {
            rotate([0, 0, i * 30])
                translate([18, 0, -1])
                    cylinder(h = espesor + 2, d = diametro_perforacion);
        }
        
        // Anillo 3: 18 perforaciones a R = 26mm
        for (i = [0 : 17]) {
            rotate([0, 0, i * 20])
                translate([26, 0, -1])
                    cylinder(h = espesor + 2, d = diametro_perforacion);
        }
    }
}

// Renderizar
difusor();

/*
NOTAS DE IMPRESIÓN:

ORIENTACIÓN: Plano (como está)
MATERIAL: PETG
ALTURA CAPA: 0.1mm (alta calidad para perforaciones limpias)
PAREDES: 3
RELLENO: 30%
SOPORTES: NO necesarios
ADHESIÓN: Brim 3mm

PESO ESTIMADO: ~20g
TIEMPO: ~2 horas

IMPRIMIR 2 UNIDADES:
- Difusor SUPERIOR (bajo tapa superior)
- Difusor INFERIOR (sobre tapa inferior)

POST-PROCESO:
1. Remover brim
2. Limpiar perforaciones (pueden quedar con hilos)
3. Usar broca Ø3mm manual si es necesario
4. Verificar que fluido pasa por todas las perforaciones

FUNCIÓN:
- Distribuye fluido uniformemente sobre la muestra
- Evita canalización preferencial
- Protege muestra de erosión directa

INSTALACIÓN:
- Se asienta suelto dentro del cilindro
- Apoyado sobre un borde o ring
- O pegado a cara interna de las tapas
*/
