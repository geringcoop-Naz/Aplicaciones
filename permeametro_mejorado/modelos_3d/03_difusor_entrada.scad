/*
 * PERMEÁMETRO MEJORADO - DIFUSOR DE ENTRADA
 * 
 * Componente: Placa perforada para distribución uniforme del flujo
 * Material: Acero inoxidable 316 o HDPE
 * Espesor: 2mm
 * Ubicación: Debajo del puerto de entrada en la tapa
 */

// ============================================
// PARÁMETROS
// ============================================

// Dimensiones principales
diametro_difusor = 50;            // mm
espesor_difusor = 2;              // mm
diametro_perforacion_central = 8; // mm - para paso del puerto

// Perforaciones de distribución
numero_anillos = 3;               // Anillos concéntricos de perforaciones
diametro_perforacion = 2;         // mm - tamaño de cada agujero
espaciado_radial = 8;             // mm - entre anillos

// Tornillos de montaje
numero_tornillos_montaje = 4;
diametro_tornillo = 3.2;          // mm - Para M3
diametro_circulo_tornillos = 42;  // mm

// Calidad
$fn = 50;

// ============================================
// MÓDULOS
// ============================================

// Perforaciones de distribución en patrón concéntrico
module perforaciones_flujo() {
    // Perforación central
    translate([0, 0, -1])
        cylinder(h = espesor_difusor + 2, d = diametro_perforacion_central);
    
    // Anillos concéntricos
    for (anillo = [1:numero_anillos]) {
        numero_perfs_anillo = anillo * 6; // Más perforaciones en anillos externos
        radio_anillo = anillo * espaciado_radial;
        
        for (i = [0:numero_perfs_anillo-1]) {
            rotate([0, 0, i * 360/numero_perfs_anillo])
                translate([radio_anillo, 0, -1])
                    cylinder(h = espesor_difusor + 2, d = diametro_perforacion);
        }
    }
}

// Perforaciones para tornillos de montaje
module perforaciones_montaje() {
    for (i = [0:numero_tornillos_montaje-1]) {
        rotate([0, 0, i * 360/numero_tornillos_montaje + 45])
            translate([diametro_circulo_tornillos/2, 0, -1])
                cylinder(h = espesor_difusor + 2, d = diametro_tornillo);
    }
}

// ============================================
// CONSTRUCCIÓN
// ============================================

module difusor() {
    difference() {
        // Disco base
        cylinder(h = espesor_difusor, d = diametro_difusor, center = false);
        
        // Perforaciones de distribución
        perforaciones_flujo();
        
        // Perforaciones de montaje
        perforaciones_montaje();
    }
}

// ============================================
// RENDERIZADO
// ============================================

difusor();

// Vista de las perforaciones (para verificar)
// color("blue", 0.3) difusor();
// color("red", 1.0) perforaciones_flujo();

/*
 * NOTAS DE FABRICACIÓN:
 * 
 * MATERIAL RECOMENDADO:
 * - Acero inoxidable 316L (corte láser o punzonado)
 * - Alternativa: HDPE mecanizado (más económico)
 * 
 * PROCESO:
 * 1. Corte láser de disco Ø50mm
 * 2. Perforación de patrón concéntrico (plantilla CNC)
 * 3. Desbarbado de perforaciones
 * 4. Acabado superficial (pulido ligero)
 * 
 * PATRÓN DE PERFORACIONES:
 * - Anillo 1 (8mm radio): 6 perforaciones
 * - Anillo 2 (16mm radio): 12 perforaciones
 * - Anillo 3 (24mm radio): 18 perforaciones
 * - Total: 36 + 1 central = 37 perforaciones
 * 
 * FUNCIÓN:
 * Distribuir uniformemente el flujo de entrada sobre toda
 * la superficie del suelo, evitando canalización preferencial.
 * 
 * MONTAJE:
 * Se atornilla a la cara inferior de la tapa superior usando
 * 4 tornillos M3 × 10mm de acero inoxidable.
 */
