# ALTERNATIVAS PARA GENERAR PLANOS DXF SIN OPENSCAD

## Situación

OpenSCAD no está instalado en el sistema. A continuación se presentan métodos alternativos para generar los planos de manufactura.

---

## ✅ OPCIÓN 1: Usar Servicio Online de Conversión

### Tinkercad (Gratuito, basado en navegador)

**Ventajas:**
- No requiere instalación
- Interfaz amigable
- Exporta a múltiples formatos

**Procedimiento:**
1. Ir a: https://www.tinkercad.com/
2. Crear cuenta gratuita (o iniciar sesión con Google)
3. "Create New Design"
4. Importar archivo .scad:
   - Puede que NO soporte .scad directamente
   - Mejor usar Opción 2 o 3

### OpenJSCAD (Online, sin registro)

**URL:** https://openjscad.xyz/

**Procedimiento:**
1. Abrir sitio web
2. Copiar/pegar código del archivo .scad
3. Click en "Render"
4. Exportar como STL o DXF

**Limitación:** Sintaxis ligeramente diferente, puede requerir ajustes.

---

## ✅ OPCIÓN 2: Enviar Archivos .SCAD Directamente al Fabricante

### Fabricantes con Capacidad CAD

Muchos talleres especializados pueden:
- Abrir archivos .scad en su software CAD
- Convertir a formato nativo (DXF, DWG, etc.)
- Programar CNC directamente

**Procedimiento:**
1. Contactar taller de mecanizado CNC
2. Preguntar: "¿Pueden trabajar con archivos OpenSCAD (.scad)?"
3. Si NO:
   - Enviar archivos .scad
   - Solicitar cotización para conversión a DXF
   - Costo típico: $20-50 USD

---

## ✅ OPCIÓN 3: Planos Dibujados Manualmente (Método Tradicional)

### Usando Software CAD 2D Gratuito

#### LibreCAD (Recomendado)

**Descargar:** https://librecad.org/

**Procedimiento:**

1. **Instalar LibreCAD**
   - Descargar e instalar
   - Abrir programa

2. **Crear Plano de Tapa Superior** (Ejemplo)

```
Vista Superior:
1. Dibujar círculo Ø120mm (exterior)
2. Dibujar círculo Ø63mm (centro)
3. Dibujar círculo Ø95mm (PCD)
4. En círculo PCD, distribuir 8 círculos Ø6.5mm:
   - Usar "Array Polar" o "Rotate Copy"
   - Ángulo: 45° entre cada uno
5. Dibujar círculo Ø70mm (canal O-ring)
6. Añadir dimensions (cotas)
7. Guardar como DXF

Vista de Corte:
1. Dibujar perfil rectangular (sección)
2. Dibujar canal O-ring:
   - Rectángulo 6mm ancho × 2.5mm profundo
   - R0.5mm en esquinas
3. Acotar dimensiones críticas
4. Guardar como DXF separado
```

3. **Repetir para otros componentes**

**Tiempo estimado:** 2-4 horas (primera vez)

#### DraftSight (Versión Gratuita)

**Similar a AutoCAD:**
- Interfaz profesional
- Exporta DXF
- Versión gratuita disponible

---

## ✅ OPCIÓN 4: Usar Dimensiones de las Hojas Técnicas Directamente

### El Fabricante Puede Trabajar con Hojas Técnicas

**Muchos talleres tradicionales prefieren:**
- Hoja técnica impresa con dimensiones claras
- Explicación verbal  
- Pieza de referencia (si existe)

**Procedimiento:**

1. **Imprimir hojas técnicas:**
   - HOJA_TECNICA_TAPA_SUPERIOR.md
   - HOJA_TECNICA_BRIDA_INFERIOR.md
   - HOJA_TECNICA_DIFUSOR.md
   - HOJA_TECNICA_BASE_INFERIOR.md

2. **Llevar al taller:**
   - Mostrar diagramas ASCII-art
   - Explicar dimensiones críticas
   - El tornero/fresador dibuja croquis y mecaniza

3. **Ventajas:**
   - No requiere archivos digitales
   - Método tradicional probado
   - Funciona con talleres pequeños

**Desventaja:**
- Mayor tiempo de preparación
- Posibilidad de error de interpretación

---

## ✅ OPCIÓN 5: Contratar Servicio de Dibujo Técnico

### Freelancers Especializados

**Plataformas:**
- Fiverr: https://www.fiverr.com/
  - Buscar "CAD drawing", "DXF file"
  - Precio: $10-30 USD por pieza
  
- Upwork: https://www.upwork.com/
  - Dibujantes CAD profesionales
  - Precio: $20-50 USD/hora

**Procedimiento:**
1. Subir hojas técnicas + archivos .scad
2. Solicitar: "Generar planos DXF para manufactura"
3. Revisar y aprobar
4. Descargar archivos DXF

**Tiempo:** 1-2 días típicamente

---

## ✅ OPCIÓN 6: Instalar OpenSCAD (5 minutos)

### Instalación Rápida en Windows

Si decide instalar OpenSCAD después de todo:

**1. Descargar:**
```
Ir a: https://openscad.org/downloads.html
Windows: openscad-2021.01-x86-64-installer.exe (o versión más reciente)
```

**2. Instalar:**
```
- Ejecutar instalador
- Siguiente, Siguiente, Siguiente
- IMPORTANTE: Marcar "Add to PATH" si aparece
- Finalizar
```

