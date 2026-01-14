# Sistema de Conexiones - Puertos y Plomería

## Descripción
Diseño mejorado del sistema de conexiones para entrada y salida de fluidos, minimizando fugas y facilitando la operación.

---

## Análisis del Sistema Actual

### Componentes Observados (según imágenes)

| Componente | Especificación | Problema Potencial |
|------------|----------------|-------------------|
| Válvulas laterales | Tipo bola, latón | Posible fuga en roscas |
| Conexiones | Barbed 1/4" o 3/8" | No estandarizadas |
| Tubería | Manguera vinílica transparente | Puede colapsar bajo vacío |
| Manómetros | Digitales (2 unidades) | Buena elección |

### Puntos de Fuga Identificados

1. **Rosca en plástico** (cuerpo de columna)
2. **Conexión barbed-manguera** (puede aflojarse)
3. **Válvulas** (si no tienen empaque adecuado)
4. **Uniones T o Y** (si existen)

---

## Configuración Mejorada del Sistema

### Esquema General de Flujo

```
   ┌────────────────────┐
   │   RESERVORIO       │
   │   ALIMENTACIÓN     │
   └─────────┬──────────┘
             │
        ┌────▼────┐
        │  BOMBA  │
        │PERÍSTÁL-│
        │  TICA   │
        └────┬────┘
             │
        ┌────▼────────────────────┐
        │  VÁLVULA REGULADORA     │
        │  (Control de flujo)     │
        └────┬────────────────────┘
             │
        ┌────▼────────────────────┐
        │  MANÓMETRO ENTRADA      │ ← P1
        └────┬────────────────────┘
             │
        ┌────▼────────────────────┐
        │                         │
        │    TAPA SUPERIOR        │  ← Puerto entrada mejorado
        │   (Puerto entrada)      │
        ├─────────────────────────┤
        │                         │
        │    COLUMNA DE SUELO     │
        │      (300 mm)           │
        │                         │
        ├─────────────────────────┤
        │   PUERTO LATERAL        │  ← Muestreo intermedio (opcional)
        ├─────────────────────────┤
        │                         │
        │    BASE/SALIDA          │  ← Puerto salida mejorado
        │                         │
        └────┬────────────────────┘
             │
        ┌────▼────────────────────┐
        │  MANÓMETRO SALIDA       │ ← P2
        └────┬────────────────────┘
             │
        ┌────▼────────────────────┐
        │  VÁLVULA COLECTORA      │
        └────┬────────────────────┘
             │
        ┌────▼────────────────────┐
        │  RECIPIENTE COLECTOR    │
        └─────────────────────────┘
```

---

## Mejoras por Componente

### 1. Puerto de Entrada Superior (en Tapa)

#### Diseño Actual vs. Mejorado

**Problema actual:**
- Conexión simple barbed directa
- Sin distribución uniforme del flujo
- Puede causar canalización en el suelo

**Solución propuesta:**

```
Vista en corte del puerto de entrada mejorado:

         ┌─── Conector roscado 1/4" NPT
         │
         ▼
    ┌────┴────┐
    │ ▓▓▓▓▓▓▓ │  ← Inserto roscado latón
    └────┬────┘
         │
    ─────┴──────────  ← Cara inferior de tapa
         │
         ╧  ← O-ring sellado
    ╔════╪════╗
    ║ DIFUSOR ║  ← Placa perforada
    ║ ●●●●●●● ║     para distribución
    ╚═════════╝
         │
      ┌──┴──┐
      │SUELO│
      └─────┘
```

#### Especificación del Puerto

**Componentes:**

1. **Inserto roscado de latón:**
   - Rosca externa: M12 × 1.5 (para instalación en acrílico)
   - Rosca interna: 1/4" NPT hembra
   - Longitud total: 15mm
   - Con brida de sellado (O-ring)

2. **Difusor de flujo:**
   - Material: Acero inoxidable 316 o plástico HDPE
   - Diámetro: 50mm
   - Espesor: 2mm
   - Perforaciones: 25 orificios de Ø2mm
   - Patrón: Distribución uniforme concéntrica

3. **Conexión externa:**
   - Conector rápido tipo John Guest (push-fit)
   - O conector Luer-Lock para precisión
   - Alternativamente: racor de compresión 1/4"

#### Instalación del Puerto

```
1. Perforar orificio piloto Ø10mm en tapa
2. Calentar inserto con pistola de calor (180°C)
3. Presionar inserto hasta que brida asiente
4. Dejar enfriar completamente
5. Colocar O-ring en la ranura de brida
6. Ensamblar difusor con tornillos M3 (4 pcs)
```

### 2. Puerto de Salida Inferior

#### Configuración Optimizada

