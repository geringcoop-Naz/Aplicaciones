# MEJORA DE DISEÑO: SISTEMA DE TAPA MACHO

## 🎯 INNOVACIÓN PROPUESTA

**Cambio fundamental:** Evolución de tapa tipo "hembra" a **tapa tipo "macho" (plug)**

---

## 📊 COMPARACIÓN DE DISEÑOS

### Diseño Anterior (Rev. F)

```
Vista de corte:

    ╔══════════════╗  ← Tapa con brida integrada
    ║   TAPA       ║    (se coloca ENCIMA)
    ╠══════════════╣  ← Brida de tapa
    ║   O-RING     ║
    ╠══════════════╣  ← Brida inferior (pegada)
    ║              ║
    ║   CILINDRO   ║  ← Tubo simple
    ║   (tubo)     ║
    ║              ║
    ╚══════════════╝
    
Problemas:
- Dos bridas separadas
- Brida inferior debe pegarse perfectamente
- Alineación crítica
- Menos robusto
```

### Diseño Nuevo (Rev. G) - TAPA MACHO

```
Vista de corte:

    ┌──────────────┐  ← Cabeza de tapa
    │    TAPA      │
    ╞══════════════╡  ← Brida de tapa
    │  ║        ║  │  
    │  ║ PLUG   ║  │  ← Porción macho (se inserta)
    │  ║ MACHO  ║  │     con O-ring exterior
╔═══╪══╝●●●●●●╚══╪═══╗  ← Cilindro con brida integrada
║   │              │   ║     (UNA SOLA PIEZA)
║   │   CILINDRO   │   ║
║   │              │   ║
║   └──────────────┘   ║
╚══════════════════════╝

Ventajas:
✅ Cilindro + brida = 1 pieza (más fuerte)
✅ Tapa se inserta (fácil abrir/cerrar)
✅ Doble sellado (O-ring + sello mecánico)
✅ No requiere pegado de brida
✅ Diseño profesional tipo reactor
```

---

## 🔧 COMPONENTES DEL NUEVO DISEÑO

### 1. Cuerpo/Cilindro con Brida Integrada (1 PIEZA)

**Características:**
- Cilindro Ø73mm exterior × Ø63mm interior
- Altura: 300mm (cilindro) + 8mm (brida)
- **Brida integrada en borde superior**
  - No se pega, es parte de la misma impresión
  - Ø110mm exterior
  - 8mm de espesor
  - 8 agujeros M6.5mm en PCD 95mm

**Material:** PETG (impresión 3D)

**Ventajas:**
- Estructuralmente más robusto (sin juntas pegadas)
- Tolerancias consistentes (todo en una impresión)
- Brida perfectamente alineada con cilindro
- Elimina paso de pegado

**Peso estimado:** 350g  
**Tiempo impresión:** 24-28 horas  

### 2. Tapa Tipo Macho (Plug Cap)

**Diseño en dos secciones:**

#### Sección Superior (Disco/Cabeza):
- Ø100mm × 15mm espesor
- Área de trabajo (puerto entrada, montaje difusor)
- **Brida inferior integrada:**
  - Ø110mm
  - 8mm espesor
  - 8 agujeros M6.5mm (alineados con cilindro)

#### Sección Inferior (Plug/Macho):
- **Porción cilíndrica que se inserta EN el cuerpo**
- Ø62mm exterior (holgura 1mm con interior Ø63mm)
- Altura del plug: 15-20mm (suficiente para sellado)
- **Canal O-ring en el exterior del plug:**
  - Ancho: 3.5mm
  - Profundidad: 1.5mm
  - Radio esquinas: R0.5mm
  - Para O-ring Ø60mm × 3mm sección

**Material:** PETG (impresión 3D)

**Peso estimado:** 120g  
**Tiempo impresión:** 10-12 horas

### 3. Sistema de Doble Sellado

#### Sellado Primario: O-ring en Plug

