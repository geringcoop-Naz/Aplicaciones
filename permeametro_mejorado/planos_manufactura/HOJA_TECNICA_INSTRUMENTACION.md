# HOJA DE DATOS TÉCNICOS - SISTEMA DE MEDICIÓN DE PRESIÓN

---

## INFORMACIÓN GENERAL

| Campo | Valor |
|-------|-------|
| **Número de Sistema** | INST-001 |
| **Nombre** | Sistema de Medición de Presión para Gradiente Hidráulico |
| **Revisión** | B |
| **Fecha** | 2026-01-12 |
| **Función** | Medición de presión a diferentes alturas para cálculo de conductividad hidráulica |
| **Cantidad de Puertos** | 2 (configuración optimizada) |

---

## CONFIGURACIÓN DEL SISTEMA

### Distribución de Puertos en la Columna

```
Vista lateral del cuerpo de la columna:

                    Tapa Superior
    ════════════════════════════
    ║                          ║
    ║                          ║
    ║                          ║
    ║  P2 ─── 250mm ───────┐   ║  ← Puerto 2 (SUPERIOR)
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║                      │   ║
    ║  P1 ─── 50mm ────────┘   ║  ← Puerto 1 (INFERIOR)
    ║                          ║
    ║                          ║
    ════════════════════════════
                    Base

    Altura total columna: 300mm
    Distancia efectiva de medición: 200mm
    Posiciones optimizadas para máximo gradiente
```

### Tabla de Posiciones

| Puerto | Altura desde Base | Función Principal |
|--------|------------------|-------------------|
| **P1** | 50 mm | **Medición presión inferior** (debajo de la muestra) |
| **P2** | 250 mm | **Medición presión superior** (sobre la muestra) |

**Ventajas de esta configuración:**
- ✅ **Distancia máxima de medición:** 200 mm (optimiza precisión del gradiente)
- ✅ **Economía:** Solo 2 manómetros en lugar de 5 (ahorro ~$120 USD)
- ✅ **Simplicidad:** Instalación y calibración más rápida
- ✅ **Suficiente:** Para flujo homogéneo, 2 puntos son suficientes (Ley de Darcy)
- ✅ **Mantenimiento:** Menos componentes = menos puntos de falla

**Distancia efectiva de medición:** 200 mm (P2 - P1)

---

## COMPONENTES DEL SISTEMA

### 1. Insertos Roscados para Puertos (2 unidades)

**Especificaciones:**
- **Material:** Latón niquelado o Acero inoxidable 316
- **Rosca exterior:** M6 × 1.0 (instalación en columna)
- **Rosca interior:** 1/8" NPT (conexión de tubería)
- **Longitud total:** 12 mm
- **Diámetro cabeza:** 8 mm

**Instalación en el cuerpo:**
```
Vista de corte transversal:

    Interior columna         Pared          Exterior
    (muestra de suelo)       Ø73mm         
    
         ┌───────────────────────────┐
         │                           │
    Ø63mm│     ╔═══════╗            │
         │     ║ SUELO ║   ┌────┐   │
         │     ║       ║ ┌─┤    │   │ ← Inserto roscado
         │     ║       ║─┤ └────┘   │
         │     ║       ║ │  Tubo    │
         │     ╚═══════╝ │  salida  │
         │               │          │
         └───────────────┴──────────┘
         
    Profundidad penetración: 3mm máximo
    (Flush con pared interior)
```

**Instalación:**
1. Perforar columna: Ø5.0 mm (piloto para M6)
2. Roscar con macho M6 × 1.0
3. Aplicar sellador PTFE en rosca
4. Atornillar inserto hasta flush
5. Verificar que no sobresale al interior

### 2. Manómetros Digitales (2 unidades)

**Opción A - Básica (Recomendada para inicio):**

**Manómetro Digital Estándar:**
- **Rango:** 0 - 3 bar (0 - 300 kPa)
- **Resolución:** 0.01 bar (1 kPa)
- **Precisión:** ±1% FS (Full Scale)
- **Display:** LCD 4 dígitos
- **Conexión:** 1/8" NPT
- **Alimentación:** Batería 9V o AAA
- **Costo aproximado:** $30-50 USD c/u
- **Total para 2 unidades:** $60-100 USD

**Marcas sugeridas:**
- WIKA modelo DG-10
- Ashcroft 2089
- Winters DPG224

**Opción B - Avanzada (Para adquisición de datos):**

**Transductor de Presión con Salida Analógica:**
- **Rango:** 0 - 3 bar
- **Salida:** 4-20 mA o 0-10V
- **Precisión:** ±0.5% FS
- **Conexión:** 1/8" NPT
- **Alimentación:** 12-24 VDC
- **Interfaz:** Analógica a DAQ (Data Acquisition)
- **Costo aproximado:** $80-150 USD c/u
- **Total para 2 unidades:** $160-300 USD

**Opción A - Básica (Recomendada para inicio):**

