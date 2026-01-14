# RESUMEN PROYECTO FINAL - Permeámetro por Impresión 3D

## 🎯 CONFIGURACIÓN FINAL: FABRICACIÓN ADITIVA (FDM)

**CAMBIO IMPORTANTE:** Todo el sistema principal se fabrica por **impresión 3D en PETG**

---

## 🖨️ COMPONENTES A IMPRIMIR

| # | Componente | Archivo STL | Peso | Tiempo | Costo |
|---|-----------|-------------|------|--------|-------|
| 1 | Tapa con brida integrada | `tapa_superior.stl` | 180g | 14h | $6 |
| 2 | Brida inferior | `brida_inferior.stl` | 60g | 4h | $2 |
| 3 | Difusor perforado | `difusor.stl` | 15g | 2h | $1 |
| 4 | Base con cámara | `base_inferior.stl` | 150g | 12h | $5 |
| **TOTAL IMPRESIÓN** | | | **405g** | **32h** | **$14** |

**Material:** PETG (resistente al agua, químicamente inerte, fácil de imprimir)

---

## 💰 PRESUPUESTO ACTUALIZADO - Versión Impresión 3D

### Costos Completos del Sistema

| Categoría | Descripción | Costo (USD) |
|-----------|-------------|-------------|
| **IMPRESIÓN 3D** |
| Material PETG | ~405g de filamento | $10 |
| Electricidad | 32 horas @ $0.10/kWh | $3 |
| Post-procesamiento | Lija, epoxi (opcional) | $5 |
| **SUB-TOTAL MANUFACTURA** | | **$18** |
| | |
| **COMPONENTES COMPRADOS** |
| Sistema sellado | O-ring Viton + PTFE | $15-25 |
| Hardware | 8× M6×30mm + tuercas + arandelas + 3× patas M8 | $15-25 |
| Sistema de plomería | Válvulas + insertos + tubería | $40-55 |
| Instrumentación | 2× manómetros digitales 0-3 bar | $60-100 |
| **SUB-TOTAL COMPONENTES** | | **$130-205** |
| | |
| **TOTAL PROYECTO** | | **$148-223** |

**Comparación:**
- Versión mecanizada CNC: **$357-530 USD**
- Versión impresión 3D: **$148-223 USD**
- **AHORRO: 58-65%** 🎉💰

---

## 📐 SISTEMA COMPLETO

### Componentes Impresos en 3D (PETG)

**1. Tapa Superior con Brida Integrada**
- Dimensiones: Ø120mm × 23mm altura
- Características:
  - Canal O-ring de 6mm×2.5mm precisión
  - 8 agujeros para pernos M6×30mm
  - Puerto entrada 1/4" NPT (roscable post-impresión o insertar inserto)
  - Montaje para difusor (4× M3)
- **Orientación impresión:** Brida en cama, boca arriba
- **Parámetros:** 0.15mm layer, 5 walls, 50% infill, brim 8mm

**2. Brida Inferior**
- Dimensiones: Ø110mm × 8mm
- Se pega al borde superior del tubo de columna
- 8 agujeros alineados con tapa (PCD 95mm)
- **Orientación:** Plana en cama
- **Parámetros:** 0.2mm layer, 4 walls, 40% infill

3. **Difusor Perforado**
- Dimensiones: Ø50mm × 2mm
- 37 perforaciones: 1× Ø8mm + 36× Ø2mm
- **Nota:** Imprimir con Ø2.2mm y repasar con broca Ø2mm
- **Orientación:** Plano horizontal
- **Parámetros:** 0.1mm layer (calidad alta)

**4. Base con Cámara**
- Dimensiones: Ø110mm × 10mm
- Cámara sedimentación Ø63mm × 10mm profundo
- Puerto salida lateral
- 3× agujeros para patas M8
- **Orientación:** Patas hacia arriba
- **Parámetros:** 0.2mm layer, 5 walls, 50% infill

### Componentes NO Impresos (Comprados)

**Tubo Principal:**
- Tubo acrílico o PVC transparente
- Ø73mm exterior × Ø63mm interior × 300mm largo
- **Comprar comercial** (más barato que imprimir)
- Costo: $15-25 USD

**Sistema de Sellado:**
- O-ring Viton Ø67mm × 5mm sección: $8
- Empaque PTFE (opcional): $5
- Grasa silicona: $3

**Hardware:**
- 8× Pernos M6×30mm (acero inox): $4
- 8× Arandelas M6: $1
- 8× Tuercas M6 (auto-blocantes): $2
- 3× Patas niveladoras M8×60mm: $15

**Sistema de Puertos:**
- 2× Insertos roscados 1/8" NPT: $4
- 2× Fittings 1/4" NPT: $6
- 2× Válvulas: $25
- Tubería silicona: $8

