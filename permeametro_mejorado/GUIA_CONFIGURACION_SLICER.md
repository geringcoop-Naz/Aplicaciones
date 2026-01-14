# GUÍA PASO A PASO: CONFIGURACIÓN DE SLICER

## 🎯 Objetivo: Preparar archivos G-code para imprimir el permeámetro

---

## 📋 ANTES DE EMPEZAR

### ✅ Checklist Pre-impresión

- [ ] OpenSCAD instalado
- [ ] Slicer instalado (Cura 5.x o PrusaSlicer 2.x)
- [ ] Filamento PETG ≥ 700g disponible
- [ ] Impresora calibrada (nivel de cama, E-steps, temperatura)
- [ ] Impresora con altura Z ≥ 320mm (para cuerpo) O plan B

---

## PASO 1: EXPORTAR STL DESDE OPENSCAD

### 1.1 Exportar Cuerpo con Brida

```bash
# En OpenSCAD:
1. Abrir: 01_cuerpo_con_brida_integrada.scad
2. F5 → Preview rápido (verificar que se ve bien)
3. F6 → Render completo (esperar ~60 segundos)
4. File > Export > Export as STL
5. Guardar como: cuerpo_brida_integrada.stl
6. Ubicación sugerida: Desktop/permeametro_stl/
```

### 1.2 Exportar Tapa Macho

```bash
1. Abrir: 02_tapa_macho.scad
2. F5 → Preview
3. F6 → Render (~30 segundos)
4. Export STL: tapa_macho.stl
```

### 1.3 Exportar Difusor y Base

```bash
# Difusor:
1. Abrir: 03_difusor_entrada.scad
2. F6 → Render
3. Export STL: difusor.stl

# Base:
1. Abrir: 04_base_inferior.scad
2. F6 → Render
3. Export STL: base.stl
```

**Resultado:** 4 archivos STL listos

---

## PASO 2: CONFIGURACIÓN DE CURA 5.x

### 2.1 Crear Perfil PETG Personalizado

```
1. Abrir Cura
2. Settings > Profiles > Create profile
3. Nombre: "PETG Permeametro"
4. Based on: Generic PETG
```

### 2.2 Parámetros Base PETG

Ir a **Settings > Configure setting visibility** y habilitar estos parámetros:

#### **Quality**
```
Layer Height: 0.2mm (ajustar por pieza)
Line Width: 0.4mm
Wall Line Count: 5
Top Layers: 6
Bottom Layers: 6
```

#### **Shell**
```
Wall Thickness: 2mm (5 walls × 0.4mm)
Top Thickness: 1.2mm
Bottom Thickness: 1.2mm
```

#### **Infill**
```
Infill Density: 50%
Infill Pattern: Grid (o Cubic)
```

#### **Material**
```
Printing Temperature: 240°C
Build Plate Temperature: 80°C
Flow: 100% (ajustar si es necesario)
```

#### **Speed**
```
Print Speed: 45mm/s
Wall Speed: 40mm/s
Travel Speed: 120mm/s
Initial Layer Speed: 20mm/s
```

#### **Cooling**
```
Enable Print Cooling: Yes
Fan Speed: 40%
Regular Fan Speed at Layer: 3
Initial Fan Speed: 0%
```

#### **Support**
```
Generate Support: Per pieza (ver abajo)
Support Structure: Tree
Support Z Distance: 0.2mm
```

#### **Build Plate Adhesion**
```
Build Plate Adhesion Type: Brim
Brim Width: 8mm
Brim Line Count: 20
```

**Guardar perfil:** Settings > Profiles > Update profile

---

## PASO 3: CONFIGURAR CADA PIEZA

### 🔷 PIEZA 1: CUERPO CON BRIDA INTEGRADA

**Archivo:** `cuerpo_brida_integrada.stl`  
**Peso:** ~350g  
**Tiempo:** ~26 horas

#### Configuración en Cura:

**1. Importar y Orientar:**
```
- Drag & drop STL en Cura
- Click derecho > Rotate > Ángulo X: 0°, Y: 0°, Z: 0°
- Orientación: VERTICAL (brida hacia arriba)
- Centrar en la cama
```

**2. Profile Base:**
```
- Seleccionar: "PETG Permeametro"
```

**3. Ajustes Específicos:**
```
Layer Height: 0.2mm
Wall Line Count: 5
Infill Density: 45%
Support: MÍNIMO
  - Support Overhang Angle: 50° (solo si brida >50°)
  - Support Type: Tree
Build Plate Adhesion: Brim 10-15mm
```

**4. Ajustes Avanzados (Settings > Custom):**
```
Speed:
  - Print Speed: 40mm/s (reducir para pieza alta)
  - Travel Speed: 100mm/s
  
Cooling:
  - Fan Speed: 35% (PETG no necesita mucho)
  
Special Modes:
  - Z Seam Alignment: Sharpest Corner
  - Z Seam Position: Back
```

