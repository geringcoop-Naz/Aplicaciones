/*
 * PERMEÁMETRO MEJORADO - BRIDA INFERIOR
 * 
 * Componente: Brida que se pega al cuerpo de la columna
 * Material: Acrílico o PVC
 * Espesor: 8mm
 * Función: Proporciona puntos de sujeción para los pernos
 */

// ============================================
// PARÁMETROS (deben coincidir con la tapa)
// ============================================

diametro_interno_columna = 63.0;  // mm
diametro_externo_columna = 73.0;  // mm
diametro_brida = 110;             // mm
espesor_brida = 8;                // mm

// Pernos
numero_pernos = 8;
diametro_perno = 6.5;             // mm
diametro_circulo_pernos = 95;     // mm

// Calidad
$fn = 100;

// ============================================
// CONSTRUCCIÓN
// ============================================

module brida_inferior() {
    difference() {
        // Disco principal
        cylinder(h = espesor_brida, d = diametro_brida, center = false);
        
        // Perforación central para el tubo
        translate([0, 0, -1])
            cylinder(h = espesor_brida + 2, d = diametro_externo_columna + 0.5, center = false);
        
        // Perforaciones para pernos (alineadas con la tapa)
        for (i = [0:numero_pernos-1]) {
            rotate([0, 0, i * 360/numero_pernos])
                translate([diametro_circulo_pernos/2, 0, -1])
                    cylinder(h = espesor_brida + 2, d = diametro_perno, center = false);
        }
    }
}

// ============================================
// RENDERIZADO
// ============================================

brida_inferior();

/*
 * NOTAS DE FABRICACIÓN:
 * 
 * Esta brida se pega al borde superior del cuerpo de la columna.
 * 
 * INSTALACIÓN:
 * 1. Refrentar el borde superior del tubo (perpendicular)
 * 2. Limpiar ambas superficies con alcohol
 * 3. Aplicar solvente para acrílico (Weld-On #4)
 * 4. Centrar la brida sobre el tubo
 * 5. Presionar uniformemente
 * 6. Dejar curar 24 horas
 * 7. Verificar alineación de perforaciones con tapa
 * 
 * ALTERNATIVA SIN PEGADO:
 * Usar dos bridas (superior e inferior) con barras roscadas
 * que atraviesen el cuerpo de la columna verticalmente.
 */
