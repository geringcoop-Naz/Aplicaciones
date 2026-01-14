/*
 * LIBRERÍA DE COTAS PARA OPENSCAD
 * Permite dibujar dimensiones, flechas y etiquetas en planos 2D
 */

module linea(p1, p2, grosor=0.2) {
    hull() {
        translate(p1) circle(d=grosor);
        translate(p2) circle(d=grosor);
    }
}

module flecha(pos, angulo, escala=1) {
    longitud = 3 * escala;
    ancho = 1 * escala;
    translate(pos)
        rotate(angulo)
            polygon(points=[[0,0], [-longitud, ancho/2], [-longitud, -ancho/2]]);
}

// Cota Lineal (Horizontal/Vertical)
module cota(p1, p2, texto, offset=10, escala=1) {
    angulo = atan2(p2.y - p1.y, p2.x - p1.x);
    vec_offset = [sin(angulo)*offset, -cos(angulo)*offset];
    
    // Puntos de los extremos de la línea de cota
    p1_cota = p1 + vec_offset;
    p2_cota = p2 + vec_offset;
    
    // Líneas auxiliares (testigos)
    linea(p1, p1_cota + vec_offset * 0.2, 0.1);
    linea(p2, p2_cota + vec_offset * 0.2, 0.1);
    
    // Línea de cota principal
    linea(p1_cota, p2_cota, 0.2);
    
    // Flechas
    flecha(p1_cota, angulo, escala);
    flecha(p2_cota, angulo + 180, escala);
    
    // Texto
    translate((p1_cota + p2_cota)/2 + vec_offset * 0.3)
        rotate(angulo)
            text(texto, size=3*escala, halign="center", valign="bottom", font="Liberation Sans:style=Bold");
}

// Cota de Diámetro
module cota_diametro(centro, diametro, angulo, texto, escala=1) {
    radio = diametro / 2;
    p1 = centro + [cos(angulo)*radio, sin(angulo)*radio];
    p2 = centro - [cos(angulo)*radio, sin(angulo)*radio];
    
    // Línea pasante
    linea(p1, p2, 0.2);
    
    // Flechas externas o internas según espacio
    flecha(p1, angulo, escala);
    flecha(p2, angulo + 180, escala);
    
    // Texto
    translate(centro)
        rotate(angulo)
            translate([0, 1])
                text(str("Ø ", texto), size=3*escala, halign="center", valign="bottom", font="Liberation Sans:style=Bold");
}

// Etiqueta con flecha (Leader)
module etiqueta(punto_apuntar, punto_texto, texto, escala=1) {
    linea(punto_apuntar, punto_texto, 0.2);
    angulo = atan2(punto_apuntar.y - punto_texto.y, punto_apuntar.x - punto_texto.x);
    flecha(punto_apuntar, angulo, escala);
    
    translate(punto_texto)
        text(texto, size=3*escala, halign="left", valign="center", font="Liberation Sans");
}

// Marco y Cajetín simple
module marco_plano(ancho, alto, titulo, pieza) {
    difference() {
        square([ancho, alto]);
        translate([10, 10]) square([ancho-20, alto-20]);
    }
    
    // Cajetín
    translate([ancho-100, 10]) {
        difference() {
            square([90, 30]);
            translate([1, 1]) square([88, 28]);
        }
        translate([5, 20]) text(titulo, size=3);
        translate([5, 12]) text(pieza, size=4, font="Liberation Sans:style=Bold");
        translate([5, 5]) text("Escala 1:1  |  Unidades: mm", size=2.5);
    }
}
