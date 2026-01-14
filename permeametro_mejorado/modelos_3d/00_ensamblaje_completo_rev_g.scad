/*
 * PERMEÁMETRO MEJORADO - ENSAMBLAJE COMPLETO REV.G
 * Sistema con Tapa Macho (Plug Cap)
 * 
 * Componentes principales:
 * 1. Cuerpo con brida integrada (1 pieza)
 * 2. Tapa macho con plug
 * 3. Difusor perforado
 * 4. Base con cámara
 * 5. O-ring (visualización)
 * 6. Pernos (visualización)
 */

// ============================================
// PARÁMETROS GLOBALES
// ============================================

// Controles de visualización
mostrar_cuerpo = true;
mostrar_tapa_macho = true;
mostrar_difusor = true;
mostrar_base = true;
mostrar_oring = true;
mostrar_empaque_ptfe = true;
mostrar_pernos = true;

// Modo explosionado
modo_explosionado = false;        // true para vista separada
distancia_explosion = 50;         // mm de separación

// Transparencias (para visualización)
alpha_cuerpo = 0.7;
alpha_tapa = 1.0;

$fn = $preview ? 30 : 60;

// ============================================
// IMPORTAR MÓDULOS
// ============================================

use <01_cuerpo_con_brida_integrada.scad>
use <02_tapa_macho.scad>
use <03_difusor_entrada.scad>
use <04_base_inferior.scad>

// ============================================
// PARÁMETROS DE ENSAMBLAJE
// ============================================

altura_cuerpo_total = 308;           // 300 cilindro + 8 brida
altura_tapa = 23;                    // 15 cabeza + 8 brida
altura_plug = 18;                    // Profundidad de inserción
altura_base = 20;                    // Altura de la base

// Posiciones relativas
pos_z_base = 0;
pos_z_cuerpo = pos_z_base + altura_base;
pos_z_tapa = pos_z_cuerpo + altura_cuerpo_total - 8;  // Brida superpone
pos_z_difusor = pos_z_tapa + 8 - 2;  // Bajo la brida de tapa

// ============================================
// COMPONENTES AUXILIARES DE VISUALIZACIÓN
// ============================================

// O-ring en el plug de la tapa
module oring_visual() {
    color("black")
    rotate_extrude()
        translate([30, 0, 0])  // Radio aproximado
            circle(d = 3);      // Sección transversal
}

// Empaque PTFE entre bridas
module empaque_ptfe() {
    color("LightGray", 0.8)
    difference() {
        cylinder(h = 2, d = 105);
        translate([0, 0, -0.5])
            cylinder(h = 3, d = 65);
    }
}

// Perno individual
module perno_m6() {
    color("Silver")
    union() {
        // Cabeza hexagonal
        cylinder(h = 4, d = 10, $fn=6);
        // Vástago
        translate([0, 0, -30])
            cylinder(h = 30, d = 6);
        // Tuerca
        translate([0, 0, -35])
            cylinder(h = 5, d = 10, $fn=6);
    }
}

// Conjunto de 8 pernos
module pernos_conjunto() {
    for (i = [0 : 7]) {
        angulo = i * 45;
        rotate([0, 0, angulo])
            translate([95/2, 0, 0])
                perno_m6();
    }
}

// ============================================
// ENSAMBLAJE PRINCIPAL
// ============================================

module ensamblaje_completo() {
    
    offset_explosion = modo_explosionado ? distancia_explosion : 0;
    
    // BASE
    if (mostrar_base) {
        color("SteelBlue", 1.0)
        translate([0, 0, pos_z_base - offset_explosion])
            base_completa();
    }
    
    // CUERPO CON BRIDA INTEGRADA
    if (mostrar_cuerpo) {
        color("CornflowerBlue", alpha_cuerpo)
        translate([0, 0, pos_z_cuerpo])
            cuerpo_con_brida();
    }
    
    // O-RING en el plug
    if (mostrar_oring) {
        translate([0, 0, pos_z_tapa + 8 - 9])  // Altura del canal
            oring_visual();
    }
    
    // EMPAQUE PTFE entre bridas
    if (mostrar_empaque_ptfe) {
        translate([0, 0, pos_z_cuerpo + altura_cuerpo_total - 8 + offset_explosion/2])
            empaque_ptfe();
    }
    