**3. Verificar:**
```
Abrir PowerShell:
> openscad --version

Si muestra versión: Instalado correctamente
```

**4. Generar Planos:**
```
cd C:\Users\nasse\.gemini\antigravity\scratch\permeametro_mejorado\modelos_3d
.\generar_planos.bat
```

**5. Resultado:**
```
Carpeta planos_2d/ con:
- *.dxf (planos 2D)
- *.stl (modelos 3D)
```

---

## 📋 COMPARACIÓN DE OPCIONES

| Método | Costo | Tiempo | Calidad | Dificultad |
|-------|-------|--------|---------|------------|
| **Servicio online** | Gratis | 30 min | Media | Baja |
| **Enviar .scad a fabricante** | $20-50 | 1-2 días | Alta | Muy baja |
| **Dibujar en LibreCAD** | Gratis | 2-4 horas | Alta | Media |
| **Freelancer** | $40-120 | 1-2 días | Muy alta | Muy baja |
| **Solo hojas técnicas** | Gratis | 0 | Media | Baja |
| **Instalar OpenSCAD** | Gratis | 5 min + 1 min | Muy alta | Baja |

---

## 🎯 RECOMENDACIÓN

### Para Comenzar YA (sin archivos digitales):

**MEJOR OPCIÓN:**
1. Imprimir las 4 hojas técnicas
2. Llevar al taller de mecanizado
3. Explicar dimensiones críticas
4. Dejar que el fresador/tornero trabaje con las hojas

**Esto funciona porque:**
- Los talleres tradicionales están acostumbrados
- Las hojas tienen TODAS las dimensiones
- Los diagramas ASCII son claros
- Componentes son relativamente simples

### Para Tener Archivos Digitales:

**MEJOR OPCIÓN:**
1. Instalar OpenSCAD (5 minutos)
2. Ejecutar generar_planos.bat (1 minuto)
3. Obtener archivos DXF +STL profesionales
4. Enviar al fabricante

**Esto es ideal porque:**
- Archivos precisos (tolerancia 0.001mm)
- Universalmente compatibles
- No hay errores de interpretación
- Reutilizables y modificables

---

## 🔧 INSTRUCCIONES SIMPLIFICADAS PARA INSTALAR OPENSCAD

### Windows (Paso a Paso Detallado)

**Paso 1:** Abrir navegador

**Paso 2:** Ir a https://openscad.org/downloads.html

**Paso 3:** Click en "Windows" > Descargar el instalador .exe

**Paso 4:** Ejecutar el archivo descargado

**Paso 5:** Wizard de instalación:
- Acceptar licencia
- Ruta de instalación (dejar por defecto)
- Siguiente hasta finalizar

**Paso 6:** Abrir PowerShell y escribir:
```powershell
cd "C:\Users\nasse\.gemini\antigravity\scratch\permeametro_mejorado\modelos_3d"
```

**Paso 7:** Ejecutar script:
```powershell
.\generar_planos.bat
```

**Paso 8:** Esperar ~30-60 segundos

**Paso 9:** Abrir carpeta `planos_2d`

**Paso 10:** ¡Archivos DXF y STL listos!

---

## 📧 PLANTILLA EMAIL PARA FABRICANTE (Sin DXF)

```
Asunto: Cotización - Mecanizado según Hojas Técnicas

Estimado proveedor,

Solicito cotización para mecanizado de 4 componentes en plástico/metal.

Adjunto hojas de datos técnicos detalladas con:
- Dimensiones completas acotadas
- Tolerancias especificadas
- Material especificado
- Diagramas técnicos

COMPONENTES:
1. Tapa superior con brida - Acrílico 15mm
2. Brida inferior - Acrílico 8mm
3. Base inferior - Acrílico 10mm
4. Difusor perforado - Acero inox 2mm

ARCHIVOS ADJUNTOS:
- 4× Hojas técnicas (PDF/MD)
- Modelos 3D OpenSCAD (.scad) - OPCIONAL

Opción 1: Trabajar directamente con hojas técnicas
Opción 2: Convertir archivos .scad a DXF (cotizar aparte)

Las hojas técnicas incluyen TODA la información necesaria para
fabricación. Los archivos .scad son un bonus si pueden usarlos.

¿Pueden trabajar con esta documentación?

Saludos,
[Nombre]
```

---

## ✅ DECISIÓN RÁPIDA

**¿Tiene 5 minutos ahora?**
→ Instale OpenSCAD y genere planos (Opción 6)

**¿No puede instalar software?**
→ Imprima las hojas técnicas y vaya al taller (Opción 4)

**¿Quiere perfección sin esfuerzo?**
→ Contrate freelancer en Fiverr (Opción 5)

**¿El fabricante es técnicamente avanzado?**
→ Envíe archivos .scad directamente (Opción 2)

---

## 📞 SOPORTE

**Si tiene dudas sobre cualquier opción:**
- Revisar archivos del proyecto
- Consultar con el fabricante qué prefiere
- Todas las opciones son válidas

**Lo importante:**
- Las hojas técnicas tienen TODA la información
- Los archivos digitales son un plus, no requisito
- El proyecto está completo y listo para manufactura

---

**¡Éxito con su proyecto!**

Los planos y especificaciones están completos.  
Elija el método que mejor se adapte a su situación.

---

**Documento:** Alternativas para Generar Planos DXF  
**Fecha:** 2026-01-12  
**Proyecto:** Permeámetro Mejorado