```
Vista lateral del puerto de salida:

    ┌─────────────────┐
    │                 │
    │     SUELO       │
    │                 │
    └────────┬────────┘
        ╔════╪════╗
        ║  REJILLA ║  ← Evita salida de partículas
        ║  ▓▓▓▓▓▓ ║
        ╚═════════╝
             │
        ┌────┴────┐
        │ Espacio │  ← Cámara de sedimentación
        │  muerto │     (10mm altura)
        └────┬────┘
             │
        ┌────▼────┐
        │ ○→→→→   │  ← Puerto lateral con ángulo
        └─────────┘
             │
          Salida
```

#### Componentes de la Salida

**1. Rejilla filtrante:**
- Material: Nylon o acero inoxidable
- Malla: 100-200 mesh (retiene partículas >75 μm)
- Diámetro: 60mm
- Diseño circular plano

**2. Cámara de sedimentación:**
- Altura: 10mm
- Función: Permite asentamiento de finos
- Facilita cambio de rejilla

**3. Puerto de conexión:**
- Ubicación: Lateral a 5mm de la base
- Ángulo: 15° hacia abajo (facilita drenaje)
- Tipo: Inserto roscado 1/4" NPT

### 3. Puertos de Muestreo Intermedio (Opcional)

Para estudios de transporte de solutos:

```
Ubicación de puertos de muestreo:

    ┌─────────────────┐ ← Tapa (entrada)
    │                 │
    ├─ ○  Port 1      │ ← 250mm (superior)
    │                 │
    │                 │
    ├─ ○  Port 2      │ ← 150mm (medio)
    │                 │
    │                 │
    ├─ ○  Port 3      │ ← 50mm (inferior)
    │                 │
    └─────────────────┘ ← Base (salida)
```

**Especificaciones:**
- 3 puertos de muestreo equidistantes
- Conectores tipo septa (auto-sellantes)
- Permite extracción con jeringa
- Diámetro: 6mm con tapón de silicona

### 4. Sistema de Válvulas

#### Válvulas Recomendadas

**Para Control de Flujo:**

| Tipo | Aplicación | Ventajas | Desventajas |
|------|------------|----------|-------------|
| **Válvula de aguja** | Regulación fina | Control preciso | Costosa |
| **Válvula de bola** | On/Off rápido | Bajo Cv, confiable | Pobre para regulación |
| **Válvula de pinza** | Mangueras | Simple, económica | Desgaste del tubo |
| **Válvula tipo diafragma** | Fluidos sucios | No obstruye | Costosa |

**Selección recomendada:**

```
Ubicación            Tipo de válvula
─────────────────────────────────────────
Entrada principal    → Válvula de aguja (control fino)
Salida principal     → Válvula de bola (apertura total)
Bypass              → Válvula de bola pequeña
Drenaje             → Válvula de bola
Muestreo            → Válvulas septa auto-sellantes
```

#### Especificaciones de Válvulas

**Válvula de Aguja (Entrada):**
- Cuerpo: Latón cromado o acero inoxidable
- Conexión: 1/4" NPT hembra en ambos lados
- Cv: 0.15 - 0.3
- Presión máxima: 10 bar
- Manija: Tipo volante para ajuste fino

**Válvula de Bola (Salida):**
- Cuerpo: Latón niquelado
- Conexión: 1/4" NPT hembra
- Bore completo (full port)
- Manija: Palanca tipo mariposa
- Sello: Teflón o Viton

### 5. Tubería y Mangueras

#### Problemas con Manguera Vinílica

❌ **Desventajas:**
- Se colapsa bajo vacío
- Permeable a gases
- Se endurece con el tiempo
- Baja resistencia química

#### Alternativas Mejoradas

**Opción 1 - Tubo de Silicona:**
- ✅ Flexible y transparente
- ✅ Resistente a temperatura
- ✅ Biocompatible
- ⚠️ Costo medio-alto
- **Especificación:** ID 6mm × OD 9mm

**Opción 2 - Tubo de Tygon:**
- ✅ Excelente resistencia química
- ✅ Muy transparente
- ✅ No se colapsa
- ⚠️ Costoso
- **Especificación:** Tygon E-3603 / R-3603

**Opción 3 - Tubo de PTFE (Teflón):**
- ✅ Inerte químicamente
- ✅ Alta resistencia
- ⚠️ Rígido (dificulta conexiones)
- ⚠️ Opaco
- **Especificación:** ID 4mm × OD 6mm

**Opción 4 - Tubo PVC reforzado:**
- ✅ Económico
- ✅ No colapsa (refuerzo espiral)
- ⚠️ Menos flexible
- **Especificación:** ID 6mm con malla

**Recomendación general:**
```
Sección                Tipo de tubo
────────────────────────────────────────
Alimentación          → PVC reforzado o Tygon
Entrada al permeámetro → Silicona (flexibilidad)
Salida de muestra     → Tygon (transparente)
Conexiones presión    → Tubo PVC rígido
```