**Ubicación:** Canal en la porción cilíndrica del plug  
**Tipo:** O-ring de compresión radial  
**Especificaciones:**
- Material: Viton FKM 70
- Tamaño: Ø60mm ID × 3mm sección transversal
- Compresión: 20-25% (0.6-0.75mm)
- Montaje: Se coloca en canal del plug antes de insertar

**Función:**
- Sellado principal contra pared interior del cilindro
- Compresión radial al insertar tapa
- Previene paso de líquido hacia arriba

#### Sellado Secundario: Junta Plana (Sello Mecánico)

**Ubicación:** Entre cara inferior de brida de tapa y cara superior de brida de cilindro  
**Tipo:** Empaque plano comprimido por pernos  
**Especificaciones:**
- Material: PTFE, caucho de nitrilo, o papel fibra
- Espesor: 2mm
- Diámetro: OD 105mm, ID 65mm

**Función:**
- Sellado de respaldo
- Distribución de carga de pernos
- Previene micro-fugas entre bridas

---

## 📐 DIMENSIONES CRÍTICAS

### Interface Plug-Cilindro

```
Corte transversal del sellado:

    INTERIOR CILINDRO               PLUG MACHO
         Ø63mm                        Ø62mm
    
    ║────────║                    ║────────║
    ║        ║  ← 0.5mm gap →    ║   ╔═══╗║
    ║        ║                    ║   ║ O ║║  ← O-ring
    ║        ║                    ║   ║   ║║     Ø60×3mm
    ║        ║  ← comprime →     ║   ╚═══╝║
    ║────────║                    ║────────║
    
    Holgura diametral: 1mm (0.5mm radial cada lado)
    O-ring sin comprimir: 3mm
    Canal O-ring: 3.5mm ancho × 1.5mm profundo
    Compresión final: ~25% (0.75mm)
```

### Dimensiones de Inserción

- **Profundidad de inserción:** 15-20mm
- **Diámetro plug:** Ø62.0mm ±0.2mm
- **Diámetro interior cilindro:** Ø63.0mm ±0.3mm
- **Holgura de montaje:** 0.6-1.4mm (aceptable para O-ring)

### PCD de Pernos (CRÍTICO - Debe coincidir)

- **Tapa:** PCD 95.0mm ±0.2mm
- **Cilindro:** PCD 95.0mm ±0.2mm
- **Desalineación máxima permitida:** 0.3mm

---

## 🔩 SISTEMA DE SUJECIÓN

### Pernos y Hardware

| Componente | Especificación | Cantidad | Función |
|------------|----------------|----------|---------|
| Pernos | M6 × 30mm acero inox | 8 | Atraviesan ambas bridas |
| Arandelas | M6 plana acero inox | 16 | Arriba y abajo |
| Tuercas | M6 autoblocante (nyloc) | 8 | Ajuste final |

**Longitud de perno:**
- Brida tapa: 8mm
- Empaque PTFE: 2mm
- Brida cilindro: 8mm
- Espacio para rosca: 5mm
- **Total mínimo:** 23mm → Usar M6×30mm (margen 7mm)

### Secuencia de Apriete

```
Patrón estrella (mismo que antes):

         1
    8         2
  7     ●     3
    6         4
         5

Orden: 1 → 5 → 3 → 7 → 2 → 6 → 4 → 8
```

**Tres pasadas:**
1. **2 Nm:** Asentar componentes
2. **4 Nm:** Comprimir empaques
3. **5 Nm:** Torque final

---

## 🖨️ IMPRESIÓN 3D - ACTUALIZACIONES

### Cuerpo con Brida Integrada

**Desafío:** Pieza grande (308mm altura total)  
**Solución:** Impresora con volumen Z >310mm O imprimir en 2 secciones

#### Opción A: Impresión Monolítica (Recomendada)

**Orientación:** Vertical (brida arriba)

```
        BRIDA ═══════  ← Arriba (última en imprimirse)
            ║
            ║
        CILINDRO       ← Vertical
            ║
            ║
        ══════════     ← Cama de impresión
```