**5. Verificar antes de Slice:**
```
✓ Altura total: 308mm (cabe en tu impresora)
✓ Brim aplicado
✓ No hay warnings rojos
✓ Tiempo estimado: 24-28h
✓ Material: 340-360g
```

**6. Slice:**
```
- Click "Slice"
- Revisar preview capa por capa
- Verificar primeras 10 capas (adherencia crítica)
- Save to File: cuerpo_brida.gcode
```

#### ⚠️ IMPORTANTE - Pieza Alta:

**Prevenir Warping:**
- Usar RAFT en lugar de brim (más seguro)
- Aplicar glue stick en toda la zona
- Cerrar puertas de impresora (enclosure)
- Verificar corrientes de aire
- Monitorear primeras 50 capas

**Si no tienes impresora alta (Z <320mm):**
```
Opción A: Dividir modelo en 2 secciones
  - Usar "Cut model" en Cura
  - Posición corte: Z=200mm
  - Imprimir ambas secciones
  - Pegar con solvente acrílico + epoxi

Opción B: Servicio de impresión 3D
  - Craftcloud.com
  - Sculpteo.com
  - 3DHubs.com
  - Costo estimado: $30-50 USD
```

---

### 🔷 PIEZA 2: TAPA MACHO

**Archivo:** `tapa_macho.stl`  
**Peso:** ~120g  
**Tiempo:** ~11 horas

#### Configuración en Cura:

**1. Importar y Orientar:**
```
- Importar STL
- Click derecho > Rotate
  * Ángulo X: 180° (voltear)
  * Y: 0°, Z: 0°
- Orientación: BOCA ABAJO
  (Cabeza en cama, plug hacia arriba)
```

**2. Ajustes Específicos:**
```
Layer Height: 0.15mm (mejor acabado canal O-ring)
Wall Line Count: 5
Infill Density: 50%
Support: SÍ (CRITICAL)
  - Generate Support: Yes
  - Support Structure: Tree
  - Support Overhang Angle: 45°
  - Support Placement: Everywhere
  - Support Z Distance: 0.2mm
Build Plate Adhesion: Brim 8mm
Print Speed: 45mm/s
Cooling Fan: 40%
```

**3. Soportes Manuales (Recomendado):**
```
- Usar "Support Blocker" para evitar soportes en canal O-ring
- Support solo bajo el plug cilíndrico
```

**4. Slice y Verificar:**
```
✓ Soportes solo en plug
✓ Canal O-ring accesible para limpieza
✓ Tiempo: 10-12h
✓ Material: 115-125g
```

**Post-impresión crítico:**
- Remover soportes CON CUIDADO del canal O-ring
- Limpiar canal con navaja/cutter
- Lijar suavemente con lija 400-600 enrollada

---

### 🔷 PIEZA 3: DIFUSOR PERFORADO

**Archivo:** `difusor.stl`  
**Peso:** ~15g  
**Tiempo:** ~2 horas

#### Configuración en Cura:

**1. Orientar:**
```
- Plano horizontal (como está)
```

**2. Ajustes:**
```
Layer Height: 0.1mm (ALTA CALIDAD para perforaciones)
Wall Line Count: 3
Infill Density: 30%
Support: Opcional
  - Si perforaciones son pasantes: Support = Yes
  - Si son ciegas: Support = No
Build Plate Adhesion: Brim 3mm
```

**3. Alternativa Recomendada:**
```
Si perforaciones salen mal:
1. Imprimir disco SÓLIDO (sin perforaciones)
2. Marcar posiciones con el modelo
3. Perforar manualmente con broca Ø2mm
```

---

### 🔷 PIEZA 4: BASE CON CÁMARA

**Archivo:** `base.stl`  
**Peso:** ~150g  
**Tiempo:** ~12 horas

#### Configuración en Cura:

**1. Orientar:**
```
- Click derecho > Rotate
  * X: 180° (voltear, patas arriba)
```

**2. Ajustes:**
```
Layer Height: 0.2mm
Wall Line Count: 5
Infill Density: 50%
Support: SÍ
  - Support Structure: Tree
  - Para cámara de sedimentación interior
Build Plate Adhesion: Brim 8mm
```

---

## PASO 4: ORDEN DE IMPRESIÓN RECOMENDADO

### Día 1 - Piezas de Prueba (6h)
```
1. Difusor (2h) → Verificar calidad
2. Base (sección, 4h) → Test de parámetros
```

**Objetivo:** Validar configuración antes de piezas largas

### Día 2-3 - Tapa Macho (11h)
```
3. Tapa macho completa
```

**Por qué ahora:** Pieza crítica pero más corta que cuerpo

### Día 3-4 - Base Completa (12h)
```
4. Base completa
```

### Día 5-7 - Cuerpo (26h)
```
5. Cuerpo con brida (PIEZA MÁS CRÍTICA)
```

