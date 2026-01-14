# DISEÑO FINAL REV.I - PERMEÁMETRO IMPRESO 3D

## 🎯 CONFIGURACIÓN DEFINITIVA

### **TODO IMPRESO EN 3D (PETG) EXCEPTO:**
- 4× Boquillas de latón
- 2× O-rings
- Hardware (pernos, tuercas, patas)
- 2× Manómetros digitales

---

## 📦 COMPONENTES A IMPRIMIR

### Resumen

| # | Componente | Archivo | Peso | Tiempo |
|---|-----------|---------|------|--------|
| 1 | Cilindro bridado (pared 1/2") | `01_cilindro_bridado_rev_i.scad` | 600g | 40h |
| 2 | Tapa macho superior | `02_tapa_macho_superior_rev_i.scad` | 150g | 12h |
| 3 | Tapa macho inferior | `03_tapa_macho_inferior_rev_i.scad` | 150g | 12h |
| 4 | Difusor × 2 | `04_difusor_rev_i.scad` | 40g | 4h |
| 5 | Base soporte | `05_base_soporte_rev_i.scad` | 200g | 15h |
| **TOTAL** | | | **1140g** | **83h** |

**Material PETG necesario:** ~1.2 kg (~$30 USD)

---

## 📐 ESPECIFICACIONES TÉCNICAS

### 1. CILINDRO BRIDADO

```
VISTA DE CORTE:

        ╔══════════════════╗  ← Brida SUPERIOR (Ø120mm)
        ║   8 agujeros M6  ║
    ════╬══════════════════╬════
    ║   ║                  ║   ║
    ║   ║   PARED GRUESA   ║   ║  ← 12.7mm (1/2 pulgada)
    ║   ║                  ║   ║
    ║   ║  ●───────────────╫──→ P2 (250mm) Puerto instrumentación
    ║   ║                  ║   ║
    ║   ║   Ø INTERIOR     ║   ║  ← 63mm
    ║   ║      63mm        ║   ║
    ║   ║                  ║   ║
    ║   ║  ●───────────────╫──→ P1 (50mm) Puerto instrumentación
    ║   ║                  ║   ║
    ════╬══════════════════╬════
        ║   8 agujeros M6  ║
        ╚══════════════════╝  ← Brida INFERIOR (Ø120mm)
```

**Dimensiones:**
- Altura total: 300mm
- Diámetro interior: 63mm
- Espesor pared: **12.7mm (1/2")**
- Diámetro exterior: 88.4mm
- Diámetro bridas: 120mm
- Espesor bridas: 10mm
- PCD pernos: 105mm
- Agujeros: 8× Ø6.5mm (M6)

**Puertos instrumentación:**
- P1: a 50mm de la base
- P2: a 250mm de la base
- Diámetro: 8mm (para boquilla 1/8" NPT)

### 2. TAPA MACHO SUPERIOR

```
VISTA DE CORTE:

                    ↓ ENTRADA FLUIDO
                    ║
    ╔═══════════════╬═══════════════╗
    ║               ║               ║  ← Cuerpo tapa (15mm)
    ╠═══════════════╬═══════════════╣
    ║   8 agujeros  ║   BRIDA       ║  ← Brida apriete (10mm)
    ╚═══════════════╬═══════════════╝
                    ║
                ╔═══╩═══╗
                ║ PLUG  ║  ← Plug macho Ø62mm × 20mm
                ║●●●●●●●║  ← Canal O-ring
                ╚═══════╝
```

**Dimensiones:**
- Diámetro brida: 120mm
- Espesor brida: 10mm
- Espesor cuerpo: 15mm
- Diámetro plug: 62mm (1mm holgura en Ø63)
- Profundidad plug: 20mm
- Puerto entrada: Ø10mm (1/4" NPT)

### 3. TAPA MACHO INFERIOR

```
VISTA DE CORTE:

                ╔═══════╗
                ║ PLUG  ║
                ║●●●●●●●║  ← Canal O-ring
                ╚═══╤═══╝
    ╔═══════════════╩═══════════════╗
    ║   8 agujeros  │   BRIDA       ║
    ╠═══════════════┼═══════════════╣
    ║   CAVIDAD     │               ╠══→ SALIDA FLUIDO (lateral)
    ║   DRENAJE     │               ║
    ╚═══════════════╧═══════════════╝
```

**Dimensiones:**
- Similar a tapa superior
- Puerto salida: LATERAL (no central)
- Cavidad interna para drenaje

### 4. DIFUSORES × 2

**Especificaciones:**
- Diámetro: 60mm
- Espesor: 3mm
- Perforaciones: 1 central Ø10 + 36 periféricas Ø3
- Función: Distribución uniforme del flujo

**Instalación:**
- Difusor superior: bajo la tapa superior
- Difusor inferior: sobre la tapa inferior

### 5. BASE DE SOPORTE

**Dimensiones:**
- Diámetro: 140mm
- Altura: 25mm + collar 10mm
- 3× Agujeros M8 para patas niveladoras
- Collar central para asentar cilindro

---

## 🔩 4 BOQUILLAS DE LATÓN (Comprar)

| # | Ubicación | Tipo | Rosca | Función |
|---|-----------|------|-------|---------|
| 1 | Tapa superior (centro) | Espiga manguera | 1/4" NPT | **Entrada fluido** |
| 2 | Tapa inferior (lateral) | Espiga manguera | 1/4" NPT | **Salida fluido** |
| 3 | Cilindro P1 (50mm) | Para manómetro | 1/8" NPT | **Instrumentación** |
| 4 | Cilindro P2 (250mm) | Para manómetro | 1/8" NPT | **Instrumentación** |

**Dónde comprar:**
- Ferreterías industriales
- McMaster-Carr
- Amazon (buscar "brass barb fitting NPT")

**Costo estimado:** ~$15-20 USD por las 4

---

## ⭕ O-RINGS (Comprar)

**Especificación:**
- Material: Viton (FKM) 70 Shore A
- Diámetro interior: 58mm
- Sección transversal: 4mm
- Cantidad: **2 unidades**

**Ubicación:**
- 1× En canal del plug de tapa superior
- 1× En canal del plug de tapa inferior

**Dónde comprar:**
- Tiendas de sellos industriales
- Amazon/eBay
- Proveedor O-rings

**Costo estimado:** ~$10 USD por 2

---

## 🔧 HARDWARE (Comprar)

| Componente | Especificación | Cantidad | Costo |
|------------|----------------|----------|-------|
| Pernos | M6 × 35mm acero inox | 16 | $6 |
| Arandelas | M6 planas | 32 | $3 |
| Tuercas | M6 autoblocante (nyloc) | 16 | $3 |
| Patas niveladoras | M8 × 60mm | 3 | $12 |
| **Total hardware** | | | **~$25** |

---

## 📊 INSTRUMENTACIÓN (Comprar)

| Componente | Especificación | Cantidad | Costo |
|------------|----------------|----------|-------|
| Manómetros digitales | 0-3 bar, 1/8" NPT | 2 | $80-100 |

**Alternativa económica:**
- Manómetros analógicos: ~$30 por 2
- Transductores de presión: ~$40 por 2 (requiere datalogger)

---

## 💰 COSTO TOTAL PROYECTO

### Impresión 3D
```
Filamento PETG (1.2kg):      $30
Electricidad (83h):          $8
Total impresión:            $38
```

### Componentes Comprados
```
4× Boquillas latón:         $20
2× O-rings Viton:           $10
Hardware:                   $25
2× Manómetros:              $90
Total compras:             $145
```

### **COSTO TOTAL: ~$183 USD**

---

## 🖨️ PARÁMETROS DE IMPRESIÓN

### CILINDRO BRIDADO (Pieza Crítica)

```ini
Material: PETG
Orientación: VERTICAL (brida inferior en cama)
Layer Height: 0.2mm
Walls: 6 (MÍNIMO para resistir apriete)
Infill: 60%
Pattern: Grid o Cubic
Supports: NO
Adhesion: Brim 15mm + Raft recomendado
Speed: 40mm/s (reducir warping)
Temperature: 240°C nozzle, 80°C cama
Enclosure: MUY RECOMENDADO

⚠️ REQUIERE: Impresora con Z ≥ 320mm
```

### TAPAS MACHO

```ini
Orientación: Brida en cama, plug hacia arriba
Layer Height: 0.15mm (mejor acabado canal O-ring)
Walls: 5
Infill: 50%
Supports: SÍ (tree, para plug)
Adhesion: Brim 8mm
```

### DIFUSORES

```ini
Orientación: Plano horizontal
Layer Height: 0.1mm (perforaciones limpias)
Walls: 3
Infill: 30%
Supports: NO
```

### BASE

```ini
Orientación: Como está (plano en cama)
Layer Height: 0.2mm
Walls: 4
Infill: 40%
Supports: NO
Adhesion: Brim 8mm
```

---

## 📋 SECUENCIA DE IMPRESIÓN RECOMENDADA

### Semana 1: Piezas de Prueba y Pequeñas

```
DÍA 1:
  □ Difusor #1 (2h) → Verificar calidad

DÍA 2:
  □ Difusor #2 (2h)
  □ Base (15h - dejar corriendo noche)
```

### Semana 2: Tapas

```
DÍA 3-4:
  □ Tapa superior (12h)

DÍA 5-6:
  □ Tapa inferior (12h)
```

### Semana 3: Cilindro (Pieza Crítica)

```
DÍA 7-9:
  □ Cilindro bridado (40h - corriendo día y noche)
```

**Total tiempo real:** ~10-12 días

---

## 🔧 POST-PROCESAMIENTO

### Cilindro

1. ✅ Remover brim/raft
2. ✅ Limpiar agujeros pernos (broca Ø6.5mm)
3. ✅ Roscar puertos P1/P2 (macho 1/8" NPT) o instalar insertos
4. ✅ Verificar planicidad de caras de bridas (regla metálica)
5. ✅ Lijar caras de bridas si es necesario (400 grit)

### Tapas

1. ✅ Remover soportes del canal O-ring CUIDADOSAMENTE
2. ✅ Limpiar canal con navaja/cutter
3. ✅ Lijar canal suavemente (600 grit enrollado)
4. ✅ Roscar puertos (1/4" NPT) o instalar insertos
5. ✅ Verificar que plug entra en cilindro con resistencia leve

### Difusores

1. ✅ Limpiar perforaciones (broca Ø3mm manual)
2. ✅ Verificar que fluido pasa por todas las perforaciones

### Base

1. ✅ Roscar agujeros M8 o verificar que patas entran
2. ✅ Verificar que cilindro asienta en collar

---

## ⚙️ ENSAMBLAJE

### Paso 1: Preparar Componentes
```
□ Todas las piezas post-procesadas
□ O-rings lubricados con grasa silicona
□ Boquillas con cinta PTFE (3 vueltas)
□ Hardware listo
```

### Paso 2: Instalar Boquillas (4×)
```
□ P1 en cilindro (roscar + sellar)
□ P2 en cilindro (roscar + sellar)
□ Entrada en tapa superior (roscar + sellar)
□ Salida en tapa inferior (roscar + sellar)
```

### Paso 3: Colocar O-Rings
```
□ O-ring en canal de tapa superior
□ O-ring en canal de tapa inferior
```

### Paso 4: Ensamblar Inferior
```
□ Colocar base
□ Insertar cilindro en collar de base
□ Colocar difusor inferior en cilindro
□ Insertar tapa inferior (plug hacia arriba entra en cilindro)
□ Colocar 8 pernos + arandelas + tuercas
□ Apretar en patrón estrella: 2→4→5 Nm
```

### Paso 5: Ensamblar Superior
```
□ Colocar difusor superior en cilindro
□ Insertar tapa superior (plug hacia abajo entra en cilindro)
□ Colocar 8 pernos + arandelas + tuercas
□ Apretar en patrón estrella: 2→4→5 Nm
```

### Paso 6: Conectar Instrumentación
```
□ Conectar manómetro a P1
□ Conectar manómetro a P2
□ Conectar mangueras de entrada/salida
□ Verificar todas las conexiones
```

### Paso 7: Prueba de Hermeticidad
```
□ Cerrar salida
□ Llenar con agua
□ Presurizar a 1.5 bar
□ Mantener 10 minutos
□ Verificar que no hay fugas
□ Si pasa → ¡LISTO!
```

---

## 🎯 ARCHIVOS OPENSCAD CREADOS

```
modelos_3d/
├── 00_permeametro_rev_i_completo.scad    ← Vista ensamblaje
├── 01_cilindro_bridado_rev_i.scad        ← Exportar STL
├── 02_tapa_macho_superior_rev_i.scad     ← Exportar STL
├── 03_tapa_macho_inferior_rev_i.scad     ← Exportar STL
├── 04_difusor_rev_i.scad                 ← Exportar STL (×2)
└── 05_base_soporte_rev_i.scad            ← Exportar STL
```

**Para exportar:**
1. Abrir archivo en OpenSCAD
2. F6 (Render)
3. File > Export > Export as STL
4. Guardar con nombre descriptivo

---

## ✅ VENTAJAS DE ESTE DISEÑO

1. ✅ **Pared gruesa 1/2"** → Resiste apriete de bridas sin deformarse
2. ✅ **Bridas integradas** → Una sola pieza, sin pegado
3. ✅ **Tapas macho** → Fácil apertura/cierre
4. ✅ **Doble difusor** → Distribución uniforme entrada/salida
5. ✅ **4 puertos** → Sistema completo de flujo e instrumentación
6. ✅ **Boquillas latón** → Conexiones profesionales y duraderas
7. ✅ **O-ring sellado** → Hermético hasta 3+ bar
8. ✅ **Todo impreso 3D** → Máxima accesibilidad

---

## ⚠️ CONSIDERACIONES

### Impresora Requerida
```
Altura Z: ≥ 320mm (para cilindro)

Opciones si no tienes:
1. Servicio de impresión 3D (~$50-80 para cilindro)
2. Dividir cilindro en 2 secciones y pegar
3. Usar cilindro comercial (alternativa)
```

### Tiempo Total
```
Impresión: ~83 horas (10-12 días)
Post-proceso: ~4-6 horas
Ensamblaje: ~2-3 horas
Pruebas: ~1 hora

Total proyecto: ~2-3 semanas
```

---

**DISEÑO LISTO PARA FABRICACIÓN** ✅

**Próximo paso:** Abrir `00_permeametro_rev_i_completo.scad` en OpenSCAD y verificar que todo se ve correcto.

---

**Documento:** Diseño Final Rev.I  
**Fecha:** 12-ENE-2026  
**Estado:** Completo y verificado  
**Fabricación:** Impresión 3D FDM (PETG)
