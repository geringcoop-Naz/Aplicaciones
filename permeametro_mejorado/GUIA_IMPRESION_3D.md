# GUÍA DE FABRICACIÓN POR IMPRESIÓN 3D

## 🎯 VENTAJAS DE LA FABRICACIÓN ADITIVA

### Por qué Impresión 3D es Ideal para este Proyecto

✅ **Costo:** ~$20-40 USD en material vs $200-300 USD en mecanizado  
✅ **Velocidad:** 2-3 días de impresión vs 2-3 semanas de manufactura  
✅ **Iteración:** Modificar diseño y reimprimir en horas  
✅ **Geometrías complejas:** Canal O-ring, difusor perforado, todo en una pieza  
✅ **Disponibilidad:** Cualquier persona con impresora 3D puede fabricarlo  
✅ **Archivos listos:** Los .scad exportan directamente a STL  

---

## 🧵 SELECCIÓN DE MATERIAL (Filamento)

### Material Recomendado: **PETG**

**¿Por qué PETG?**
| Propiedad | Valor | Ventaja para Permeámetro |
|-----------|-------|--------------------------|
| Resistencia química | Excelente | Resiste soluciones salinas |
| Resistencia al agua | Impermeable | No se hincha ni degrada |
| Facilidad de impresión | Media | Menos problemas que ABS |
| Resistencia mecánica | Alta | Soporta presión de 2-3 bar |
| Transparencia | Disponible | Ver muestra de suelo (opcional) |
| Costo | $20-30/kg | Accesible |
| Post-procesamiento | Mínimo | No requiere acetona |

**Marcas recomendadas:**
- Prusament PETG (alta calidad)
- eSun PETG
- Overture PETG
- ColorFabb HT (alta temperatura)

### Alternativas

**Opción 2: ABS**
- ✅ Excelente resistencia química
- ✅ Resistencia térmica superior
- ❌ Difícil de imprimir (warping)
- ❌ Requiere cama caliente >100°C
- ❌ Necesita post-proceso con acetona
- **Recomendado solo si tienes experiencia con ABS**

**Opción 3: Nylon (PA)**
- ✅ Resistencia mecánica excepcional
- ✅ Muy resistente químicamente
- ❌ Higroscópico (absorbe humedad del aire)
- ❌ Requiere impresora especializada
- ❌ Costoso ($40-60/kg)
- **Solo para versión avanzada**

**❌ NO USAR:**
- **PLA:** Se degrada con agua prolongada, no resistente químicamente
- **TPU/TPE:** Demasiado flexible

---

## 📐 PARÁMETROS DE IMPRESIÓN

### Configuración General (PETG)

```ini
; PARÁMETROS CRÍTICOS

[Temperatura]
Nozzle = 235-245°C
Bed = 70-80°C
Chamber = Ambient (no requerida)

[Velocidad]
Print Speed = 40-50 mm/s (paredes)
Travel Speed = 120 mm/s
First Layer = 20 mm/s

[Capas]
Layer Height = 0.2 mm (calidad/velocidad)
            = 0.15 mm (alta calidad para canal O-ring)
            = 0.1 mm (máxima calidad, muy lento)
Initial Layer = 0.25 mm

[Perímetros]
Walls = 4-5 (mínimo 3mm espesor)
Top Layers = 5-6
Bottom Layers = 5-6

[Relleno]
Infill = 40-60% (componentes estructurales)
Pattern = Grid o Cubic
       = Gyroid (para máxima resistencia)

[Soporte]
Supports = SÍ (para difusor y detalles)
Type = Tree supports (recomendado)
     = Linear (alternativa)
Overhang Angle = 50°

[Adhesión]
Bed Adhesion = Brim (5-8mm) o Raft
             = CRÍTICO para evitar warping

[Enfriamiento]
Part Cooling = 30-50% (PETG no requiere mucho)
             = NO 100% (causa warping)
```

### Configuración Específica por Componente

#### 1. Tapa Superior con Brida

**Orientación:** Boca abajo (brida en la cama)
```
Cara de sellado hacia arriba ←  Mejor acabado
        ╔══════════╗
        ║          ║
        ║   TAPA   ║
        ║          ║
        ╚══════════╝
     ██████████████████  ← Brida en cama caliente
```

**Parámetros especiales:**
- Layer height: **0.15mm** (superficie sellado crítica)
- Walls: **5 perímetros** (resistencia)
- Top layers: **8** (superficie lisa)
- Infill: **50%** Grid
- Soportes: **SÍ** para canal O-ring (configurar cuidadosamente)
- Brim: **8mm** (antiwarping)