**Ventajas:**
- Una sola pieza, sin juntas
- Máxima resistencia
- Brida está en la parte superior (última capa = mejor acabado)

**Parámetros:**
- Material: PETG
- Layer height: 0.2mm
- Walls: 5 (mínimo)
- Infill: 40-50%
- Supports: Mínimos (solo brida si overhang >50°)
- Adhesión: Brim 10mm + raft (CRÍTICO para pieza alta)
- Tiempo: 24-28 horas
- Material: ~350g

**Requiere:**
- Impresora con altura Z ≥ 320mm
- Enclosure (cámara cerrada) ALTAMENTE recomendado
- Control de temperatura ambiente

#### Opción B: Impresión en 2 Secciones

Si impresora tiene Z limitada (<320mm):

**Sección 1:** Cilindro inferior (200mm)  
**Sección 2:** Cilindro superior + brida (108mm)  
**Unión:** Pegado con solvente acrílico o epoxi estructural

**Desventaja:** Re-introduce junta (pero mejor que brida separada)

### Tapa Macho

**Orientación:** Boca abajo (plug hacia arriba)

```
    ╔═════════╗
    ║  PLUG   ║  ← Arriba (cilindro macho)
    ║         ║
    ╚═════════╝
    ═══════════  ← Cabeza en cama de impresión
```

**Ventajas:**
- Cara superior (de trabajo) queda lisa (toca cama)
- Canal O-ring se imprime hacia arriba (fácil limpiar soportes)

**Parámetros:**
- Layer height: 0.15mm (para mejor acabado canal O-ring)
- Walls: 5
- Infill: 50%
- Supports: SÍ (para plug cilíndrico)
- Adhesión: Brim 8mm
- Tiempo: 10-12 horas
- Material: ~120g

---

## ⚙️ ENSAMBLAJE - PROCEDIMIENTO ACTUALIZADO

### Paso 1: Preparación del Sellado

1. **Limpiar superficies:**
   - Interior del cilindro (zona de contacto con plug)
   - Exterior del plug
   - Caras de ambas bridas

2. **Verificar canal O-ring:**
   - Sin residuos de soporte
   - Lijar suavemente si es necesario

3. **Lubricar O-ring:**
   - Usar grasa de silicona (compatible con PETG)
   - Instalar O-ring en canal del plug
   - Verificar asentamiento uniforme

### Paso 2: Instalación del Empaque Plano

1. Colocar empaque PTFE sobre brida del cilindro
2. Alinear con agujeros
3. Verificar que quede centrado

### Paso 3: Inserción de la Tapa

1. **Posicionar tapa sobre cilindro**
2. **Alinear agujeros de pernos** (usar luz de fondo)
3. **Presionar tapa hacia abajo suavemente**
   - El plug macho se inserta en cilindro
   - O-ring comprime contra pared interna
   - Bridas quedan en contacto

4. **Verificar inserción completa:**
   - Bridas deben hacer contacto firme
   - Gap uniforme alrededor (si hay)

### Paso 4: Instalación de Pernos

1. Colocar arandela arriba en cada posición
2. Insertar 8 pernos desde arriba
3. Colocar arandela abajo en cada posición
4. Enroscar tuercas a mano

### Paso 5: Apriete Final

**Usar llave dinamométrica:**
- Primera pasada: 2 Nm (patrón estrella)
- Segunda pasada: 4 Nm (patrón estrella)
- Tercera pasada: **5 Nm** (patrón estrella)

**Verificar:**
- Tapa asentó uniformemente
- No hay gaps visibles
- Sistema rígido

---

## ✅ VENTAJAS DEL NUEVO DISEÑO

### Estructurales

✅ **Una pieza menos:** Elimina brida inferior separada  
✅ **Más robusto:** Cilindro-brida integrados sin juntas  
✅ **Mejor alineación:** Todo impreso en una sesión  
✅ **No requiere pegado:** Menos pasos, menos puntos de falla  

