/*
 * PERMEÁMETRO REV.I - TAPA MACHO INFERIOR
 * Con brida de apriete
 * Puerto SALIDA lateral para boquilla latón
 * Canal O-ring en plug
 */

// ============================================
// PARÁMETROS
// ============================================

// Dimensiones base (coinciden con cilindro)
diametro_interior_cilindro = 63.0;
espesor_pared_cilindro = 12.7;
diametro_exterior_cilindro = diametro_interior_cilindro + 2 * espesor_pared_cilindro;

// Brida
diametro_brida = 120;
espesor_brida = 10;
pcd_pernos = 105;
numero_pernos = 8;
diametro_agujero_perno = 6.5;

// Cuerpo de la tapa
espesor_tapa = 15;

// Plug macho
diametro_plug = diametro_interior_cilindro - 1;  // 62mm
profundidad_plug = 20;

// Canal O-ring
profundidad_canal = 2.0;
ancho_canal = 5.0;
posicion_canal = profundidad_plug / 2;

// Puerto salida LATERAL (boquilla latón 1/4" NPT)
diametro_puerto = 10;

// Cavidad interna para drenaje
diametro_cavidad = diametro_plug - 10;  // 52mm

$fn = $preview ? 40 : 100;

// ============================================
// MODELO
// ============================================

module tapa_macho_inferior() {
    difference() {
        union() {
            // Brida de apriete
            cylinder(h = espesor_brida, d = diametro_brida);
            
            // Cuerpo principal
            translate([0, 0, espesor_brida])
                cylinder(h = espesor_tapa, d = diametro_exterior_cilindro);
            
            // Plug macho
            translate([0, 0, -profundidad_plug])
                cylinder(h = profundidad_plug, d = diametro_plug);
        }
        
        // CAVIDAD INTERNA (para recolectar fluido)
        translate([0, 0, -profundidad_plug - 1])
            cylinder(h = profundidad_plug + espesor_brida + espesor_tapa/2 + 1, 
                    d = diametro_cavidad);
        
        // PUERTO SALIDA LATERAL
        translate([diametro_exterior_cilindro/2, 0, espesor_brida + espesor_tapa/2])
            rotate([0, 90, 0])
                cylinder(h = espesor_pared_cilindro + 10, d = diametro_puerto);
        
        // Agujeros para pernos (8×)
        for (i = [0 : numero_pernos - 1]) {
            rotate([0, 0, i * 360 / numero_pernos])
                translate([pcd_pernos/2, 0, -1])
                    cylinder(h = espesor_brida + 2, d = diametro_agujero_perno);
        }
        
        // Canal O-ring en plug
        translate([0, 0, -posicion_canal])
            rotate_extrude()
                translate([diametro_plug/2 - profundidad_canal, 0, 0])
                    square([profundidad_canal * 2, ancho_canal], center = true);
    }
}

// Renderizar
tapa_macho_inferior();

/*
NOTAS DE IMPRESIÓN:

ORIENTACIÓN: Brida en cama (plug hacia arriba)

    CAMA ═════════════
    ║     BRIDA      ║
    ║═══════════════ ║
    ║  CUERPO TAPA ──╫──→ Puerto salida
    ╚═══════════════ ╝
            ║║
         PLUG ↑ (arriba)

MATERIAL: PETG
ALTURA CAPA: 0.15mm
PAREDES: 5
RELLENO: 50%
SOPORTES: SÍ (tree supports)
   - Para plug y cavidad interna
ADHESIÓN: Brim 8mm

PESO ESTIMADO: ~150g
TIEMPO: ~12 horas

POST-PROCESO:
1. Remover soportes del canal O-ring y cavidad
2. Limpiar canal O-ring cuidadosamente
3. Roscar puerto lateral con macho 1/4" NPT
4. Limpiar agujeros de pernos
5. Verificar planicidad

BOQUILLA A INSTALAR:
- Latón 1/4" NPT con espiga para manguera
- Orientar con inclinación hacia abajo (drenaje)
- Sellar con cinta PTFE

O-RING:
- Mismo que tapa superior
- Viton Ø58mm × 4mm

NOTA: La cavidad interna permite que el fluido
se acumule y drene por el puerto lateral.
*/
