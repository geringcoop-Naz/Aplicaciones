# INSTRUCCIONES PARA GENERAR PLANOS DE MANUFACTURA

## Documentación Técnica Generada

Se han creado **modelos 3D paramétricos en OpenSCAD** y **hojas de datos técnicos** para manufactura del permeámetro mejorado.

---

## 📁 Estructura de Archivos

```
permeametro_mejorado/
├── modelos_3d/                    # Modelos 3D OpenSCAD
│   ├── 00_ensamblaje_completo.scad    # Vista completa ensamblada
│   ├── 01_tapa_superior.scad          # Tapa con brida ★
│   ├── 02_brida_inferior.scad         # Brida para cuerpo
│   ├── 03_difusor_entrada.scad        # Difusor perforado
│   ├── 04_base_inferior.scad          # Base con patas
│   ├── proyeccion_tapa_planta.scad    # Script proyección 2D
│   ├── proyeccion_tapa_seccion.scad   # Script corte 2D
│   ├── generar_planos.bat             # SCRIPT AUTOMÁTICO ★
│   └── README_PLANOS.md               # Instrucciones
│
├── planos_manufactura/            # Hojas de datos técnicos
│   ├── HOJA_TECNICA_TAPA_SUPERIOR.md  # Especificación completa ★
│   └── (crear para otros componentes)
│
└── [documentación anterior...]
```

---

## 🚀 INICIO RÁPIDO - Generar Planos en 3 Pasos

### Paso 1: Instalar OpenSCAD (si no lo tiene)

**Descargar e instalar:**
- Sitio web: https://openscad.org/downloads.html
- Versión Windows: Descargar el instalador `.exe`
- Instalar con opciones por defecto
- **Importante:** Marcar opción "Add to PATH" durante instalación

### Paso 2: Generar Planos Automáticamente

**Método Automático (Recomendado):**

1. Abrir explorador en:
   ```
   C:\Users\nasse\.gemini\antigravity\scratch\permeametro_mejorado\modelos_3d\
   ```

2. **Doble clic** en el archivo:
   ```
   generar_planos.bat
   ```

3. Esperar a que termine (30 segundos - 2 minutos)

4. Los archivos se generarán en la carpeta:
   ```
   modelos_3d\planos_2d\
   ```

**Archivos generados:**
- ✅ `*.dxf` - Planos 2D para CNC/Láser
- ✅ `*.stl` - Modelos 3D para impresión/mecanizado

### Paso 3: Verificar y Enviar al Fabricante

**Abrir archivos DXF:**
- Usar LibreCAD (gratuito): https://librecad.org/
- O cualquier software CAD (AutoCAD, DraftSight, etc.)

**Verificar dimensiones:**
- Medir elementos críticos en el plano
- Verificar que coinciden con especificaciones

**Enviar al fabricante:**
- Archivos DXF (para corte láser o CNC)
- Hoja técnica: `HOJA_TECNICA_TAPA_SUPERIOR.md`
- Lista de materiales: `06_LISTA_MATERIALES.md`

---

## 🔧 Métodos Alternativos

### Método Manual (Paso a Paso)

Si el script automático no funciona:

**1. Abrir OpenSCAD**
- Inicio > OpenSCAD

**2. Abrir modelo:**
- File > Open > `01_tapa_superior.scad`

**3. Visualizar:**
- Presionar **F5** (Preview rápido)
- Presionar **F6** (Render completo - toma más tiempo)

**4. Exportar DXF (2D):**
- Modificar código para proyección 2D:
  ```openscad
  projection(cut = false) tapa_completa();
  ```
- File > Export > Export as DXF
- Guardar como: `tapa_superior_2d.dxf`

**5. Exportar STL (3D):**
- Restaurar código original
- File > Export > Export as STL
- Guardar como: `tapa_superior_3d.stl`

### Método Línea de Comandos

**Para usuarios avanzados:**