**Manómetro Digital Estándar:**
- **Rango:** 0 - 3 bar (0 - 300 kPa)
- **Resolución:** 0.01 bar (1 kPa)
- **Precisión:** ±1% FS (Full Scale)
- **Display:** LCD 4 dígitos
- **Conexión:** 1/8" NPT
- **Alimentación:** Batería 9V o AAA
- **Costo aproximado:** $30-50 USD c/u

**Marcas sugeridas:**
- WIKA modelo DG-10
- Ashcroft 2089
- Winters DPG224

**Opción B - Avanzada (Para adquisición de datos):**

**Transductor de Presión con Salida Analógica:**
- **Rango:** 0 - 3 bar
- **Salida:** 4-20 mA o 0-10V
- **Precisión:** ±0.5% FS
- **Conexión:** 1/8" NPT
- **Alimentación:** 12-24 VDC
- **Interfaz:** Analógica a DAQ (Data Acquisition)
- **Costo aproximado:** $80-150 USD c/u

**Marcas sugeridas:**
- Honeywell PX2
- Omega PX309
- Keller Series 33X

### 3. Sistema de Tubería y Conexiones

**Tubería de Conexión:**
- **Material:** Silicona o Tygon
- **Diámetro interior:** 3 mm
- **Diámetro exterior:** 5 mm
- **Longitud por puerto:** ~30 cm
- **Color:** Transparente (verificar burbujas)
- **Presión de trabajo:** Min. 5 bar

**Conectores:**
- **Tipo:** Push-fit o barbed (espiga)
- **Material:** Polipropileno o latón
- **Tamaño:** 1/8" NPT × barb 3mm
- **Cantidad:** 5 unidades

**Llaves de Purga (Opcional):**
- **Tipo:** Micro válvula de esfera
- **Tamaño:** 1/8" NPT
- **Función:** Purga de aire del sistema
- **Cantidad:** 5 (una por puerto)

---

## CÁLCULO DEL GRADIENTE HIDRÁULICO

### Fundamento Teórico

El gradiente hidráulico ($i$) se calcula usando la Ley de Darcy:

$$i = \frac{\Delta h}{L}$$

Donde:
- $\Delta h$ = Diferencia de carga hidráulica entre dos puntos (cm o m)
- $L$ = Distancia vertical entre los puntos de medición (cm o m)

### Procedimiento de Cálculo

**Paso 1: Convertir presión a carga hidráulica**

$$h = \frac{P}{\rho g}$$

Donde:
- $h$ = Carga hidráulica (m)
- $P$ = Presión medida (Pa)
- $\rho$ = Densidad del fluido (kg/m³) ≈ 1000 para agua
- $g$ = Aceleración gravedad (m/s²) ≈ 9.81

**Conversión rápida:**
- 1 bar = 10.197 m de columna de agua
- 1 kPa = 0.102 m de columna de agua

**Paso 2: Calcular gradiente entre puertos**

Ejemplo entre P1 y P5:

$$i = \frac{h_5 - h_1}{L_{5-1}} = \frac{h_5 - h_1}{0.24 \text{ m}}$$

### Ejemplo Numérico

**Datos medidos:**
- P1 = 1.50 bar
- P5 = 0.80 bar
- Distancia P5-P1 = 240 mm = 0.24 m

**Cálculo:**
1. $h_1 = 1.50 \times 10.197 = 15.30$ m
2. $h_5 = 0.80 \times 10.197 = 8.16$ m
3. $\Delta h = 15.30 - 8.16 = 7.14$ m
4. $i = 7.14 / 0.24 = 29.75$

**Conductividad Hidráulica (K):**

$$K = \frac{Q}{A \cdot i}$$

Donde:
- $Q$ = Caudal medido (m³/s)
- $A$ = Área sección transversal = $\pi (0.0315)^2 = 0.00312$ m²
- $i$ = Gradiente calculado

---

## INSTALACIÓN Y CALIBRACIÓN

### Procedimiento de Instalación

**1. Marcado de Posiciones**
- Marcar 5 puntos en línea vertical sobre el cuerpo
- Verificar alturas: 30, 90, 150, 210, 270 mm desde base
- Usar nivel para verticalidad
- Marcar con broca de centrar

**2. Perforación**
- Usar broca Ø5.0 mm para acrílico
- Velocidad: 1500-2000 RPM
- Perforar atravesando pared (5 mm espesor)
- Desbarbar interior y exterior

**3. Roscado**
- Macho M6 × 1.0
- Lubricar con aceite de corte
- Roscar manualmente con cuidado
- Verificar profundidad: 8-10 mm

**4. Instalación de Insertos**
- Aplicar cinta PTFE en rosca exterior
- Atornillar hasta 1 mm antes del flush
- Verificar que no sobresale al interior
- Ajuste final con llave Allen

**5. Conexión de Tubería**
- Cortar segmentos de tubería (30 cm c/u)
- Conectar a inserto con conector push-fit
- Conectar extremo a manómetro
- Verificar que no hay dobleces

