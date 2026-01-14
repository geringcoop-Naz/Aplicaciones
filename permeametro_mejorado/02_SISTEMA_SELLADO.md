# Sistema de Sellado - Especificaciones Técnicas

## Filosofía de Diseño
Implementación de **sistema de doble sellado redundante** para prevenir fugas bajo presión durante ensayos de permeabilidad.

---

## Componentes del Sistema de Sellado

### 1. O-Ring Principal (Sellado Primario)

#### Especificaciones del O-Ring

**Material Recomendado: VITON (FKM)**

| Propiedad | Valor | Razón |
|-----------|-------|-------|
| Tipo | Fluoroelastómero (FKM) | Resistencia química superior |
| Dureza | 70-75 Shore A | Balance entre sellado y compresión |
| Rango de temperatura | -20°C a +200°C | Amplio rango operativo |
| Resistencia química | Excelente | Soluciones salinas, ácidos, bases |
| Color | Negro o marrón | Identificación estándar |

**Alternativas de Material:**

| Material | Ventajas | Desventajas | Aplicación |
|----------|----------|-------------|------------|
| **EPDM** | Excelente con agua, económico | Pobre con aceites | Agua limpia únicamente |
| **Nitrilo (NBR)** | Económico, resistente a aceites | Degradación con ozono | Uso ocasional |
| **Silicona** | Flexible, alta temperatura | Baja resistencia mecánica | No recomendado |
| **PTFE encapsulado** | Químicamente inerte | Costoso | Químicos agresivos |

#### Dimensiones del O-Ring

```
Cálculo basado en diámetro de columna = 63 mm

Diámetro del canal (groove) = 70 mm
Sección transversal (cross-section) = 5 mm

Especificación AS568:
- Cercano a AS568-221: ID ~2.62" (66.5mm), CS 0.139" (3.5mm)
- Cercano a AS568-223: ID ~2.87" (72.9mm), CS 0.139" (3.5mm)

RECOMENDACIÓN: O-ring métrico personalizado
- ID (Diámetro interno): 67 mm
- CS (Sección transversal): 5 mm
- Compresión: 15-20% (óptimo para sellado estático)
```

#### Diseño del Canal (Groove)

**Dimensiones del Canal:**
```
         ┌─────── W (ancho) ───────┐
         │                          │
    ─────┤                          ├─────  ← Superficie de tapa
         │                          │
         │      ●●●●●●●●●           │
         │    ●         ●           │
         │   ●           ●          │  ← D (profundidad)
         │   ●  O-ring   ●          │
         │   ●           ●          │
         │    ●         ●           │
         │      ●●●●●●●             │
         └──────────────────────────┘

Para O-ring de 5mm de sección:
- W (ancho del canal) = 6.0 mm
- D (profundidad) = 2.5 mm  
- R (radio de esquinas) = 0.5 mm
- Compresión = 50% (5mm comprimido a 2.5mm)

Acabado superficial:
- Ra ≤ 1.6 μm (≈ 63 μin)
- Sin porosidades ni rayones
```

**Tolerancias:**
- Ancho del canal: +0.1 / -0 mm
- Profundidad: ±0.05 mm
- Cilindricidad: ≤ 0.05 mm

#### Instalación del O-Ring

**Procedimiento:**

1. **Limpieza:**
   ```
   - Limpiar canal con alcohol isopropílico
   - Secar completamente con aire comprimido
   - NO usar solventes agresivos
   - Inspeccionar visualmente el canal
   ```

2. **Inspección del O-Ring:**
   ```
   ✓ Sin cortes ni rasgaduras
   ✓ Sin deformaciones permanentes
   ✓ Sin hinchazón o endurecimiento
   ✓ Color uniforme (no blanquecino)
   ✗ Desechar si hay defectos
   ```

3. **Lubricación:**
   ```
   Lubricante recomendado:
   - Grasa de silicona grado alimenticio
   - Dow Corning 111
   - Super Lube (sintético)
   
   Aplicación:
   - Capa delgada y uniforme
   - Cubrir toda la circunferencia
   - NO aplicar en exceso
   ```

4. **Colocación:**
   ```
   - Estirar mínimamente el O-ring
   - Colocar en el canal sin torsiones
   - Verificar asentamiento completo
   - NO pellizcar entre superficies
   ```

### 2. Empaque Plano Secundario (Respaldo)

#### Especificaciones

**Material Recomendado: PTFE (Teflón)**

| Propiedad | Valor |
|-----------|-------|
| Material | PTFE virgen (no reciclado) |
| Espesor | 2.0 mm (±0.1 mm) |
| Diámetro exterior | 70 mm |
| Diámetro interior | 63.5 mm |
| Acabado | Ambas caras lisas |
| Color | Blanco natural |

**Función del Empaque Secundario:**
- Distribución uniforme de la presión
- Protección del O-ring contra extrusión
- Sellado de respaldo si falla el O-ring
- Compensación de irregularidades superficiales

**Alternativa Económica:**
- Caucho nitrilo de 2mm
- Resistente a soluciones salinas
- Menor costo, menor durabilidad

### 3. Configuración de Ensamble

#### Sistema de Doble Sellado

```
Vista en corte del sistema de sellado:

     ┌────────── TAPA ──────────┐
     │                          │  15mm
     │                          │
     ├──────────────────────────┤ ← Superficie de contacto
     │   ╔═══════════════════╗  │
     │   ║   ●●●●●●●●●●●●●   ║  │ ← Canal + O-ring (primario)
     │   ╚═══════════════════╝  │
     └──────────────────────────┘
            ║         ║
     ┌──────║─────────║─────────┐
     │ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  │ ← Empaque plano (secundario)
     ├──────────────────────────┤ ← Borde superior del cuerpo
     │                          │
     │   CUERPO DE LA COLUMNA    │
     │        (Ø 63mm)          │
     │                          │
     │      [Muestra de suelo]  │
     │                          │
```