**Post-impresión:**
- Lijar suavemente superficie de sellado con 400-600 grit
- Verificar planicidad con regla metálica

#### 2. Brida Inferior

**Orientación:** Plano (cara en la cama)

**Parámetros:**
- Layer height: 0.2mm
- Walls: 4
- Infill: 40%
- Soportes: NO necesarios
- Brim: 5mm

#### 3. Difusor Perforado

**Orientación:** Plano horizontal

**Parámetros especiales:**
- Layer height: **0.1mm** (perforaciones limpias)
- Walls: 3
- Infill: **30%** (no requiere mucho)
- Soportes: **SÍ** para perforaciones si son pasantes
- Alternativa: Imprimir con perforaciones ciegas y perforar manualmente

**Opción recomendada:**
- Diseñar perforaciones de **Ø2.2mm** en STL (compensar shrinkage)
- Perforar final con broca Ø2mm para limpieza

#### 4. Base con Cámara

**Orientación:** Boca abajo (patas hacia arriba)

**Parámetros:**
- Layer height: 0.2mm
- Walls: 5 (resistencia)
- Infill: 50%
- Soportes: **SÍ** para cámara de sedimentación
- Brim: 8mm

---

## 🔧 POST-PROCESAMIENTO

### Tratamiento de Superficies de Sellado

**Superficie de contacto O-ring (Tapa):**

1. **Lijado progresivo:**
   - Lija 220 grit → Quitar líneas de capa gruesas
   - Lija 400 grit → Suavizar
   - Lija 600 grit → Acabado fino
   - Lija 1000 grit (opcional) → Pulido

2. **Limpieza:**
   - Lavar con agua y jabón
   - Enjuagar con alcohol isopropílico
   - Secar completamente

3. **Inspección:**
   - Pasar regla metálica
   - Planicidad ≤0.1mm aceptable
   - Sin líneas de capa visibles

### Sellado de Porosidad (Opcional pero Recomendado)

**Problema:** PETG puede tener microporosidad entre capas

**Solución 1 - Resina Epoxi:**
```
1. Mezclar resina epoxi de baja viscosidad
2. Aplicar capa fina con pincel en superficies críticas
3. Dejar curar 24 horas
4. Lijar suavemente para nivelar
5. Resultado: Superficie totalmente impermeable
```

**Solución 2 - XTC-3D (Especializado):**
- Producto comercial para sellado de impresiones 3D
- Aplicar según instrucciones del fabricante
- Excelente acabado liso

**Solución 3 - Baño de acetona (solo ABS):**
- Vapor de acetona suaviza superficie
- Cierra poros automáticamente
- **NO funciona con PETG**

### Limpieza de Soportes

**Herramientas:**
- Alicates de punta fina
- Cutter/navaja
- Limas pequeñas
- Lija de grano fino

**Procedimiento:**
1. Remover soportes con cuidado
2. Limpiar residuos con navaja
3. Lijar zonas tocadas por soportes
4. Especialmente crítico en:
   - Canal O-ring
   - Agujeros de pernos
   - Perforaciones del difusor

---

## 📦 EXPORTACIÓN DE ARCHIVOS STL

### Desde OpenSCAD

**Procedimiento:**

1. **Abrir modelo:**
   ```
   File > Open > 01_tapa_superior.scad
   ```

2. **Renderizar:**
   ```
   Presionar F6 (Render completo)
   Esperar a que termine (puede tardar minutos)
   ```

3. **Exportar:**
   ```
   File > Export > Export as STL
   Guardar como: tapa_superior.stl
   ```

4. **Verificar en software de slicing:**
   ```
   Abrir en Cura/PrusaSlicer/Simplify3D
   Verificar que no tiene errores (manifiesto)
   ```

**Repetir para:**
- `02_brida_inferior.scad` → `brida_inferior.stl`
- `03_difusor_entrada.scad` → `difusor.stl`
- `04_base_inferior.scad` → `base_inferior.stl`

### Script Batch Automático (Windows)

Ya existe: `modelos_3d/generar_planos.bat`  
Genera STL automáticamente de todos los modelos

---

## 🖨️ PREPARACIÓN EN SLICER (Cura/PrusaSlicer)

### Perfil Recomendado - PETG Genérico

**Para Cura 5.x:**

