/*
 * PERMEÁMETRO MEJORADO - TAPA SUPERIOR CON BRIDA
 * 
 * Componente: Tapa superior con sistema de brida y 8 pernos
 * Material: Acrílico transparente cast
 * Espesor: 15mm (tapa) + 8mm (brida) = 23mm total
 * 
 * INSTRUCCIONES DE USO:
 * 1. Abrir este archivo en OpenSCAD
 * 2. Presionar F5 para preview
 * 3. Presionar F6 para render completo
 * 4. Exportar como STL para impresión 3D o mecanizado CNC
 * 
 * PARÁMETROS CRÍTICOS PARA MANUFACTURA:
 * - Canal O-ring: 6mm ancho × 2.5mm profundo
 * - Radio esquinas canal: 0.5mm (NO esquinas vivas)
 * - Acabado superficial: Ra < 1.6 μm
 * - Tolerancia dimensional: ±0.1mm
 */

// ============================================
// PARÁMETROS PRINCIPALES (MODIFICABLES)
// ============================================

// Dimensiones principales de la columna
diametro_interno_columna = 63.0;  // mm - AJUSTAR según su medida exacta
diametro_externo_columna = 73.0;  // mm

// Dimensiones de la tapa
diametro_tapa = 120;              // mm
espesor_tapa = 15;                // mm

// Dimensiones de la brida
diametro_brida = 110;             // mm
espesor_brida = 8;                // mm

// Canal para O-ring
diametro_canal_oring = 70;        // mm - Centro del canal
ancho_canal_oring = 6;            // mm
profundidad_canal_oring = 2.5;    // mm
radio_esquinas_canal = 0.5;       // mm

// Pernos (8 unidades M6)
numero_pernos = 8;
diametro_perno = 6.5;             // mm - Holgura para M6
diametro_circulo_pernos = 95;     // mm - PCD (Pitch Circle Diameter)

// Puerto de entrada
diametro_puerto_entrada = 8;      // mm
posicion_radial_puerto = 20;      // mm desde centro

// Puerto de venteo (centro)
diametro_puerto_venteo = 6;       // mm

// Perforaciones para montaje de difusor
numero_tornillos_difusor = 4;
diametro_tornillo_difusor = 3.2;  // mm - Para M3
diametro_circulo_difusor = 42;    // mm

// ============================================
// PARÁMETROS DE CALIDAD (NO MODIFICAR)
// ============================================
$fn = 100;  // Resolución de círculos (mayor = más suave)

// ============================================
// MÓDULOS DE CONSTRUCCIÓN
// ============================================

// Módulo: Cuerpo principal de la tapa
module tapa_principal() {
    difference() {
        // Disco sólido de la tapa
        cylinder(h = espesor_tapa, d = diametro_tapa, center = false);
        
        // Perforación central (para ver el interior)
        translate([0, 0, -1])
            cylinder(h = espesor_tapa + 2, d = diametro_interno_columna, center = false);
    }
}

// Módulo: Canal para O-ring
module canal_oring() {
    translate([0, 0, espesor_tapa - profundidad_canal_oring]) {
        rotate_extrude(convexity = 10) {
            translate([diametro_canal_oring/2, 0, 0]) {
                // Perfil del canal con esquinas redondeadas
                offset(r = radio_esquinas_canal) 
                    offset(r = -radio_esquinas_canal) 
                        square([ancho_canal_oring, profundidad_canal_oring + 1], center = false);
            }
        }
    }
}

// Módulo: Brida perimetral
module brida() {
    difference() {
        // Disco de la brida
        cylinder(h = espesor_brida, d = diametro_brida, center = false);
        
        // Perforación central (igual que la tapa)
        translate([0, 0, -1])
            cylinder(h = espesor_brida + 2, d = diametro_tapa - 2, center = false);
    }
}

// Módulo: Perforaciones para pernos
module perforaciones_pernos() {
    for (i = [0:numero_pernos-1]) {
        rotate([0, 0, i * 360/numero_pernos])
            translate([diametro_circulo_pernos/2, 0, -1])
                cylinder(h = espesor_tapa + espesor_brida + 2, d = diametro_perno, center = false);
    }
}

// Módulo: Puerto de entrada superior
module puerto_entrada() {
    // Ubicación lateral (no en el centro)
    translate([posicion_radial_puerto, 0, -1])
        cylinder(h = espesor_tapa + 2, d = diametro_puerto_entrada, center = false);
}