**Por qué al final:** 
- Ya tienes experiencia con PETG
- Parámetros validados
- Confianza en la impresora

**Total tiempo:** ~51 horas netas de impresión

---

## PASO 5: CONFIGURACIÓN ALTERNATIVA - PRUSASLICER

### Perfil Base PETG

```ini
[print_settings]
layer_height = 0.2
perimeters = 5
top_solid_layers = 6
bottom_solid_layers = 6
fill_density = 50%
fill_pattern = grid

[filament_settings]
temperature = 240
bed_temperature = 80
fan_speed = 40

[printer_settings]
speed = 45
travel_speed = 120
first_layer_speed = 20

[support]
support_material = 1 (per pieza)
support_material_pattern = rectilinear
support_material_spacing = 2.5
```

**Mismo orden y orientaciones que Cura**

---

## PASO 6: MONITOREO DURANTE IMPRESIÓN

### Primeras 10 Capas (CRÍTICO)

```
Verificar cada 15 minutos:
✓ Brim/Raft adherido firmemente
✓ Sin esquinas levantadas
✓ Extrusión uniforme
✓ Sin gaps en las capas

Si hay problemas:
→ Pausar
→ Ajustar temperatura cama +5°C
→ Limpiar superficie
→ Reiniciar
```

### Durante Impresión (Cada 4-6h)

```
✓ Filamento fluyendo bien
✓ No hay bucles o enredos
✓ Temperatura estable
✓ Sin warping visible
✓ Ventilador funcionando
```

### Últimas 10 Capas

```
✓ Superficie superior lisa
✓ Sin gaps en top layers
✓ Cooling adecuado para overhangs
```

---

## PASO 7: POST-PROCESAMIENTO

### Inmediatamente Después de Terminar

```
1. Esperar 5-10 minutos en cama caliente
2. Temperatura cama → 0°C
3. Esperar enfriar a 40°C
4. Remover pieza con espátula
5. Quitar brim/raft con alicates
```

### Limpieza de Soportes

```
Herramientas:
- Alicates punta fina
- Navaja/cutter
- Lima pequeña
- Lija 220-400-600

Proceso:
1. Remover soportes grandes con alicates
2. Limpiar residuos con navaja
3. Lijar superficies tocadas por soportes
4. ESPECIAL CUIDADO en canal O-ring de tapa
```

### Acabado Superficial

```
Tapa - Cara de sellado:
1. Lijar con 220 grit (eliminar líneas gruesas)
2. Lijar con 400 grit (suavizar)
3. Lijar con 600 grit (acabado)
4. Limpiar con alcohol isopropílico

Cuerpo - Interior:
1. Verificar que no hay hilos sueltos
2. Limpiar con brocha
3. Pasar trapo húmedo
```

### Verificación Dimensional

```
Con calibrador verificar:
✓ Ø interior cuerpo: 63.0 ±0.5mm
✓ Ø exterior plug tapa: 62.0 ±0.5mm
✓ PCD pernos cuerpo: 95.0 ±0.5mm
✓ PCD pernos tapa: 95.0 ±0.5mm
✓ Agujeros pernos: Ø6.5+

Si fuera de tolerancia:
→ Ajustar parámetros slicer
→ Calibrar "Horizontal Expansion"
→ Reimprimir si crítico
```

---

## 📊 RESUMEN DE PARÁMETROS POR PIEZA

| Pieza | Layer | Walls | Infill | Support | Brim | Tiempo |
|-------|-------|-------|--------|---------|------|--------|
| **Cuerpo** | 0.2mm | 5 | 45% | Mínimo | 10mm | 26h |
| **Tapa** | 0.15mm | 5 | 50% | Sí (Tree) | 8mm | 11h |
| **Difusor** | 0.1mm | 3 | 30% | Opcional | 3mm | 2h |
| **Base** | 0.2mm | 5 | 50% | Sí (Tree) | 8mm | 12h |

**Material PETG:** Temp 240°C / Cama 80°C / Fan 35-40%

---

## ✅ CHECKLIST FINAL PRE-IMPRESIÓN

### Por Cada Pieza

- [ ] STL importado en slicer
- [ ] Orientación correcta verificada
- [ ] Perfil PETG aplicado
- [ ] Parámetros específicos ajustados
- [ ] Soportes configurados (si aplica)
- [ ] Brim/Raft aplicado
- [ ] Slice completado sin errores
- [ ] Preview revisado capa por capa
- [ ] Tiempo/material aceptable
- [ ] G-code guardado con nombre claro
- [ ] Impresora calibrada y lista
- [ ] Filamento suficiente cargado
- [ ] Cama limpia y nivelada

---

**¿Listo para enviar el primer G-code a la impresora?** 🖨️

Recomendación: **Empieza con el difusor** (2h, pieza pequeña, validas parámetros)

¿Qué slicer usas (Cura o PrusaSlicer) para darte instrucciones más específicas?
