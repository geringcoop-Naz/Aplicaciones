/*
 * PERMEÁMETRO REV.I - CILINDRO BRIDADO
 * Pared gruesa 1/2" (12.7mm)
 * Bridas integradas en ambos extremos
 * 2 puertos para instrumentación
 */

// ============================================
// PARÁMETROS
// ============================================

// Cilindro
diametro_interior = 63.0;           // mm
espesor_pared = 12.7;               // 1/2" = 12.7mm
diametro_exterior = diametro_interior + 2 * espesor_pared;  // 88.4mm
altura_cilindro = 300;              // mm

// Bridas integradas
diametro_brida = 120;               // mm
espesor_brida = 10;                 // mm
pcd_pernos = 105;                   // mm
numero_pernos = 8;
diametro_agujero_perno = 6.5;       // mm (M6)

// Puertos instrumentación (para boquillas latón 1/8" NPT)
diametro_puerto = 8;                // mm
altura_p1 = 50;                     // mm desde base
altura_p2 = 250;                    // mm desde base

$fn = $preview ? 40 : 100;

// ============================================
// MODELO
// ============================================

module cilindro_bridado() {
    difference() {
        union() {
            // Cilindro principal (pared gruesa)
            cylinder(h = altura_cilindro, d = diametro_exterior);
            
            // Brida INFERIOR (z = 0)
            cylinder(h = espesor_brida, d = diametro_brida);
            
            // Brida SUPERIOR
            translate([0, 0, altura_cilindro - espesor_brida])
                cylinder(h = espesor_brida, d = diametro_brida);
        }
        
        // Cavidad interior
        translate([0, 0, -1])
            cylinder(h = altura_cilindro + 2, d = diametro_interior);
        
        // Agujeros pernos BRIDA INFERIOR (8×)
        for (i = [0 : numero_pernos - 1]) {
            rotate([0, 0, i * 360 / numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
        
        // Agujeros pernos BRIDA SUPERIOR (8×)
        for (i = [0 : numero_pernos - 1]) {
            rotate([0, 0, i * 360 / numero_pernos])
                translate([pcd_pernos/2, 0, altura_cilindro - espesor_brida - 1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
        
        // PUERTO P1 - Instrumentación inferior
        translate([diametro_exterior/2, 0, altura_p1])
            rotate([0, 90, 0])
                cylinder(h = espesor_pared + 2, d = diametro_puerto, center = true);
        
        // PUERTO P2 - Instrumentación superior
        translate([diametro_exterior/2, 0, altura_p2])
            rotate([0, 90, 0])
                cylinder(h = espesor_pared + 2, d = diametro_puerto, center = true);
    }
}

// Renderizar
cilindro_bridado();

/*
NOTAS DE IMPRESIÓN:

ORIENTACIÓN: Vertical (brida inferior en cama)
MATERIAL: PETG
ALTURA CAPA: 0.2mm
PAREDES: 6 mínimo (para resistir apriete)
RELLENO: 60% (Grid o Cubic)
SOPORTES: NO necesarios
ADHESIÓN: Brim 15mm o Raft

REQUIERE: Impresora con Z ≥ 320mm

PESO ESTIMADO: ~600g
TIEMPO: ~40 horas

POST-PROCESO:
1. Remover brim
2. Limpiar agujeros de pernos (broca Ø6.5mm)
3. Roscar puertos P1 y P2 con macho 1/8" NPT
   O usar insertos roscados de latón
4. Verificar planicidad de caras de bridas
5. Lijar si es necesario (grano 400)

DIMENSIONES A VERIFICAR:
- Ø interior: 63.0 ±0.5mm
- Ø exterior: 88.4 ±0.5mm
- Altura: 300 ±1mm
- PCD pernos: 105 ±0.3mm
*/