### 6. Conectores y Accesorios

#### Sistema de Conexión John Guest (Push-Fit)

**Ventajas:**
- ✅ Instalación sin herramientas
- ✅ Conexión/desconexión rápida
- ✅ Sellado confiable
- ✅ Reutilizable

```
Ejemplo de conexión:

    [Tubo] →→ ┌──○──┐ →→ [Puerto]
              │ JG  │
              └─────┘
         Conector push-fit
         (presionar para conectar,
          empujar collar para liberar)
```

**Especificación:**
- Serie: John Guest PI o PP
- Tamaño: 1/4" o 6mm
- Material: Acetal (Delrin) o polipropileno
- Presión de trabajo: 10-17 bar

#### Conectores Roscados Tradicionales

**Racores de Compresión:**

```
Vista en corte:

    ──┬─────────────────
      │   Tuerca
    ──┴─────────
       Férula ◊ → Comprime el tubo
    ────┬───────
        │ Cuerpo del racor
    ────┴───────
```

**Componentes:**
- Cuerpo: Latón niquelado
- Férula: Latón o plástico
- Tuerca: Latón hexagonal
- Rosca: 1/4" NPT o M10×1

**Instalación:**
1. Cortar tubo en ángulo recto
2. Insertar tuerca y férula
3. Introducir tubo completamente en el cuerpo
4. Apretar tuerca a mano
5. Dar 1.5 vueltas adicionales con llave
6. No sobre-apretar (puede cortar tubo)

### 7. Instrumentación de Presión

#### Manómetros Digitales (ya instalados)

**Especificaciones típicas:**
- Rango: 0-10 bar (0-150 psi)
- Precisión: ±0.5% FS
- Display: LCD
- Batería: 9V o AAA
- Conexión: 1/4" NPT inferior

**Ubicación óptima:**
- **P1 (superior):** Inmediatamente antes de entrada a columna
- **P2 (inferior):** Inmediatamente después de salida de columna
- **ΔP:** Diferencial P1 - P2 = pérdida de carga

#### Transductores de Presión (Mejora Futura)

Para monitoreo continuo y registro de datos:

```
Transductor → Datalogger → PC
     │
   Señal 4-20mA
   o 0-5V
```

**Ventajas:**
- Registro automático
- Gráficas en tiempo real
- Cálculo automático de permeabilidad

**Especificación sugerida:**
- Tipo: Piezo-resistivo
- Rango: 0-10 bar
- Salida: 4-20 mA
- Alimentación: 24V DC
- Precisión: ±0.25% FS

### 8. Sistema de Bypass

#### Función del Bypass

Permite:
- Purgar aire del sistema
- Calibrar el flujo sin pasar por columna
- Limpieza del sistema de tubería

```
Esquema de bypass:

              ┌─────────────┐
    Bomba →→→ │   Válvula   │ →→→ Entrada columna
              │   3 vías    │
              └──────┬──────┘
                     │
                 ┌───▼────┐
                 │ BYPASS │
                 │        │
                 └───┬────┘
                     │
                  Descarte
```

**Válvula de 3 vías:**
- Tipo: Bola de 3 vías en T o L
- Cuerpo: Latón o acero inoxidable
- Conexiones: 1/4" NPT
- Posiciones:
  - Posición 1: Flujo a columna
  - Posición 2: Flujo a bypass
  - Posición 3: Cerrado (en algunos modelos)

### 9. Sistema de Aireación/Venteo

#### Problema de Aire Atrapado

El aire atrapado causa:
- Lecturas erróneas de presión
- Flujo intermitente
- Canalización en el suelo

#### Solución: Válvulas de Venteo

**Ubicación de venteos:**

```
    ┌─────────────────┐
    │      TAPA       │
    │       ▲ ← Venteo superior (automático)
    ├───────┼─────────┤
    │       │         │
    │   PERMEÁMETRO   │
    │                 │
    │                 │
    └─────────────────┘
```

**Tipos de válvulas de venteo:**

**1. Válvula de aguja manual:**
- Abrir al inicio del experimento
- Cerrar cuando sale líquido sin burbujas
- Control total del operador

**2. Válvula automática (float valve):**
- Libera aire automáticamente
- Se cierra cuando llega líquido
- Requiere orientación vertical

**3. Membrana hidrofóbica:**
- Permite paso de aire, no de líquido
- Sin partes móviles
- Requiere reemplazo periódico

**Recomendación:**
- Válvula de aguja en tapa superior
- Apertura de 1/8" NPT
- Tubo de descarga a recipiente (evita derrames)

---

## Configuración Completa Optimizada

### Lista de Conexiones y Tuberías