**6. Llenado del Sistema**
- Llenar columna con agua destilada
- Purgar aire de cada línea de medición
- Abrir/cerrar válvulas de purga
- Verificar que no hay burbujas

### Calibración

**Método de Calibración por Columna de Agua:**

1. **Setup:**
   - Llenar permeámetro completamente con agua
   - Sin flujo (válvulas cerradas)
   - Nivelar equipo

2. **Verificación de Lectura Cero:**
   - Con válvula de entrada abierta a atmósfera
   - Todos los manómetros deben leer presión atmosférica
   - Ajustar offset si necesario

3. **Verificación de Gradiente:**
   - Aplicar presión conocida en entrada
   - Verificar diferencia de lectura entre puertos
   - Debe ser lineal con la altura

**Criterios de Aceptación:**
- Diferencia entre puertos consecutivos: 60 mm × $\rho g$ ± 5%
- Linealidad: R² > 0.99 en gráfica P vs altura

---

## MANTENIMIENTO Y SOLUCIÓN DE PROBLEMAS

### Mantenimiento Preventivo

**Cada experimento:**
- [ ] Purgar aire de líneas de medición
- [ ] Verificar ausencia de fugas en conexiones
- [ ] Comprobar lectura coherente entre puertos

**Mensual:**
- [ ] Calibración de punto cero
- [ ] Limpieza de filtros (si aplica)
- [ ] Verificar estado de tubería (transparencia)

**Trimestral:**
- [ ] Calibración completa multi-punto
- [ ] Reemplazo de tubería si está opaca
- [ ] Verificar baterías de manómetros

### Solución de Problemas Comunes

| Problema | Causa Probable | Solución |
|----------|----------------|----------|
| Lecturas erráticas | Burbujas de aire en línea | Purgar línea completamente |
| Lectura no cambia | Línea obstruida | Verificar/limpiar conector |
| Diferencia excesiva P1-P5 | Fuga en columna | Verificar sellado tapa |
| Lecturas idénticas | Puertos conectados entre sí | Verificar independencia |
| Deriva en lectura | Temperatura | Estabilizar temp. ambiente |

---

## ESPECIFICACIONES DE COMPRA

### Lista de Componentes para Adquisición

| Item | Descripción | Cant. | Prec. Unit. | Total |
|------|-------------|-------|-------------|-------|
| INST-001 | Inserto roscado M6×1/8"NPT latón | 5 | $2 | $10 |
| INST-002 | Manómetro digital 0-3 bar 1/8"NPT | 5 | $40 | $200 |
| INST-003 | Tubería silicona ID3mm×OD5mm (rollo 3m) | 1 | $15 | $15 |
| INST-004 | Conector push-fit 1/8"NPT×3mm | 5 | $3 | $15 |
| INST-005 | Sellador PTFE (cinta) | 1 | $3 | $3 |
| **TOTAL SISTEMA** | | | | **$243** |

### Proveedores Sugeridos

**Insertos y Conectores:**
- McMaster-Carr (USA)
- Grainger Industrial
- Distribuidores locales de plomería industrial

**Manómetros:**
- WIKA Instruments
- Ashcroft Inc.
- Omega Engineering
- Winters Instruments

**Tubería:**
- Cole-Parmer
- Distribuidores de material de laboratorio

---

## DOCUMENTACIÓN DE REFERENCIA

**Normas aplicables:**
- ASTM D5084 - Permeámetro de pared flexible
- ISO 17892-11 - Permeabilidad de suelos

**Documentos relacionados:**
- 03_CUERPO_COLUMNA.md - Modificaciones al cuerpo
- 04_CONEXIONES.md - Sistema de plomería
- 05_ENSAMBLAJE.md - Procedimiento de instalación
- ASM-001 Rev.B - Plano de ensamblaje general

---

## REGISTRO DE CALIBRACIÓN

**Formato sugerido para registro:**

```
CALIBRACIÓN SISTEMA MEDICIÓN DE PRESIÓN
Fecha: ___/___/______
Operador: ________________

Condiciones:
- Temperatura ambiente: _____ °C
- Fluido: Agua destilada
- Nivel: Columna llena

Lecturas en Reposo (sin flujo):
| Puerto | Lectura (bar) | Altura teórica | Desviación |
|--------|---------------|----------------|------------|
| P1     | _______       | 0.00           | _______    |
| P2     | _______       | 0.06           | _______    |
| P3     | _______       | 0.12           | _______    |
| P4     | _______       | 0.18           | _______    |
| P5     | _______       | 0.24           | _______    |

Criterio: Desviación < 5% del valor teórico
Estado: APROBADO [ ]  RECHAZADO [ ]

Observaciones:
_____________________________________________
```

---

## REVISIONES

| Rev. | Fecha | Descripción | Aprobado |
|------|-------|-------------|----------|
| A | 2026-01-12 | Emisión inicial | - |

---

**Documento:** Sistema de Medición de Presión  
**Código:** INST-001-Rev.A  
**Página:** 1 de 1  
**Proyecto:** Permeámetro con Sistema de Sellado y Medición Mejorado