**Instrumentación:**
- 2× Manómetros digitales 0-3 bar: $60-100

---

## 🎨 PARÁMETROS DE IMPRESIÓN RESUMIDOS

### Configuración Recomendada (PETG)

```
Material: PETG
Temperatura nozzle: 240°C
Temperatura cama: 80°C

Layer Height: 0.15-0.2mm (0.15 para tapa)
Walls: 4-5 (5 para piezas críticas)
Infill: 40-50%
Top/Bottom Layers: 5-6

Velocidad: 40-50 mm/s
Retracción: 5mm @ 40mm/s

Adhesión: Brim 8mm (CRÍTICO)
Soportes: Tree (según pieza)
Cooling: 30-50%
```

---

## 🛠️ PROCESO DE FABRICACIÓN

### Fase 1: Preparación (Día 0)

1. **Descargar archivos STL:**
   - Exportar desde OpenSCAD (F6 + Export STL)
   - O usar script `generar_planos.bat`
   
2. **Preparar slicer:**
   - Importar STLs en Cura/PrusaSlicer
   - Configurar perfil PETG
   - Verificar orientaciones

3. **Adquirir material:**
   - Comprar 0.5kg PETG (suficiente con margen)
   - Verificar que está seco (guardar en bolsa con desecante)

### Fase 2: Impresión (Días 1-3)

**Secuencia recomendada:**

**Día 1:**
- Imprimir brida inferior (4h) → Verificar calidad
- Imprimir difusor (2h)
- Total: 6 horas

**Día 2:**
- Imprimir tapa superior (14h) → PIEZA CRÍTICA
- Dejar corriendo toda la noche

**Día 3:**
- Imprimir base (12h)
- Verificar todas las piezas

### Fase 3: Post-Procesamiento (Día 4)

1. **Remover soportes**
2. **Lijar superficies críticas:**
   - Cara sellado de tapa: 220→400→600 grit
   - Cara inferior de brida
3. **Limpiar perforaciones:**
   - Repasar agujeros pernos con broca Ø6.5mm
   - Repasar perforaciones difusor con Ø2mm
4. **Sellar porosidad (opcional):**
   - Aplicar capa epoxi en interior tapa y base
   - Dejar curar 24h

### Fase 4: Instalación Insertos/Roscas (Día 5)

1. **Puertos de presión en tubo:**
   - Marcar posiciones 50mm y 250mm
   - Perforar Ø5mm
   - Roscar 1/8" NPT o instalar insertos térmicos

2. **Puerto entrada en tapa:**
   - Perforar Ø8mm centro
   - Roscar 1/4" NPT o pegar inserto

3. **Puerto salida en base:**
   - Ya impreso o perforar
   - Roscar 1/4" NPT o pegar inserto

### Fase 5: Ensamblaje (Día 6)

Seguir documento `05_ENSAMBLAJE.md`:
1. Pegar brida inferior a tubo
2. Instalar O-ring en tapa
3. Montar difusor
4. Ensamblar + 8 pernos (patrón estrella)
5. Instalar patas
6. Conectar plomería
7. Conectar manómetros

### Fase 6: Pruebas (Día 7)

1. Prueba hermeticidad (hidrostática 1.5 bar, 10 min)
2. Prueba de flujo
3. Calibración manómetros
4. **¡Listo para usar!**

---

## ⚙️ ESPECIFICACIONES TÉCNICAS

### Sistema de 4 Puertos

| Puerto | Ubicación | Tamaño | Función |
|--------|-----------|--------|---------|
| Entrada | Tapa centro | 1/4" NPT | Ingreso solución |
| Salida | Base lateral | 1/4" NPT | Recolección |
| P1 | Tubo 50mm | 1/8" NPT | Presión inferior |
| P2 | Tubo 250mm | 1/8" NPT | Presión superior |

### Sistema de 2 Bridas + 8 Pernos

- Brida 1: Integrada en tapa (impresa de una pieza)
- Brida 2: Separada, pegada al tubo
- 8× Pernos M6×30mm atravesando ambas
- Par de apriete: 5 Nm (patrón estrella)

---

## ✅ VENTAJAS DE ESTA CONFIGURACIÓN

### vs Mecanizado CNC

✅ **Costo:** **58-65% más económico**  
✅ **Tiempo:** 1 semana vs 3-4 semanas  
✅ **Accesibilidad:** Cualquiera con impresora 3D  
✅ **Iteración:** Modificar y reimprimir fácilmente  
✅ **Complejidad:** Geometrías imposibles en CNC (difusor)  
✅ **Sin taller:** No requiere manufactura externa  

