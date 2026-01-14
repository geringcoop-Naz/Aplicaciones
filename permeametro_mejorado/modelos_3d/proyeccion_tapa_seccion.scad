/*
 * PROYECCIÓN 2D - CORTE TRANSVERSAL TAPA
 * Vista de sección para verificar canal de O-ring
 */

use <01_tapa_superior.scad>

// Corte vertical a través del centro
projection(cut = true)
    rotate([0, 90, 0])  // Girar para ver el corte lateral
        translate([0, 0, 0])
            tapa_completa();

/*
 * USO:
 * openscad -o tapa_superior_seccion.dxf proyeccion_tapa_seccion.scad
 * 
 * Muestra el perfil del canal de O-ring y la geometría interna
 * Útil para verificar dimensiones críticas:
 * - Profundidad del canal: 2.5mm
 * - Ancho del canal: 6mm
 * - Radio de esquinas: 0.5mm
 */