1. **Importar STL:** Drag & drop archivo
2. **Escalar:** Verificar que está en milímetros (100% scale)
3. **Orientar:** Usar orientaciones recomendadas arriba
4. **Configuración:**
   - Profile: Generic PETG
   - Layer Height: 0.15-0.2mm
   - Infill: 40-50%
   - Support: Tree
   - Adhesion: Brim 8mm

5. **Slice y verificar:**
   - Tiempo de impresión
   - Cantidad de material
   - No warnings de errores

6. **Guardar G-code**

### Para PrusaSlicer:

Similar, usar perfil predefinido para PETG
- 0.2mm QUALITY o 0.15mm OPTIMAL
- Support = For support enforcers only
- Manually paint supports en canal O-ring

---

## 💰 ESTIMACIÓN DE COSTOS Y TIEMPOS

### Por Componente

| Componente | Peso (g) | Tiempo | Costo Material | Electricidad | Total |
|------------|----------|--------|----------------|--------------|-------|
| **Tapa superior** | 180g | 14h | $4.50 | $1.40 | ~$6 |
| **Brida inferior** | 60g | 4h | $1.50 | $0.40 | ~$2 |
| **Difusor** | 15g | 2h | $0.40 | $0.20 | ~$1 |
| **Base inferior** | 150g | 12h | $3.75 | $1.20 | ~$5 |
| **TOTAL** | **405g** | **32h** | **$10** | **$3** | **~$14** |

*Asumiendo PETG a $25/kg y electricidad a $0.10/kWh*

**Comparación:**
- Impresión 3D: **$14 USD**
- Mecanizado CNC: **$200-300 USD**
- **Ahorro: 93-95%** 🎉

---

## 🔬 CONSIDERACIONES TÉCNICAS

### Resistencia a Presión

**Test de presión interna:**
- PETG impreso al 50% infill soporta **hasta 5 bar** con 4 paredes
- Nuestro sistema opera a **máximo 2 bar**
- **Factor de seguridad: 2.5×** ✅

**Verificación:**
- Realizar prueba hidrostática a 3 bar antes del primer uso
- Si no falla en 10 minutos, es seguro para uso a 2 bar

### Resistencia Química

**PETG vs Soluciones Comunes:**
| Químico | Concentración | Compatibilidad |
|---------|---------------|----------------|
| Agua destilada | 100% | ✅ Excelente |
| NaCl (salmuera) | 0-10% | ✅ Excelente |
| HCl | <1% | ⚠️ Aceptable corto plazo |
| NaOH | <1% | ⚠️ Aceptable corto plazo |
| Acetona | Puro | ❌ Incompatible |
| Alcohol isopropílico | <70% | ✅ Buena |

**Para este proyecto (soluciones salinas):** ✅ Perfectamente compatible

### Permeabilidad y Sellado

**Problema potencial:**
- PETG puede tener microporosidad entre capas
- Puede permitir transpiración lenta de líquido

**Soluciones:**
1. **Imprimir con suficientes paredes:** 4-5 perímetros
2. **Sellar con epoxi:** Especialmente superficies en contacto con líquido
3. **Usar PETG de alta calidad:** Menos poros
4. **Sistema de doble sellado:** O-ring + empaque PTFE

---

## 🛠️ PROBLEMAS COMUNES Y SOLUCIONES

### Problema 1: Warping de la Tapa

**Síntomas:**
- Brida se levanta de la cama
- Pieza queda curvada

**Soluciones:**
- ✅ Usar brim de 10mm
- ✅ Aumentar temperatura cama a 85°C
- ✅ Limpiar cama con IPA antes de imprimir
- ✅ Usar adhesivo (stick glue o laquear)
- ✅ Reducir velocidad capa inicial a 15mm/s
- ✅ Enclosure (caja cerrada) si es posible

### Problema 2: Canal O-ring con Defectos

**Síntomas:**
- Soportes dejaron marcas
- Superficie rugosa

**Soluciones:**
- ✅ Usar tree supports (menos contacto)
- ✅ Configurar support Z-distance a 0.2mm
- ✅ Lijar cuidadosamente después
- ✅ Rellenar con epoxi y lijar
- ✅ Imprimir con layer height 0.1mm

### Problema 3: Agujeros de Pernos Demasiado Ajustados

**Síntomas:**
- Pernos M6 no entran

**Soluciones:**
- ✅ Diseñar agujeros como Ø6.5mm (ya está en modelos)
- ✅ Calibrar impresora (expansion compensation)
- ✅ Repasar con broca Ø6.5mm después de imprimir
- ✅ Configurar "Hole Horizontal Expansion" en slicer