#### Secuencia de Compresión

**Fase 1 - Sin Presión:**
```
O-ring: Compresión inicial 15%
Empaque plano: Contacto ligero
Estado: Pre-sellado
```

**Fase 2 - Presión de Apriete (4-5 Nm):**
```
O-ring: Compresión 20-25%
Empaque plano: Compresión completa
Estado: Sellado hermético
```

**Fase 3 - Bajo Presión Interna (0.5-2 bar):**
```
O-ring: Fuerza adicional desde el interior
Empaque plano: Distribución de carga
Estado: Sellado mejorado por presión
```

---

## Técnicas Avanzadas de Sellado

### 1. Sistema de Triple Sellado (Opcional)

Para aplicaciones de alta presión (> 3 bar):

```
           TAPA
             │
     O-ring Principal (Viton 5mm)
             │
     Empaque PTFE (2mm)
             │
     O-ring Secundario (Viton 3mm)
             │
        CUERPO COLUMNA
```

### 2. Sellado con Junta de Espiral

Para presiones extremas o químicos agresivos:

- Junta espiro-metálica
- Núcleo de acero inoxidable 316
- Recubrimiento PTFE
- Mayor costo, máxima confiabilidad

### 3. Sellado Líquido Complementario

**NO recomendado como solución principal**, pero útil como respaldo:

- Sellador líquido de silicona
- Solo en la cara externa (no contacto con muestra)
- Aplicación temporal durante reparaciones

---

## Prevención de Fallas

### Causas Comunes de Fuga

| Causa | Síntoma | Solución |
|-------|---------|----------|
| **Canal mal mecanizado** | Fuga desde el inicio | Re-mecanizar canal con tolerancias correctas |
| **O-ring dañado** | Fuga intermitente | Reemplazar O-ring |
| **Superficie irregular** | Fuga en zona específica | Pulir superficie (Ra < 1.6 μm) |
| **Torque insuficiente** | Fuga bajo presión | Apretar pernos en secuencia |
| **Torque excesivo** | Deformación del O-ring | Usar torquímetro calibrado |
| **Material incompatible** | Hinchazón del O-ring | Cambiar material del sello |
| **Envejecimiento** | Fuga progresiva | Programa de reemplazo preventivo |

### Inspección Pre-Uso

**Checklist antes de cada experimento:**

```
□ Canal del O-ring limpio y seco
□ O-ring sin daños visibles
□ O-ring correctamente lubricado
□ Empaque plano bien posicionado
□ Superficie de sellado limpia
□ Sin partículas de suelo en el borde
□ Pernos apretados uniformemente
□ Sin fugas visibles en prueba inicial
□ Presión de prueba alcanzada sin fugas
```

---

## Pruebas de Sellado

### Prueba de Presión Hidrostática

**Procedimiento:**

1. **Llenar columna con agua limpia**
   - Purgar todo el aire
   - Cerrar válvula inferior

2. **Aumentar presión gradualmente**
   - 0.5 bar → esperar 5 min → inspeccionar
   - 1.0 bar → esperar 5 min → inspeccionar
   - 1.5 bar → esperar 10 min → inspeccionar

3. **Criterio de aceptación**
   - Cero fugas visibles
   - Presión estable durante 10 minutos
   - Sin gotas en la interfaz tapa-cuerpo

### Prueba de Vacío (Alternativa)

```
1. Cerrar todas las válvulas
2. Aplicar vacío moderado (0.5 bar)
3. Escuchar silbidos (entrada de aire)
4. Aplicar agua jabonosa en sellos
5. Observar formación de burbujas
```

---

## Mantenimiento Preventivo

### Programa de Reemplazo

| Componente | Intervalo | Criterio |
|------------|-----------|----------|
| **O-ring Viton** | 50 usos o 6 meses | El primero que ocurra |
| **Empaque PTFE** | 100 usos o 1 año | El primero que ocurra |
| **Lubricante** | Cada uso | Aplicar antes de ensamblar |
| **Limpieza profunda** | 25 usos | Desarmar y limpiar todo |

### Almacenamiento de O-Rings

**Condiciones óptimas:**
- Temperatura: 15-25°C
- Humedad: 40-70%
- Alejado de luz UV
- En bolsas selladas
- Sin contacto con metales
- Libre de ozono (no cerca de motores eléctricos)

**Vida útil en almacenamiento:**
- Viton: 10-15 años
- Nitrilo: 5-7 años
- EPDM: 10 años

---

## Mejoras Futuras

### Sistema de Monitoreo de Sellado

**Sensor de Humedad en la Interfaz:**
- Detecta micro-fugas antes de que sean visibles
- Alerta temprana de fallo de sellado

**Indicador de Presión de Contacto:**
- Papel sensible a presión entre superficies
- Verifica distribución uniforme de carga

### Sellado Magnético (Avanzado)

- Imanes de neodimio en tapa y cuerpo
- Presión uniforme sin pernos
- Costoso pero muy confiable

---

## Referencias Técnicas

**Normas Aplicables:**
- ISO 3601-1: O-rings - Dimensiones
- ISO 3601-2: O-rings - Alojamientos
- DIN 3771: O-rings - Dimensiones métricas
- ASTM D2000: Clasificación de elastómeros

**Proveedores Recomendados:**
- Parker Hannifin (O-rings de precisión)
- Trelleborg Sealing Solutions
- James Walker (UK)
- NOK Corporation

---

**Siguiente:** Ver `03_CUERPO_COLUMNA.md` para modificaciones al cuerpo principal del permeámetro.
