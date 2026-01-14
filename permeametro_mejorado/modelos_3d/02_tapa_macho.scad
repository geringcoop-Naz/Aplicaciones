/*
 * PERMEÁMETRO MEJORADO - DISEÑO REV.G
 * Componente: TAPA TIPO MACHO (PLUG CAP)
 * 
 * Innovación: Tapa con plug cilíndrico que se inserta en cuerpo
 * Sistema de sellado con O-ring radial en el plug
 * Más profesional, fácil apertura/cierre
 */

// ============================================
// PARÁMETROS GLOBALES
// ============================================

// Cabeza de la tapa (disco superior)
diametro_cabeza = 100;                 // mm
espesor_cabeza = 15;                   // mm

// Brida de la tapa
diametro_brida_tapa = 110;             // mm (coincide con brida del cuerpo)
espesor_brida_tapa = 8;                // mm
pcd_pernos = 95;                       // mm (DEBE coincidir con cuerpo)
diametro_agujero_perno = 6.5;          // mm (M6 con holgura)
numero_pernos = 8;

// Plug macho (porción que se inserta)
diametro_plug = 62.0;                  // mm (fit en interior Ø63mm del cuerpo)
altura_plug = 18;                      // mm (profundidad de inserción)
holgura_diametral = 1.0;               // mm (63 - 62 = 1mm total, 0.5mm radial)

// Canal O-ring en el plug
diametro_interior_canal_oring = 60;    // mm
ancho_canal_oring = 3.5;               // mm
profundidad_canal_oring = 1.5;         // mm
altura_canal_desde_base = 9;           // mm (centrado en altura del plug)
radio_esquinas_canal = 0.5;            // mm

// Puerto de entrada (en el centro de la cabeza)
diametro_puerto_entrada = 8;           // mm (para fitting 1/4" NPT)
profundidad_puerto = 10;               // mm (rosca o inserto)

// Montaje del difusor (4 agujeros M3)
pcd_difusor = 42;                      // mm
diametro_agujero_difusor = 3.2;        // mm (M3)
numero_agujeros_difusor = 4;

// Resolución
$fn = $preview ? 40 : 100;

// ============================================
// MÓDULOS AUXILIARES
// ============================================

// Canal O-ring con esquinas redondeadas
module canal_oring() {
    radio_toro = ancho_canal_oring / 2;
    radio_interno = diametro_interior_canal_oring / 2 + radio_toro;
    
    rotate_extrude()
        translate([radio_interno, 0, 0])
            offset(r = radio_esquinas_canal)
            offset(r = -radio_esquinas_canal)
            square([ancho_canal_oring - 2*radio_esquinas_canal, 
                    profundidad_canal_oring - 2*radio_esquinas_canal], 
                   center = true);
}

// ============================================
// MÓDULO PRINCIPAL
// ============================================

module tapa_macho() {
    difference() {
        union() {
            // Cabeza principal (disco)
            translate([0, 0, espesor_brida_tapa])
                cylinder(h = espesor_cabeza, 
                        d = diametro_cabeza);
            
            // Brida de la tapa
            translate([0, 0, 0])
                cylinder(h = espesor_brida_tapa, 
                        d = diametro_brida_tapa);
            
            // Plug macho (porción cilíndrica que se inserta)
            translate([0, 0, -altura_plug])
                cylinder(h = altura_plug, 
                        d = diametro_plug);
        }
        
        // Cavidad central (pasante para el puerto de entrada)
        translate([0, 0, -altura_plug - 0.5])
            cylinder(h = altura_plug + espesor_brida_tapa + espesor_cabeza + 1, 
                    d = diametro_puerto_entrada);
        
        // Agujeros para pernos en la brida
        for (i = [0 : numero_pernos - 1]) {
            angulo = i * 360 / numero_pernos;
            rotate([0, 0, angulo])
                translate([pcd_pernos/2, 0, -0.5])
                    cylinder(h = espesor_brida_tapa + 1, 
                            d = diametro_agujero_perno);
        }
        
        // Canal O-ring en el plug
        translate([0, 0, -altura_plug + altura_canal_desde_base])
            canal_oring();
        
        // Agujeros de montaje del difusor (bajo la cabeza)
        for (i = [0 : numero_agujeros_difusor - 1]) {
            angulo = i * 360 / numero_agujeros_difusor;
            rotate([0, 0, angulo])
                translate([pcd_difusor/2, 0, espesor_brida_tapa - 0.5])
                    cylinder(h = 8, 
                            d = diametro_agujero_difusor);
        }
    }
}

// ============================================
// VISUALIZACIÓN
// ============================================

// Vista de corte para preview (opcional)
if ($preview) {
    difference() {
        tapa_macho();
        // Corte para ver canal O-ring
        // translate([-100, 0, -50])
        //     cube([100, 200, 100]);
    }
} else {
    tapa_macho();
}

// ============================================
// NOTAS DE FABRICACIÓN
// ============================================

/*
ESPECIFICACIONES DE IMPRESIÓN 3D:

Material: PETG
Orientación: BOCA ABAJO (cabeza en cama, plug hacia arriba)
Layer Height: 0.15mm (para mejor acabado en canal O-ring)
Walls: 5
Infill: 50%
Supports: SÍ (para plug cilíndrico y canal O-ring)
  - Tipo: Tree supports (menos contacto)
  - Z-distance: 0.2mm
Adhesión: BRIM 8mm
Temperatura nozzle: 240°C
Temperatura cama: 80°C
Velocidad: 40-50mm/s

IMPORTANTE ORIENTACIÓN:
        CAMA
    ══════════════
    ║  CABEZA    ║  ← Cara superior toca cama (acabado liso)
    ║            ║
    ╚════════════╝
         ║plug║     ← Apunta hacia arriba
         ╚════╝

ESTIMACIONES:
- Peso: ~120g de PETG
- Tiempo: 10-12 horas
- Costo material: ~$3 USD

POST-PROCESAMIENTO:
1. Remover soportes CUIDADOSAMENTE del canal O-ring
2. Limpiar canal O-ring con herramienta cilíndrica o cutter
3. Lijar suavemente canal con lija 400-600 grit enrollada
4. Limpiar agujeros de pernos con broca Ø6.5mm
5. Verificar cara inferior de brida (debe quedar lisa)
6. Probar fit del plug en el cuerpo (debe entrar con resistencia leve)

VERIFICACIÓN DE DIMENSIONES:
- Medir diámetro del plug con calibrador: 62.0 ±0.2mm
- Verificar PCD de pernos: 95.0 ±0.2mm
- Comprobar que agujeros coinciden con cuerpo

AJUSTES SI ES NECESARIO:
- Si plug muy ajustado: Lijar suavemente con lija 220
- Si plug muy flojo: Imprimir con diametro_plug = 62.2 o 62.3mm
- Usar "Horizontal Expansion" en slicer para compensación

SELLADO:
O-ring: Viton FKM Ø60mm × 3mm sección transversal
- Lubricar con grasa silicona antes de instalar
- Colocar en canal antes de insertar tapa en cuerpo
- Verificar asentamiento uniforme

SISTEMA DE DOBLE SELLADO:
1. O-ring en plug (sellado primario - radial)
2. Empaque PTFE 2mm entre bridas (sellado secundario - axial)

COMPATIBILIDAD:
- Debe usarse con: 01_cuerpo_con_brida_integrada.scad
- PCD pernos DEBE coincidir exactamente
- Diámetro plug debe ajustar en interior Ø63mm del cuerpo
*/