    // TAPA MACHO
    if (mostrar_tapa_macho) {
        color("DodgerBlue", alpha_tapa)
        translate([0, 0, pos_z_tapa + offset_explosion])
            tapa_macho();
    }
    
    // DIFUSOR
    if (mostrar_difusor) {
        color("Gray", 0.9)
        translate([0, 0, pos_z_difusor + offset_explosion])
            difusor();
    }
    
    // PERNOS (8 unidades)
    if (mostrar_pernos) {
        translate([0, 0, pos_z_tapa + 8 + offset_explosion])
            pernos_conjunto();
    }
}

// ============================================
// VISUALIZACIÓN
// ============================================

// Mostrar ensamblaje
ensamblaje_completo();

// Anotaciones de texto (solo en preview)
if ($preview) {
    // Título
    color("Black")
    translate([-60, -80, 350])
        text("PERMEÁMETRO REV.G", size = 8);
    
    color("Black")
    translate([-60, -80, 340])
        text("Sistema Tapa Macho", size = 6);
}

// ============================================
// INSTRUCCIONES DE USO
// ============================================

/*
CONTROLES DE VISUALIZACIÓN:

Modificar las variables al inicio del archivo:

mostrar_cuerpo = true/false      - Muestra/oculta cuerpo
mostrar_tapa_macho = true/false  - Muestra/oculta tapa
mostrar_difusor = true/false     - Muestra/oculta difusor
mostrar_base = true/false        - Muestra/oculta base
mostrar_oring = true/false       - Muestra/oculta O-ring
mostrar_pernos = true/false      - Muestra/oculta pernos

modo_explosionado = true         - Vista separada de componentes
distancia_explosion = 50         - Separación en modo explosionado

VISTAS RECOMENDADAS:

1. Vista Completa:
   - Todos en true
   - modo_explosionado = false

2. Vista Explosionada:
   - Todos en true
   - modo_explosionado = true
   - distancia_explosion = 80

3. Vista de Corte (Manual):
   - Usar Transform > Difference en OpenSCAD
   - O descomentar código de corte en archivos individuales

EXPORTACIÓN:

Para generar STL de cada componente:
1. Abrir archivo individual (.scad)
2. F6 (Render completo)
3. File > Export > Export as STL

Archivos a exportar:
- 01_cuerpo_con_brida_integrada.scad → cuerpo_brida.stl (~350g)
- 02_tapa_macho.scad → tapa_macho.stl (~120g)
- 03_difusor_entrada.scad → difusor.stl (~15g)
- 04_base_inferior.scad → base.stl (~150g)

NOTAS IMPORTANTES:

COMPATIBILIDAD:
- La tapa macho DEBE usarse con el cuerpo integrado
- PCD de pernos: 95mm (verificar coincidencia)
- Diámetro plug tapa: Ø62mm
- Diámetro interior cuerpo: Ø63mm
- Holgura: 1mm diametral (ajuste con O-ring)

MATERIALES ADICIONALES REQUERIDOS:
- O-ring Viton Ø60mm × 3mm sección (sellado primario)
- Empaque PTFE 2mm espesor (sellado secundario)
- 8× Pernos M6 × 30mm acero inoxidable
- 16× Arandelas M6
- 8× Tuercas M6 autoblocantes
- 3× Patas niveladoras M8
- Grasa silicona para O-ring

IMPRESIÓN:
- Cuerpo: REQUIERE impresora Z ≥320mm O dividir en 2 secciones
- Tapa: Cualquier impresora estándar (altura <50mm)
- Ver notas detalladas en cada archivo .scad

ENSAMBLAJE:
1. Lubricar O-ring e instalar en canal del plug
2. Colocar empaque PTFE sobre brida del cuerpo
3. Insertar tapa en cuerpo (plug entra en cilindro)
4. Alinear agujeros de pernos
5. Instalar 8 pernos con arandelas
6. Apretar en patrón estrella: 2→4→5 Nm

VENTAJAS DE ESTE DISEÑO:
✓ Cuerpo + brida en 1 pieza (más robusto)
✓ No requiere pegado de brida
✓ Fácil abrir/cerrar (cambio de muestra)
✓ Doble sellado (O-ring + PTFE)
✓ Diseño profesional tipo reactor
*/
