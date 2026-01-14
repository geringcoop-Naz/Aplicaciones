/*
 * PROYECCIÓN 2D - TAPA SUPERIOR
 * Vista de planta (superior) para corte láser o planilla de perforaciones
 */

use <01_tapa_superior.scad>

// Proyección 2D desde arriba
projection(cut = false) 
    tapa_completa();

/*
 * USO:
 * openscad -o tapa_superior_planta.dxf proyeccion_tapa_planta.scad
 * 
 * Esto genera un archivo DXF con la vista superior que puede usarse para:
 * - Programación de CNC
 * - Corte láser
 * - Marcado de perforaciones
 */