### Funcionales

✅ **Fácil apertura:** Quitar 8 pernos y levantar tapa  
✅ **Cambio rápido de muestra:** No necesita desmontar todo  
✅ **Doble sellado:** O-ring radial + empaque plano  
✅ **Más profesional:** Diseño tipo reactor industrial  

### Fabricación

✅ **Menos componentes:** 3 piezas impresas vs 4  
✅ **Menos post-proceso:** No pegar brida  
✅ **Más predecible:** Tolerancias en una impresión  

---

## ⚠️ CONSIDERACIONES Y DESAFÍOS

### Desafío 1: Altura de Impresión

**Problema:** Cilindro 308mm requiere impresora con Z ≥320mm  

**Soluciones:**
- Opción A: Usar impresora grande (Ender 5 Plus, CR-10, Prusa XL, etc.)
- Opción B: Dividir en 2 secciones y pegar
- Opción C: Usar servicio de impresión 3D profesional

### Desafío 2: Warping en Pieza Alta

**Problema:** Piezas altas tienden a despegarse de cama  

**Soluciones:**
- Usar brim amplio (10-15mm)
- Usar raft
- Aplicar adhesivo en cama (glue stick, laca)
- Enclosure cerrado (temperatura estable)
- Reducir velocidad de impresión a 35-40mm/s

### Desafío 3: Tolerancias del Plug

**Problema:** Plug puede quedar muy ajustado o muy flojo  

**Soluciones:**
- Calibrar impresora (horizontal expansion compensation)
- Imprimir pieza de prueba primero
- Ajustar diámetros en archivo .scad:
  - Si muy ajustado: Reducir Ø plug a 61.8mm
  - Si muy flojo: Aumentar Ø plug a 62.2mm
- Lijar suavemente plug si es necesario

---

## 💰 ACTUALIZACIÓN DE COSTOS

### Componentes Impresos 3D

| Componente | Peso | Tiempo | Costo Material |
|------------|------|--------|----------------|
| **Cuerpo con brida (1 pieza)** | 350g | 26h | $9 |
| **Tapa macho** | 120g | 11h | $3 |
| **Difusor** | 15g | 2h | $1 |
| **Base** | 150g | 12h | $5 |
| **TOTAL** | **635g** | **51h** | **$18** |

**Cambio vs diseño anterior:**
- Material: +230g (+$4)
- Tiempo: +19 horas
- **Pero:** Una pieza menos, más robusto, no requiere pegado

### Costo Total del Proyecto

| Categoría | Costo |
|-----------|-------|
| Impresión 3D | $18 |
| Sistema sellado (2× O-rings + PTFE) | $20 |
| Hardware (pernos, patas) | $20 |
| Plomería | $45 |
| Instrumentación | $80 |
| **TOTAL** | **$183** |

**Incremento:** ~$20 USD vs diseño anterior  
**Justificación:** Mayor robustez y profesionalismo

---

## 🎓 RECOMENDACIÓN FINAL

**Este diseño de tapa macho es SUPERIOR al anterior por:**

1. ✅ **Más fuerte** (cilindro-brida integrados)
2. ✅ **Más fácil de usar** (abrir/cerrar)
3. ✅ **Mejor sellado** (doble sistema)
4. ✅ **Más profesional** (estándar industrial)
5. ✅ **Fabricación simplificada** (menos piezas, no pegado)

**Único requisito adicional:**
- Impresora con altura Z ≥320mm (o servicio de impresión)

**Si tienes acceso a impresora grande o servicio 3D: ABSOLUTAMENTE RECOMENDADO** 👍

---

**Documento:** Mejora de Diseño - Sistema Tapa Macho  
**Código:** DESIGN-IMPROVEMENT-001  
**Revisión:** G  
**Fecha:** 12-ENE-2026  
**Estado:** Propuesto para implementación

¿Procedemos con esta mejora? Puedo actualizar los modelos .scad y toda la documentación.