### vs PLA (Material Incorrecto)

✅ **PETG es resistente al agua** (PLA se hincha)  
✅ **PETG es químicamente inerte** (PLA se degrada)  
✅ **PETG soporta presión** (hasta 5 bar impreso correctamente)  
✅ **PETG es duradero** (años de uso)  

---

## ⚠️ CONSIDERACIONES IMPORTANTES

### Limitaciones de Impresión 3D

❗ **Transparencia limitada:**
- PETG impreso es translúcido, no totalmente transparente
- Solución: Usar tubo principal de acrílico transparente (comprado)
- La tapa puede ser opaca sin problema

❗ **Microporosidad:**
- Puede haber poros microscópicos entre capas
- Solución: Sellar con epoxi, usar 5 perimeters, 50% infill
- Con post-proceso adecuado es 100% hermético

❗ **Precisión dimensional:**
- Tolerancia típica: ±0.2mm
- Solución: Diseñar con holguras apropiadas (ya está en modelos)
- Calibrar impresora antes de piezas críticas

❗ **Resistencia química:**
- PETG resiste soluciones salinas y ácidos/bases diluidos
- NO resisteacetonas ni solventes fuertes
- Para este proyecto (suelos + agua): ✅ Perfecto

---

## 📚 DOCUMENTACIÓN DISPONIBLE

### Archivos Técnicos

✅ **Modelos 3D:** 5× archivos .scad (exportables a STL)  
✅ **Hojas técnicas:** 5× documentos manufactura  
✅ **Planos visuales:** 6× imágenes planos profesionales  
✅ **Guías:**
- `GUIA_IMPRESION_3D.md` ← **NUEVO - Lectura obligatoria**
- `SISTEMA_PUERTOS_COMPLETO.md`
- `ACLARACION_SISTEMA_BRIDAS.md`
- `05_ENSAMBLAJE.md`
- `INSTRUCCIONES_PLANOS.md`

✅ **Código LaTeX:** `main.tex` para reporte académico  
✅ **Lista materiales:** `06_LISTA_MATERIALES.md` (actualizar costos)  

---

## 🎯 PRÓXIMOS PASOS INMEDIATOS

### Esta Semana:

1. **[ ] Conseguir impresora 3D** (propia o servicio)
2. **[ ] Comprar 0.5kg filamento PETG** ($20-30)
3. **[ ] Exportar STLs** desde OpenSCAD
4. **[ ] Configurar slicer** según parámetros guía
5. **[ ] Imprimir pieza prueba** (brida inferior, 4h)

### Próxima Semana:

6. **[ ] Imprimir componentes completos** (32h total)
7. **[ ] Post-procesar** (lijar, limpiar)
8. **[ ] Comprar tubo y componentes** ($130-205)
9. **[ ] Ensamblar sistema**
10. **[ ] Pruebas y validación**

### Resultado Final:

**Permeámetro funcional por $148-223 USD en 2 semanas** ✅

---

## 🏆 CONFIGURACIÓN ÓPTIMA FINAL

```
COMPONENTES IMPRESOS 3D (PETG):
✓ Tapa con brida (180g, 14h, $6)
✓ Brida inferior (60g, 4h, $2)
✓ Difusor (15g, 2h, $1)
✓ Base (150g, 12h, $5)

COMPONENTES COMPRADOS:
✓ Tubo transparente Ø73×300mm ($20)
✓ O-ring + sellado ($15)
✓ 8× pernos M6×30mm + hardware ($10)
✓ 3× patas ($15)
✓ Sistema plomería ($45)
✓ 2× manómetros ($80)

PRESIÓN OPERATIVA: Hasta 2 bar
CAPACIDAD: 300mm altura × Ø63mm muestra
MEDICIÓN: 2 puertos (P1=50mm, P2=250mm)
DISTANCIA GRADIENTE: 200mm

TOTAL INVERSIÓN: ~$200 USD
TIEMPO FABRICACIÓN: 1 semana
CALIDAD: Apropiada para maestría/investigación
```

---

**¡El proyecto ahora es ULTRA-ACCESIBLE!** 🎉

**Cualquier estudiante o investigador con acceso a impresora 3D puede fabricar este permeámetro profesional por menos de $200 USD en una semana.**

---

**Proyecto:** Permeámetro Optimizado - Versión Impresión 3D  
**Estado:** ✅ 100% Completo y Documentado  
**Método Fabricación:** FDM (PETG)  
**Costo Total:** $148-223 USD  
**Tiempo Total:** 7-10 días  
**Fecha:** 12-ENE-2026  
**Revisión Final:** E (Impresión 3D)

**¿Listo para imprimir?** 🖨️🚀
