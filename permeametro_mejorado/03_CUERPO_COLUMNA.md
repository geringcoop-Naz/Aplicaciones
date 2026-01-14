# Cuerpo de la Columna - Modificaciones y Mejoras

## Descripción
Modificaciones al cuerpo cilíndrico principal del permeámetro para mejorar el sellado y facilitar el mantenimiento.

---

## Especificaciones del Diseño Actual

Basado en las imágenes proporcionadas:

| Parámetro | Valor Estimado |
|-----------|----------------|
| Diámetro interno | 63 mm (2.5") |
| Espesor de pared | ~5 mm |
| Altura total | ~300 mm |
| Material | PVC o Acrílico transparente |
| Conexiones laterales | 2 puertos (entrada/salida) |
| Sistema de sujeción | O-rings externos simples |

---

## Problemas Identificados

1. **Borde superior sin mecanizado:**
   - Superficie irregular para sellado
   - Sin canal para O-ring
   - Falta de estructura para brida

2. **Conexiones laterales:**
   - Posible punto de fuga secundario
   - Falta de refuerzo estructural

3. **Ausencia de marcas de referencia:**
   - Difícil alineación con la tapa
   - Sin indicadores de nivel

---

## Mejoras Propuestas

### 1. Modificación del Borde Superior

#### Diseño del Reborde para Sellado

```
Vista lateral del borde superior modificado:

                TAPA CON BRIDA
      ┌────────────────────────────┐
      │         Pernos M6           │
      └────────────┬───────────────┘
                   │
    ═══════════════╪═══════════════  ← O-ring comprimido
                   │
      ┌────────────┴───────────────┐
      │    Reborde mecanizado      │  ← NUEVO
      │    (5mm altura)            │
      ├────────────────────────────┤
      │                            │
      │    CUERPO PRINCIPAL        │
      │    Ø 63mm interno          │
      │    Ø 73mm externo          │
      │                            │
```

**Especificaciones del Reborde:**

| Parámetro | Dimensión | Tolerancia |
|-----------|-----------|------------|
| Altura del reborde | 5 mm | ±0.1 mm |
| Diámetro exterior | 73 mm | ±0.1 mm |
| Superficie superior | Plana | Ra ≤ 1.6 μm |
| Perpendicularidad | - | ≤ 0.05 mm |
| Paralelismo | - | ≤ 0.05 mm |

#### Mecanizado del Borde

**Proceso recomendado:**

1. **Corte inicial:**
   - Cortar el tubo a longitud exacta
   - Usar sierra de disco con guía
   - Dejar 2mm adicional para mecanizado

2. **Refrentado:**
   - Tornear la cara superior en torno
   - Velocidad: 800-1000 RPM
   - Avance: 0.1 mm/rev
   - Lubricación con refrigerante

3. **Inspección:**
   - Verificar planicidad con regla de precisión
   - Medir perpendicularidad
   - Acabado visual sin marcas

**Si no hay acceso a torno:**
```
Alternativa manual:
1. Lijar con papel de agua sobre superficie plana de vidrio
2. Progresión: P320 → P600 → P1000 → P2000
3. Movimiento circular uniforme
4. Verificar planicidad frecuentemente
5. Tiempo estimado: 2-3 horas
```

### 2. Brida de Sujeción en el Cuerpo

#### Opción A: Brida Integral (Mecanizada)

```
Vista superior del cuerpo con brida:

        ┌─────────────────────────┐
        │    ○     ○     ○        │  ← Perforaciones para
        │                         │     pernos (8x Ø6.5mm)
        │  ○               ○      │
        │                         │
        │ ○   ┌─────────┐   ○    │  ← Brida exterior
        │     │         │         │     (Ø110mm)
        │     │  Ø 63mm │         │
        │ ○   │         │   ○    │
        │     └─────────┘         │  ← Cuerpo interno
        │  ○               ○      │
        │    ○     ○     ○        │
        └─────────────────────────┘
```

**Fabricación:**
- Disco de acrílico/PVC de 110mm Ø × 8mm
- Perforación central de 63mm
- 8 perforaciones de 6.5mm en PCD 95mm
- Pegado con solvente de acrílico o PVC
- Refuerzo con insertos roscados de latón

#### Opción B: Brida Modular (Ensamblada)

```
Vista en corte de brida modular:

    ╔════════════════════════════╗
    ║   Brida superior (5mm)     ║  ← Apernada
    ╚════════════════════════════╝
             ║       ║
    ┌────────╨───────╨───────────┐
    │                            │
    │    CUERPO PRINCIPAL        │  ← O-rings de sujeción
    │        (Tubo)              │
    │                            │
    └────────╥───────╥───────────┘
             ║       ║
    ╔════════╨═══════╨═══════════╗
    ║   Brida inferior (5mm)     ║  ← Apernada
    ╚════════════════════════════╝
```

**Ventajas:**
- ✅ No requiere mecanizado del tubo
- ✅ Fácil reemplazo
- ✅ Ajuste de altura variable
- ✅ Menor costo de fabricación

**Componentes:**
- 2 discos de acrílico Ø110mm × 8mm
- 4 barras roscadas M6 × longitud de tubo + 40mm
- O-rings para sujeción (evitar rotación)

### 3. Refuerzo de Conexiones Laterales

#### Problema Actual
- Conexiones roscadas directamente en plástico
- Riesgo de agrietamiento por torque
- Posible desgaste de rosca

#### Solución: Insertos Roscados

```
Vista en corte de conexión reforzada:

    ────────────┐                ┌──────────── Pared del cuerpo
                │                │
                │   ┌────────┐   │
                │   │Inserto │   │  ← Inserto de latón
                │   │ roscado│   │     con brida
                │   │  M6    │   │
                │   └────────┘   │
                │                │
    ────────────┴────────────────┴────────────
                     ▲
              Conexión barbed
              para manguera
```

**Especificaciones del Inserto:**
- Material: Latón hexagonal
- Rosca externa: M10 × 1.0 (para acrílico)
- Rosca interna: 1/4" NPT o M6
- Brida exterior: Ø15mm
- Longitud: 12mm

**Instalación:**
1. Perforar piloto Ø8mm
2. Calentar inserto con pistola de calor
3. Presionar o atornillar en el plástico
4. Dejar enfriar (forma rosca por deformación)
5. Verificar alineación

**Alternativa - Insertos Ultrasónicos:**
- Instalación con soldadura ultrasónica
- Mayor resistencia a la extracción
- Requiere equipo especializado

### 4. Marcas de Referencia y Escala

#### Sistema de Alineación

**Marcas de Alineación Tapa-Cuerpo:**
```
Vista superior:

    CUERPO                  TAPA
      │                       │
      ▼                       ▼
    ┌───┐                   ┌───┐
    │ ▲ │  ←  Alinear  →    │ ▲ │
    └───┘                   └───┘
   (Grabado)               (Grabado)
```

- Marca triangular o flecha
- Grabado láser o fresado
- Pintado con color contrastante (rojo)

**Escala de Nivel:**
```
    │ 300mm ├───────────────┐
    │ 280mm │               │  ← Marcas cada 20mm
    │ 260mm │               │     grabadas en el cuerpo
    │ 240mm │               │
    │ 220mm │   COLUMNA     │
    │ 200mm │     DE        │
    │ 180mm │    SUELO      │
    │ 160mm │               │
    │ 140mm │               │
    │ 120mm │               │
    │ 100mm │               │
    │  80mm │               │
    │  60mm │               │
    │  40mm │               │
    │  20mm │               │
    │   0mm ├───────────────┘
```

- Facilita medición de altura de muestra
- Permite seguimiento de compactación
- Útil para documentación experimental

### 5. Mejora de Transparencia (Para Acrílico)

#### Problema
- Acrílico puede rayarse o nublarse con el tiempo
- Dificulta visualización del proceso

#### Soluciones

**Protección Exterior:**
- Film protector removible durante uso rudo
- Pulido periódico con compuesto para acrílico
- Limpieza solo con productos específicos

**Línea de Visualización:**
```
    ┌─────────────────┐
    │  ///////////    │  ← Zona opaca (posterior)
    │  ///////////    │     para mejor contraste
    │                 │
    │   [VENTANA]     │  ← Zona transparente (frontal)
    │    CLARA        │     para visualización
    │                 │
    │  ///////////    │
    │  ///////////    │
    └─────────────────┘
```

- Pintar 2/3 del perímetro con pintura opaca
- Dejar ventana frontal de 120° transparente
- Mejora contraste visual del flujo de fluido

### 6. Sistema de Soporte en la Base

#### Base Estabilizadora

```
Vista lateral de base:

    ┌─────────────────────────┐
    │      COLUMNA            │
    │                         │
    └────────┬───────┬────────┘
             │       │
    ╔════════╧═══════╧════════╗
    ║     Brida inferior      ║  ← 8mm espesor
    ║      (3 patas)          ║
    ╚══╗                   ╔══╝
       ╚═══╗           ╔═══╝
           ╚═══════════╝
              Patas
           (120° aparte)
```

**Características:**
- 3 patas equidistantes (120°)
- Altura de patas: 50mm
- Permite colocar recipiente colector debajo
- Nivelación ajustable (tornillos niveladores)

**Tornillos Niveladores:**
- M8 × 60mm con punta de nylon
- Contratuercas de seguridad
- Rango de ajuste: ±10mm
- Facilita nivelación del permeámetro

---

## Especificaciones de Materiales

### Comparación de Materiales para el Cuerpo

| Material | Ventajas | Desventajas | Costo Relativo |
|----------|----------|-------------|----------------|
| **Acrílico (PMMA)** | Transparente, fácil mecanizado, estético | Se raya fácil, sensible a solventes | Medio |
| **PVC transparente** | Resistente químicamente, económico | Menos transparente, se amarillea | Bajo |
| **Policarbonato** | Muy resistente, transparente, durable | Costoso, difícil de mecanizar | Alto |
| **Vidrio borosilicato** | Inerte, transparente perfecto | Frágil, difícil de mecanizar | Alto |
| **PVC opaco** | Económico, alta resistencia química | No permite visualización | Muy bajo |

### Recomendación

**Para laboratorio con presupuesto medio:**
- **Cuerpo:** Acrílico transparente cast (no extruido)
- **Bridas:** PVC (mayor resistencia)
- **Tapa:** Acrílico transparente

**Para uso intensivo/químicos agresivos:**
- **Cuerpo:** Policarbonato
- **Bridas:** Policarbonato
- **Tapa:** Policarbonato
- **Sellos:** Viton

---

## Proceso de Fabricación

### Paso 1: Preparación del Tubo

```
1. Adquirir tubo de acrílico extruido:
   - Ø exterior: 73mm
   - Ø interior: 63mm
   - Largo: 350mm (cortar a 300mm después)
   - Espesor pared: 5mm

2. Verificar calidad:
   - Sin burbujas internas
   - Paredes uniformes
   - Cilindricidad < 0.5mm
```

### Paso 2: Mecanizado de Extremos

```
1. Marcar líneas de corte con rotulador
2. Cortar con sierra de mesa o segueta fina
3. Refrentar caras en torno (o manualmente)
4. Verificar perpendicularidad con escuadra
5. Pulir hasta Ra < 1.6 μm
```

### Paso 3: Perforación de Puertos

```
1. Marcar ubicación de puertos laterales:
   - Puerto inferior: 30mm desde base
   - Puerto superior: 270mm desde base
   - Alineados verticalmente (0° y 180°)

2. Perforar con broca escalonada:
   - Piloto: Ø3mm
   - Escalado: Ø5mm → Ø8mm → Ø10mm
   - Refrigerar con agua

3. Instalar insertos roscados
```

### Paso 4: Ensamblaje de Bridas

```
1. Preparar discos de brida (corte láser ideal)
2. Lijar borde interno para ajuste preciso
3. Aplicar solvente para acrílico (Weld-On #4)
4. Ensamblar con presión uniforme
5. Dejar curar 24 horas
6. Perforar agujeros para pernos
```

### Paso 5: Acabado Final

```
1. Pulir exterior con kit de pulido
2. Grabar marcas de escala con láser
3. Pintar marcas con pintura acrílica
4. Limpiar con alcohol isopropílico
5. Aplicar film protector si es necesario
```

---

## Control de Calidad

### Inspecciones Críticas

**Dimensionales:**
- [ ] Diámetro interno: 63.0 ±0.2 mm
- [ ] Altura total: 300 ±1 mm
- [ ] Perpendicularidad de caras: < 0.1 mm
- [ ] Planicidad borde superior: < 0.05 mm

**Visuales:**
- [ ] Sin rayones profundos
- [ ] Sin burbujas en paredes
- [ ] Transparencia uniforme
- [ ] Marcas de escala legibles

**Funcionales:**
- [ ] Insertos roscados firmes
- [ ] Bridas bien adheridas
- [ ] Alineación correcta de puertos

---

## Mantenimiento del Cuerpo

### Limpieza Post-Experimento

```
1. Vaciar completamente el suelo
2. Enjuagar con agua destilada varias veces
3. Llenar con solución limpiadora:
   - Agua + 5% ácido acético (vinagre)
   - Dejar actuar 30 minutos
4. Enjuagar abundantemente
5. Secar con aire comprimido filtrado
6. Inspeccionar transparencia
```

### Productos NO Usar

❌ **Evitar:**
- Acetona (disuelve acrílico)
- Alcohol metílico (daña PVC)
- Limpiadores abrasivos
- Cepillos metálicos
- Solventes aromáticos

✅ **Usar:**
- Agua destilada
- Jabón pH neutro
- Alcohol isopropílico (moderación)
- Paños de microfibra

### Pulido de Rayones

```
Para rayones superficiales en acrílico:

1. Limpiar área
2. Aplicar compuesto de pulido (Novus #2)
3. Frotar circular con paño suave
4. Para rayones profundos usar Novus #1 primero
5. Terminar con abrillantador Novus #3
```

---

## Mejoras Futuras

### Instrumentación Integrada

**Puertos para Sensores:**
- Sensor de temperatura (PT100)
- Sensor de conductividad eléctrica
- Puertos de muestreo a diferentes alturas

**Diseño Modular:**
```
    ┌─────────┐
    │  Tapa   │
    ├─────────┤
    │ Sección │  ← 100mm, intercambiable
    │    1    │
    ├─────────┤
    │ Sección │  ← 100mm, con puertos
    │    2    │
    ├─────────┤
    │ Sección │  ← 100mm, con sensores
    │    3    │
    ├─────────┤
    │  Base   │
    └─────────┘
```

Permite:
- Ajustar altura total
- Reemplazar secciones dañadas
- Configurar instrumentación según necesidad

---

**Siguiente:** Ver `04_CONEXIONES.md` para mejoras en el sistema de plomería y conexiones.