// Módulo: Puerto de venteo central
module puerto_venteo() {
    translate([0, 0, -1])
        cylinder(h = espesor_tapa + 2, d = diametro_puerto_venteo, center = false);
}

// Módulo: Perforaciones para tornillos del difusor
module perforaciones_difusor() {
    for (i = [0:numero_tornillos_difusor-1]) {
        rotate([0, 0, i * 360/numero_tornillos_difusor + 45]) // +45 para offset
            translate([diametro_circulo_difusor/2, 0, espesor_tapa - 8])
                cylinder(h = 10, d = diametro_tornillo_difusor, center = false);
    }
}

// Módulo: Chaflán decorativo (opcional)
module chaflan_superior() {
    translate([0, 0, espesor_tapa - 0.5])
        difference() {
            cylinder(h = 1, d1 = diametro_tapa, d2 = diametro_tapa - 2, center = false);
            translate([0, 0, -1])
                cylinder(h = 3, d = diametro_interno_columna + 2, center = false);
        }
}

// ============================================
// ENSAMBLAJE COMPLETO
// ============================================

module tapa_completa() {
    difference() {
        union() {
            // Tapa principal
            tapa_principal();
            
            // Brida en la parte inferior
            translate([0, 0, -espesor_brida])
                brida();
            
            // Chaflán decorativo (opcional)
            chaflan_superior();
        }
        
        // Restar: Canal para O-ring
        canal_oring();
        
        // Restar: Perforaciones para pernos
        perforaciones_pernos();
        
        // Restar: Puerto de entrada
        puerto_entrada();
        
        // Restar: Puerto de venteo
        puerto_venteo();
        
        // Restar: Perforaciones para difusor
        perforaciones_difusor();
    }
}

// ============================================
// RENDERIZADO
// ============================================

// Renderizar la pieza completa
tapa_completa();

// ============================================
// VISTAS AUXILIARES PARA VERIFICACIÓN
// ============================================

// Descomentar estas líneas para ver secciones y verificar dimensiones

// Vista de corte vertical (para verificar canal O-ring)
// difference() {
//     tapa_completa();
//     translate([-100, -1, -20])
//         cube([200, 2, 50]);
// }

// Marca de alineación (grabar con láser)
// translate([diametro_tapa/2 - 5, 0, espesor_tapa - 0.5])
//     cylinder(h = 1, d = 3, center = false);

// ============================================
// NOTAS PARA EL FABRICANTE
// ============================================

/*
 * TOLERANCIAS CRÍTICAS:
 * 
 * 1. Canal para O-ring:
 *    - Ancho: 6.0mm ± 0.1mm
 *    - Profundidad: 2.5mm ± 0.05mm
 *    - Radio esquinas: 0.5mm mínimo (NO aceptar esquinas vivas)
 * 
 * 2. Superficie de sellado (cara inferior):
 *    - Planicidad: < 0.05mm en toda la superficie
 *    - Acabado: Ra < 1.6 μm (pulido fino)
 *    - Perpendicularidad al eje: < 0.1mm
 * 
 * 3. Perforaciones de pernos:
 *    - Diámetro: 6.5mm +0.2/-0 (holgura para M6)
 *    - PCD: 95mm ± 0.2mm
 *    - Perpendicularidad: < 0.1mm
 * 
 * 4. Material:
 *    - Acrílico cast (NO extruido)
 *    - Espesor verificado antes de mecanizar
 *    - Sin burbujas ni inclusiones
 * 
 * SECUENCIA DE MECANIZADO SUGERIDA:
 * 1. Cortar disco de Ø120mm × 15mm
 * 2. Refrentar cara inferior (superficie de sellado)
 * 3. Mecanizar canal para O-ring en torno
 * 4. Perforar centro Ø63mm
 * 5. Perforar 8 agujeros para pernos (plantilla)
 * 6. Perforar puertos (entrada, venteo, difusor)
 * 7. Refrentar cara superior
 * 8. Pegar brida con solvente acrílico
 * 9. Inspección dimensional
 * 10. Limpieza y pulido final
 */

// ============================================
// INFORMACIÓN DEL ARCHIVO
// ============================================

/*
 * Archivo: 01_tapa_superior.scad
 * Versión: 1.0
 * Fecha: 2026-01-12
 * Proyecto: Permeámetro Mejorado
 * Licencia: Uso libre para investigación y educación
 */