```
COMPONENTE                     TIPO                    CANTIDAD
─────────────────────────────────────────────────────────────────
Puerto entrada (tapa)         1/4" NPT + difusor      1
Puerto salida (base)          1/4" NPT + rejilla      1
Puertos muestreo (lateral)    6mm septa               3 (opcional)
Válvula aguja entrada         1/4" NPT latón          1
Válvula bola salida           1/4" NPT latón          1
Válvula venteo                1/8" NPT aguja          1
Válvula bypass (3 vías)       1/4" NPT                1 (opcional)
Manómetro digital P1          0-10 bar, 1/4" NPT      1
Manómetro digital P2          0-10 bar, 1/4" NPT      1
Tubo silicona entrada         ID 6mm × OD 9mm         2 metros
Tubo Tygon salida             ID 6mm × OD 9mm         1 metro
Conectores push-fit 6mm       John Guest              6-8
Conectores NPT 1/4" macho     Latón                   4
Conector T 1/4"               Para bypass             1
Abrazaderas tubo 6mm          Acero inox o nylon      10
Cinta PTFE (teflón)           Para roscas             1 rollo
```

---

## Procedimiento de Ensamblaje del Sistema

### Paso 1: Preparación de Roscas

```
1. Limpiar todas las roscas con cepillo
2. Aplicar 3-4 vueltas de cinta PTFE en sentido horario
3. Para roscas en plástico: NO sobre-apretar
4. Torque máximo en plástico: 1-2 Nm (ajuste manual)
```

### Paso 2: Instalación de Puertos en Columna

```
1. Instalar insertos roscados en tapa y cuerpo
2. Colocar O-rings de sellado
3. Ensamblar difusor en puerto superior
4. Ensamblar rejilla en puerto inferior
5. Verificar alineación de puertos laterales
```

### Paso 3: Instalación de Válvulas

```
1. Válvula de aguja → cerca de entrada columna
2. Válvula de bola → en salida columna
3. Válvula de venteo → en tapa superior
4. Válvula de bypass → antes de entrada (opcional)
5. Verificar que todas abren/cierran correctamente
```

### Paso 4: Conexión de Tubería

```
1. Medir longitud necesaria de tubo (dejar holgura 10%)
2. Cortar tubos en ángulo recto con cuchilla afilada
3. Insertar en conectores push-fit hasta el tope
4. Tirar para verificar sujeción
5. Para racores de compresión: ver instrucciones anteriores
```

### Paso 5: Instalación de Manómetros

```
1. Aplicar cinta PTFE en roscas de manómetros
2. Atornillar en derivaciones T cerca de puertos
3. Orientar displays hacia el operador
4. Verificar lectura de 0 bar sin presión
5. Instalar baterías si es digital
```

### Paso 6: Prueba de Fugas

```
1. Cerrar válvula de salida
2. Abrir válvula de venteo
3. Llenar sistema con agua lentamente
4. Cuando salga agua por venteo, cerrar venteo
5. Aumentar presión a 0.5 bar con bomba
6. Inspeccionar todas las conexiones
7. Buscar gotas o humedad
8. Apretar conexiones con fugas (no excederse)
9. Aumentar presión a 1.5 bar
10. Dejar 10 minutos y re-inspeccionar
```

---

## Mantenimiento del Sistema de Conexiones

### Cada Semana (Uso Frecuente)

- [ ] Inspeccionar visualmente todas las conexiones
- [ ] Verificar ausencia de fugas
- [ ] Limpiar manómetros (pantalla)
- [ ] Comprobar operación de válvulas

### Cada Mes

- [ ] Des-armar y limpiar válvulas
- [ ] Verificar estado de O-rings en conexiones
- [ ] Lubricar válvulas de aguja (grasa de silicona)
- [ ] Calibrar manómetros (comparar con patrón)

### Cada 6 Meses

- [ ] Reemplazar O-rings de todas las conexiones
- [ ] Reemplazar cinta PTFE en roscas
- [ ] Limpiar y desincrustrar válvulas
- [ ] Verificar difusor y rejilla (sin obstrucción)

---

## Solución de Problemas Comunes

| Problema | Causa Probable | Solución |
|----------|----------------|----------|
| Fuga en rosca | Cinta PTFE insuficiente | Re-aplicar cinta, reapretar |
| Fuga en push-fit | Tubo mal insertado | Retirar y reinsertar completamente |
| Válvula gotea | O-ring dañado | Reemplazar O-ring de vástago |
| Manómetro no lee | Batería agotada | Reemplazar batería |
| Presión errática | Aire en sistema | Purgar completamente |
| Difusor obstruido | Partículas de suelo | Limpiar o reemplazar rejilla |

---

**Siguiente:** Ver `05_ENSAMBLAJE.md` para instrucciones completas de ensamblaje del permeámetro.
