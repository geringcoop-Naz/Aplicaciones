# PLANOS DE MANUFACTURA - Permeámetro Mejorado

## Archivos Generados

Este directorio contiene los planos técnicos 2D para fabricación de cada componente.

### Formatos Disponibles:

**Modelos 3D (OpenSCAD):**
- `modelos_3d/*.scad` - Archivos fuente editables
- Pueden exportarse a STL para impresión 3D o mecanizado CNC

**Planos 2D (a generar):**
- DXF - Para corte láser, CNC, CAM
- PDF - Para impresión y documentación
- SVG - Para visualización web

---

## Instrucciones para Generar Planos 2D

### Opción 1: Usando OpenSCAD (Recomendado)

1. **Abrir cada archivo .scad** en OpenSCAD
2. **Renderizar** (F6) el modelo
3. **Exportar proyección 2D:**
   - Para vista superior: Usar `projection(cut = true)`
   - Para corte transversal: Usar `projection(cut = true)` con rotación

4. **Exportar a DXF:**
   - File > Export > Export as DXF
   - Usar para corte láser o mecanizado CNC

5. **Exportar a SVG:**
   - File > Export > Export as SVG
   - Usar para visualización o conversión a PDF

### Opción 2: Usando Scripts de Proyección

Hemos incluido scripts que generan automáticamente las proyecciones 2D:

```bash
# En Windows (PowerShell):
cd modelos_3d
foreach ($file in Get-ChildItem -Filter "*.scad") {
    openscad -o "$($file.BaseName)_top.dxf" -D 'projection(cut=false) translate([0,0,-1]) rotate([0,0,0]) import("$file");' "$file"
}
```

```bash
# En Linux/Mac:
cd modelos_3d
for file in *.scad; do
    openscad -o "${file%.scad}_top.dxf" -D 'projection(cut=false) import("$file");' "$file"
done
```

---

## Planos Requeridos para Manufactura

### 1. TAPA SUPERIOR (01_tapa_superior.scad)

**Vistas necesarias:**
- [ ] Vista superior (planta) - Ubicación de perforaciones
- [ ] Vista inferior - Canal de O-ring
- [ ] Corte A-A - Perfil del canal
- [ ] Vista isométrica - Referencia

**Dimensiones críticas a acotar:**
- ✓ Diámetro total: Ø120mm
- ✓ Diámetro canal O-ring: Ø70mm
- ✓ Profundidad canal: 2.5mm ±0.05
- ✓ Ancho canal: 6.0mm ±0.1
- ✓ PCD pernos: Ø95mm
- ✓ Ø perforaciones pernos: 6.5mm (+0.2/-0)
- ✓ Espesor total: 23mm

### 2. BRIDA INFERIOR (02_brida_inferior.scad)

**Vistas necesarias:**
- [ ] Vista superior - Perforaciones
- [ ] Vista lateral - Espesor
- [ ] Detalle alineación con tapa

**Dimensiones críticas:**
- ✓ Diámetro exterior: Ø110mm
- ✓ Diámetro interior: Ø73.5mm (holgura para tubo)
- ✓ Espesor: 8mm
- ✓ PCD pernos: Ø95mm (alineado con tapa)

### 3. DIFUSOR (03_difusor_entrada.scad)

**Vistas necesarias:**
- [ ] Vista superior - Patrón de perforaciones
- [ ] Sección transversal

**Dimensiones críticas:**
- ✓ Diámetro: Ø50mm
- ✓ Espesor: 2mm
- ✓ Ø perforaciones: 2mm (37 unidades)
- ✓ Patrón: 3 anillos concéntricos

### 4. BASE INFERIOR (04_base_inferior.scad)

**Vistas necesarias:**
- [ ] Vista superior
- [ ] Vista inferior - Patas
- [ ] Corte B-B - Cámara de sedimentación

**Dimensiones críticas:**
- ✓ Diámetro: Ø110mm
- ✓ Espesor: 10mm
- ✓ Profundidad cámara: 10mm
- ✓ Ubicación patas: Ø85mm, 120° aparte

---

## Tolerancias Generales

Salvo indicación en contrario:

| Característica | Tolerancia |
|----------------|------------|
| Dimensiones lineales | ±0.5mm |
| Dimensiones críticas de sellado | ±0.1mm |
| Perforaciones | +0.2mm / -0mm |
| Ángulos | ±1° |
| Planicidad superficies de sellado | 0.05mm |
| Acabado superficial general | Ra 3.2 μm |
| Acabado superficies de sellado | Ra 1.6 μm |

---

## Material y Notas de Fabricación

### Material Recomendado:
- **Tapa, brida, base:** Acrílico cast (colado) transparente
- **Alternativa económica:** PVC transparente
- **Difusor:** Acero inoxidable 316L

### Código de Materiales:
- PMMA (Polimetilmetacrilato) - Acrílico
- PVC - Policloruro de vinilo
- AISI 316L - Acero inoxidable

### Procesos de Fabricación:
- **Corte:** Láser, sierra de disco, fresadora
- **Mecanizado:** Torno, fresadora CNC
- **Acabado:** Pulido, lijado fino (P1000-P2000)
- **Unión:** Solvente para acrílico (Weld-On #4)

---

## Checklist de Planos para el Fabricante

Entregar al taller de mecanizado:

- [ ] Plano tapa superior (3 vistas + sección)
- [ ] Plano brida inferior (2 vistas)
- [ ] Plano difusor (2 vistas)
- [ ] Plano base (3 vistas + sección)
- [ ] Lista de materiales
- [ ] Especificaciones de acabado superficial
- [ ] Tolerancias críticas resaltadas
- [ ] Archivo DXF para CNC (si aplica)

---

## Software Recomendado

### Para Visualización 3D:
- **OpenSCAD** (gratuito) - https://openscad.org/
- **FreeCAD** (gratuito) - https://freecadweb.org/
- **Blender** (gratuito) - https://blender.org/

### Para Edición de Planos 2D:
- **LibreCAD** (gratuito) - https://librecad.org/
- **QCAD** (comercial) - https://qcad.org/
- **DraftSight** (comercial) - https://draftsight.com/

### Para Conversión DXF a PDF:
- **Inkscape** (gratuito) - https://inkscape.org/
- Abrir DXF, exportar como PDF

---

## Próximos Pasos

1. **Abrir archivos .scad** en OpenSCAD
2. **Verificar dimensiones** (ajustar si es necesario)
3. **Exportar a DXF/STL** según proceso de fabricación
4. **Generar planos PDF** con acotaciones
5. **Enviar a fabricante** con especificaciones

---

## Archivos en este Directorio

```
modelos_3d/
├── 00_ensamblaje_completo.scad    # Vista de ensamblaje
├── 01_tapa_superior.scad          # Tapa con brida
├── 02_brida_inferior.scad         # Brida de cuerpo
├── 03_difusor_entrada.scad        # Difusor perforado
├── 04_base_inferior.scad          # Base con patas
└── README_PLANOS.md               # Este archivo
```

---

## Contacto y Soporte

Para consultas sobre los modelos 3D o planos:
1. Revise los comentarios dentro de cada archivo .scad
2. Ajuste los parámetros en la sección "PARÁMETROS" de cada archivo
3. Las dimensiones están parametrizadas para fácil modificación

---

**Versión:** 1.0  
**Fecha:** 2026-01-12  
**Proyecto:** Permeámetro con Sistema de Sellado Mejorado