```batch
# Navegar a directorio
cd "C:\Users\nasse\.gemini\antigravity\scratch\permeametro_mejorado\modelos_3d"

# Generar DXF (vista de planta)
openscad -o "tapa_planta.dxf" "proyeccion_tapa_planta.scad"

# Generar STL (modelo 3D)
openscad -o "tapa_3d.stl" "01_tapa_superior.scad"
```

---

## 📐 Personalizar Dimensiones

Los modelos son **paramétricos**. Puede modificar dimensiones según SU permeámetro:

**1. Abrir archivo:**
```
01_tapa_superior.scad
```

**2. Encontrar sección de PARÁMETROS:**
```openscad
// ============================================
// PARÁMETROS PRINCIPALES (MODIFICABLES)
// ============================================

diametro_interno_columna = 63.0;  // ← CAMBIAR AQUÍ
diametro_externo_columna = 73.0;  // ← CAMBIAR AQUÍ
```

**3. Modificar valores según sus medidas**

**4. Guardar archivo (Ctrl+S)**

**5. Regenerar planos** con el script o manualmente

---

## 📋 Hojas de Datos para el Fabricante

### Documentos a Entregar al Taller

**Paquete completo de manufactura:**

1. **Modelos 2D/3D:**
   - [ ] Archivos DXF generados (planos_2d/*.dxf)
   - [ ] Archivos STL si es impresión 3D
   - [ ] Archivo fuente .scad (para modificaciones)

2. **Especificaciones técnicas:**
   - [ ] `HOJA_TECNICA_TAPA_SUPERIOR.md` ★ Documento principal
   - [ ] `01_TAPA_SUPERIOR.md` (referencia detallada)
   - [ ] `02_SISTEMA_SELLADO.md` (especificaciones de sellado)

3. **Lista de materiales:**
   - [ ] `06_LISTA_MATERIALES.md` (BOM completa)

4. **Documentos de ensamblaje:**
   - [ ] `05_ENSAMBLAJE.md` (para verificación post-fabricación)

### Información Crítica para el Fabricante

**Resaltar estos puntos:**

```
DIMENSIONES CRÍTICAS (Tolerancias estrictas):

1. Canal para O-ring:
   - Ancho: 6.0mm ± 0.1mm
   - Profundidad: 2.5mm ± 0.05mm
   - Radio esquinas: 0.5mm mínimo (NO 90°)

2. Superficie de sellado:
   - Planicidad: < 0.05mm
   - Acabado: Ra < 1.6 μm
   - Proceso: Refrentado + pulido fino

3. Material:
   - Acrílico CAST (no extruido)
   - Transparente, virgen
   - Sin burbujas ni inclusiones
```

---

## 🎯 Checklist de Verificación

Antes de enviar al fabricante:

### Archivos Digitales
- [ ] Archivos DXF generados correctamente
- [ ] Archivos STL (si aplica)
- [ ] Hojas técnicas en PDF o MD

### Especificaciones
- [ ] Dimensiones verificadas vs. su permeámetro actual
- [ ] Material especificado (Acrílico cast)
- [ ] Tolerancias críticas resaltadas
- [ ] Acabado superficial especificado

### Documentación
- [ ] Lista de materiales completa
- [ ] Instrucciones de ensamblaje incluidas
- [ ] Número de piezas requeridas claro (1× tapa, 1× brida, etc.)

### Cotización
- [ ] Solicitar cotización incluyendo:
  - Mecanizado
  - Material
  - Acabado superficial
  - Tiempo de entrega
  - Garantía dimensional

---

## 🛠️ Software Recomendado

### Gratuito (Open Source)

**Para visualizar/editar modelos 3D:**
- **OpenSCAD** - https://openscad.org/
  - Modelado paramétrico
  - Export DXF, STL, OFF, etc.

- **FreeCAD** - https://freecadweb.org/
  - CAD completo
  - Import/Export múltiples formatos

**Para abrir planos 2D (DXF):**
- **LibreCAD** - https://librecad.org/
  - Visor y editor 2D
  - Medición de dimensiones
  - Export a PDF

- **QCAD Community** - https://qcad.org/
  - Similar a LibreCAD
  - Interfaz más moderna

**Para conversión a PDF:**
- **Inkscape** - https://inkscape.org/
  - Abrir DXF
  - Export a PDF, PNG, etc.

### Comercial (Profesional)

- **AutoCAD** - Estándar industrial
- **SolidWorks** - CAD 3D profesional
- **DraftSight** - AutoCAD económico

---

## 📞 Soporte Técnico

### Problemas Comunes

**1. "OpenSCAD no reconocido"**
```
Solución:
- Verificar instalación
- Agregar a PATH manualmente:
  Panel de Control > Sistema > Variables de Entorno
  Agregar: C:\Program Files\OpenSCAD
```

**2. "Error al importar archivo"**
```
Solución:
- Verificar que todos los .scad están en el mismo directorio
- Usar rutas relativas (no absolutas)
```

**3. "Dimensiones incorrectas en DXF"**
```
Solución:
- Verificar unidades (mm)
- Escala debe ser 1:1
- Modificar parámetros en .scad y regenerar
```

**4. "Superficies no suaves en STL"**
```
Solución:
- Aumentar $fn = 100 a $fn = 200
- Aumenta tiempo de render pero mejora calidad
```

---

## 📧 Contacto con Fabricantes

### Plantilla de Email

```
Asunto: Cotización - Mecanizado de Componentes en Acrílico

Estimado proveedor,

Solicito cotización para el mecanizado de componentes en acrílico
según planos adjuntos:

COMPONENTES:
- Tapa superior con brida (1 pieza)
- Difusor perforado (1 pieza)

MATERIAL:
- Acrílico cast transparente (PMMA)
- Espesores según planos

ARCHIVOS ADJUNTOS:
- Planos DXF (archivos CAD)
- Hoja de datos técnicos (especificaciones)
- Lista de materiales

PUNTOS CRÍTICOS:
- Canal para O-ring con tolerancia ±0.1mm (ver plano)
- Superficie de sellado refrentada y pulida (Ra < 1.6μm)
- Sin burbujas en material

Por favor incluir en cotización:
- Costo unitario por componente
- Tiempo de entrega
- Garantía dimensional
- Forma de pago

Adjunto archivos técnicos completos.

Quedo atento a su respuesta.

Saludos,
[Su nombre]
[Contacto]
```

---

## 🎓 Recursos Adicionales

### Tutoriales de OpenSCAD
- Documentación oficial: https://openscad.org/documentation.html
- Tutorial en español: https://www.thingiverse.com/thing:...
- YouTube: "OpenSCAD Tutorial for Beginners"

### Información sobre Mecanizado de Acrílico
- Guía de mecanizado: https://lucite.com/machining-guide
- Velocidades y avances: Ver HOJA_TECNICA_TAPA_SUPERIOR.md

### Proveedores de Material
- Acrílico cast: Distribuidores locales de plásticos de ingeniería
- O-rings: Parker Hannifin, Marco Rubber
- Hardware: Ferreterías industriales

---

## ✅ Resultado Final

Al completar estos pasos, tendrá:

- ✅ Modelos 3D paramétricos editables (.scad)
- ✅ Planos 2D para manufactura (.dxf)
- ✅ Modelos para impresión 3D (.stl)
- ✅ Hojas de datos técnicos completas
- ✅ Especificaciones de manufactura
- ✅ Listas de verificación
- ✅ Todo listo para enviar al fabricante

---

**Tiempo estimado:** 30 minutos - 2 horas (según familiaridad con software)

**Próximo paso:** Ejecutar `generar_planos.bat` y verificar resultados

---

**Documento:** Instrucciones para Generación de Planos  
**Versión:** 1.0  
**Fecha:** 2026-01-12  
**Proyecto:** Permeámetro con Sistema de Sellado Mejorado