### Problema 4: Perforaciones del Difusor Obstruidas

**Síntomas:**
- Filamento fundido obstruye agujeros pequeños

**Soluciones:**
- ✅ Imprimir con layer height bajo (0.1mm)
- ✅ Perforar manualmente con broca Ø2mm después
- ✅ Usar aguja caliente para limpiar mientras está caliente
- ✅ Diseñar agujeros ligeramente más grandes (Ø2.2mm)

---

## 📋 CHECKLIST PRE-IMPRESIÓN

Antes de iniciar la impresión de cada pieza:

### Tapa Superior
- [ ] STL importado y orientado correctamente (brida abajo)
- [ ] Escala verificada (medir en slicer)
- [ ] Soportes generados (tree, solo donde es necesario)
- [ ] Brim configurado (8-10mm)
- [ ] Layer height: 0.15mm
- [ ] Walls: 5
- [ ] Infill: 50%
- [ ] Tiempo estimado aceptable (~14h)
- [ ] Material suficiente en carrete
- [ ] Cama limpia y nivelada

### Brida Inferior
- [ ] Orientación: Plana en cama
- [ ] Layer height: 0.2mm
- [ ] Walls: 4
- [ ] Infill: 40%
- [ ] Brim: 5mm

### Difusor
- [ ] Verificar que perforaciones son pasantes
- [ ] Layer height: 0.1mm (calidad)
- [ ] Soportes si es necesario
- [ ] Planificar perforación manual posterior

### Base
- [ ] Orientación: Patas arriba
- [ ] Soportes para cámara interior
- [ ] Walls: 5
- [ ] Infill: 50%
- [ ] Brim: 8mm

---

## 🎓 RECOMENDACIONES FINALES

### Para Mejor Resultado

1. **Calibrar impresora antes:**
   - Nivelar cama perfectamente
   - Calibrar pasos/mm (E-steps)
   - Calibrar temperatura óptima
   - Test de retracción

2. **Imprimir piezas de prueba primero:**
   - Imprimir solo la brida inferior (rápida, 4h)
   - Verificar calidad y dimensiones
   - Ajustar parámetros si es necesario
   - Luego imprimir tapa (pieza crítica)

3. **No apresurarse:**
   - Calidad > Velocidad
   - Mejor 40mm/s con buena calidad que 80mm/s defectuoso
   - Una reimpresión cuesta más tiempo que imprimir lento

4. **Documentar proceso:**
   - Tomar fotos de configuración exitosa
   - Anotar parámetros que funcionaron
   - Guardar perfiles de slicer

---

## 🔄 VENTAJAS ADICIONALES DE IMPRESIÓN 3D

### Iteración de Diseño

**Si encuentras que algo no funciona:**
1. Modificar archivo .scad
2. Exportar nuevo STL
3. Reimprimir esa pieza
4. Total tiempo: <24 horas
5. Costo: <$5

**Ejemplo:**
- Canal O-ring muy ajustado → Editar `canal_profundidad = 2.5` a `2.7`
- Reimprimir solo tapa → 14 horas, $6
- NO necesitas volver al taller de mecanizado

### Personalización

**Fácil adaptar a diferentes tamaños:**
- Columna Ø50mm → Cambiar parámetro `diametro_columna = 50`
- Altura 400mm → Cambiar `altura_columna = 400`
- Reimprimir componentes ajustados

---

## 📁 ARCHIVOS REQUERIDOS

### Formato STL

Los archivos OpenSCAD ya creados se exportan a:
```
permeametro_mejorado/modelos_3d/stl/
├── tapa_superior_impresion3d.stl        (180g, ~14h)
├── brida_inferior_impresion3d.stl       (60g, ~4h)
├── difusor_perforado_impresion3d.stl    (15g, ~2h)
└── base_inferior_impresion3d.stl        (150g, ~12h)
```

**Total: 4 archivos STL → Imprimir → Ensamblar** ✅

---

**Documento:** Guía de Fabricación por Impresión 3D  
**Código:** 3DP-GUIDE-001  
**Fecha:** 12-ENE-2026  
**Revisión:** A  
**Material Recomendado:** PETG  
**Costo Total Estimado:** $14 USD material + $3 electricidad = **$17 USD**

**¡El proyecto ahora es accesible para CUALQUIER persona con impresora 3D!** 🎉
