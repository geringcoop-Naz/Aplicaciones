/*
 * PERMEÁMETRO REV.I - BASE DE SOPORTE
 * Con collar para cilindro y patas niveladoras
 */

// ============================================
// PARÁMETROS
// ============================================

// Cilindro (para referencia)
diametro_exterior_cilindro = 88.4;  // mm

// Base
diametro_base = 140;               // mm (amplio para estabilidad)
altura_base = 25;                  // mm

// Collar para asentar cilindro
altura_collar = 10;                // mm
diametro_collar = diametro_exterior_cilindro + 5;  // ~93mm

// Patas niveladoras M8
pcd_patas = 120;                   // mm
diametro_agujero_pata = 8.5;       // mm (para rosca M8)
numero_patas = 3;

$fn = $preview ? 40 : 80;

// ============================================
// MODELO
// ============================================

module base_soporte() {
    difference() {
        union() {
            // Disco base
            cylinder(h = altura_base, d = diametro_base);
            
            // Collar central
            cylinder(h = altura_base + altura_collar, d = diametro_collar);
        }
        
        // Hueco para asentar cilindro
        translate([0, 0, altura_base])
            cylinder(h = altura_collar + 1, d = diametro_exterior_cilindro + 0.5);
        
        // Agujeros para patas niveladoras (3×)
        for (i = [0 : numero_patas - 1]) {
            rotate([0, 0, i * 360 / numero_patas])
                translate([pcd_patas/2, 0, -1])
                    cylinder(h = altura_base + 2, d = diametro_agujero_pata);
        }
        
        // Chaflán decorativo en esquina superior
        translate([0, 0, altura_base + altura_collar - 2])
            difference() {
                cylinder(h = 3, d = diametro_collar + 2);
                cylinder(h = 3, d1 = diametro_collar - 6, d2 = diametro_collar + 2);
            }
    }
}

// Renderizar
base_soporte();

/*
NOTAS DE IMPRESIÓN:

ORIENTACIÓN: Como está (cara plana en cama)
MATERIAL: PETG
ALTURA CAPA: 0.2mm
PAREDES: 4
RELLENO: 40%
SOPORTES: NO necesarios
ADHESIÓN: Brim 8mm (pieza grande)

PESO ESTIMADO: ~200g
TIEMPO: ~15 horas

POST-PROCESO:
1. Remover brim
2. Roscar agujeros con macho M8
   O dejar para patas autorroscantes
3. Verificar que cilindro asienta en el collar
4. Nivelar con patas ajustables

PATAS NIVELADORAS:
- 3× Patas con rosca M8
- Altura ajustable (típico 50-80mm)
- Punta de goma (antideslizante)
- Permiten nivelar equipo

INSTALACIÓN:
1. Roscar patas en base
2. Asentar cilindro en collar
3. Nivelar con nivel de burbuja
4. Ajustar patas hasta que esté horizontal
*/
