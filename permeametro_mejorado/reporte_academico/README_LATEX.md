# Guía para Compilar el Reporte Académico en Overleaf

Este directorio contiene el código fuente LaTeX para generar el reporte técnico formal de tu proyecto de maestría.

## 1. Estructura de Archivos

*   `main.tex`: El archivo principal que contiene todo el texto y código LaTeX.
*   `imagenes/`: (Debes crear esta carpeta en Overleaf) Donde subirás los renders de tus modelos.

## 2. Instrucciones para Overleaf

1.  **Crear Nuevo Proyecto:**
    *   Ve a [Overleaf.com](https://www.overleaf.com/).
    *   Haz clic en "New Project" -> "Blank Project".
    *   Dale un nombre, ej: "Reporte_Permeametro".

2.  **Subir el Archivo:**
    *   Borra el `main.tex` que crea Overleaf por defecto.
    *   Sube el archivo `main.tex` que he generado aquí.
    *   (O simplemente copia y pega el contenido en el editor de Overleaf).

3.  **Configurar Imágenes:**
    *   En el panel izquierdo de Overleaf, crea una carpeta llamada `imagenes` (opcional, pero organizado).
    *   Sube tus archivos de imagen (.png, .jpg) ahí.
    *   En el código `main.tex`, busca las líneas que dicen `\includegraphics`.
    *   Descoméntalas (quita el `%` al inicio) y cambia el nombre del archivo por el de tu imagen.
    
    *Ejemplo:*
    ```latex
    % Antes:
    % \includegraphics[width=0.8\textwidth]{tapa_superior_render.png}
    
    % Después:
    \includegraphics[width=0.8\textwidth]{imagenes/mi_render_tapa.png}
    ```

4.  **Compilar:**
    *   Haz clic en el botón verde "Recompile".
    *   ¡Listo! Descarga tu PDF.

## 3. Cómo Generar Imágenes de Alta Calidad desde OpenSCAD

Para que el documento se vea profesional, tus imágenes deben ser nítidas.

1.  Abre tu modelo `.scad` en OpenSCAD.
2.  Presiona **F6** para hacer el renderizado final (importante para que se vea suave y sin errores).
3.  Ajusta la vista hasta que tengas el ángulo perfecto (Isométrico o Superior).
4.  Ve a **File > Export > Export as Image...**
5.  Guárdala como `.png`.
6.  **Tip Pro:** Si puedes, aumenta la resolución de exportación o maximiza la ventana antes de exportar.

## 4. Personalización

*   **Tu Nombre:** Busca `[Tu Nombre Completo]` en el archivo y pon el tuyo.
*   **Universidad:** Cambia `[NOMBRE DE TU UNIVERSIDAD]` en la portada.
*   **Fecha:** Se actualiza automáticamente con `\today`, pero puedes escribirla manual si prefieres.

---
**Nota sobre Bibliografía:**
He incluido referencias bibliográficas básicas simuladas al final. Si usas un gestor como BibTeX, puedes integrar un archivo `.bib` fácilmente, pero para este reporte corto el formato manual `\bibitem` funciona perfecto.
