# DISEÑO FINAL CLARIFICADO - REV. H

## 🎯 CONFIGURACIÓN DEFINITIVA

### **RESUMEN DE COMPONENTES:**

```
IMPRESOS 3D (PETG):        7 piezas
COMPRADOS:                 1 cilindro + sellado + hardware
TOTAL A IMPRIMIR:          ~400g, 35 horas
```

---

## 📦 COMPONENTES DEL SISTEMA

### **A. COMPONENTES IMPRESOS EN 3D (PETG)**

| # | Componente | Función | Peso | Tiempo |
|---|-----------|---------|------|--------|
| 1 | **Tapa Superior** | Cierre superior + puerto entrada | 80g | 7h |
| 2 | **Tapa Inferior** | Cierre inferior + puerto salida | 80g | 7h |
| 3 | **Brida Superior** | Sistema apriete tapa superior | 60g | 4h |
| 4 | **Brida Inferior** | Sistema apriete tapa inferior | 60g | 4h |
| 5 | **Difusor Superior** | Distribución flujo entrada | 15g | 2h |
| 6 | **Difusor Inferior** | Distribución flujo salida | 15g | 2h |
| 7 | **Base** | Soporte + patas niveladoras | 90g | 9h |
| **TOTAL** | | | **400g** | **35h** |

### **B. COMPONENTE COMPRADO (NO imprimir)**

| Componente | Especificación | Dónde Comprar | Costo |
|------------|----------------|---------------|-------|
| **Cilindro/Tubo** | Acrílico Ø73mm ext × Ø63mm int × 300mm | Proveedor plásticos | $20-30 |

**IMPORTANTE:** El cilindro es un **tubo acrílico comercial transparente**
- NO se imprime
- Se compra en tienda de plásticos/acrílicos
- Alternativa: PVC transparente

### **C. SISTEMA DE SELLADO (Comprado)**

| Componente | Especificación | Cantidad | Costo |
|------------|----------------|----------|-------|
| O-ring superior | Viton Ø67mm × 5mm | 1 | $8 |
| O-ring inferior | Viton Ø67mm × 5mm | 1 | $8 |
| Junta PTFE superior | Disco Ø105/Ø65 × 2mm | 1 | $3 |
| Junta PTFE inferior | Disco Ø105/Ø65 × 2mm | 1 | $3 |
| Grasa silicona | Compatible PETG | 1 tubo | $3 |

### **D. HARDWARE DE SUJECIÓN (Comprado)**

| Componente | Especificación | Cantidad | Costo |
|------------|----------------|----------|-------|
| Pernos superiores | M6 × 30mm acero inox | 8 | $3 |
| Pernos inferiores | M6 × 30mm acero inox | 8 | $3 |
| Arandelas | M6 acero inox | 32 | $3 |
| Tuercas | M6 autoblocante | 16 | $3 |
| Patas niveladoras | M8 × 60mm | 3 | $15 |

### **E. SISTEMA DE PUERTOS (Comprado)**

| Componente | Especificación | Cantidad | Costo |
|------------|----------------|----------|-------|
| Insertos presión | 1/8" NPT latón | 2 | $4 |
| Fitting entrada | 1/4" NPT latón | 1 | $3 |
| Fitting salida | 1/4" NPT latón | 1 | $3 |
| Válvulas | 1/4" NPT | 2 | $25 |
| Manómetros digitales | 0-3 bar | 2 | $80 |

---

## 🔍 DESCRIPCIÓN DETALLADA POR COMPONENTE

### 1. TAPA SUPERIOR (Impresa)

**Características:**
- Disco principal Ø100mm × 15mm
- Reborde de sellado (se inserta en cilindro interior)
- Puerto entrada central Ø8mm (1/4" NPT)
- 8 agujeros para pernos M6
- Canal O-ring en reborde

**Función:**
- Cierra el cilindro por arriba
- Reborde se inserta en Ø63mm del cilindro
- O-ring sella entre reborde y cilindro
- Difusor se monta debajo
- Brida comprime desde arriba con 8 pernos

**Archivo:** Crear `tapa_superior_rev_h.scad`

### 2. TAPA INFERIOR (Impresa)

**Similar a superior pero:**
- Puerto LATERAL para salida (no central)
- Puerto a media altura de la tapa
- Mismo sistema de sellado

**Archivo:** Crear `tapa_inferior_rev_h.scad`

### 3. BRIDAS DE APRIETE × 2 (Impresas)

**Características:**
- Anillo Ø110mm ext × Ø73.5mm int × 8mm
- Agujero central permite paso del cilindro
- 8 agujeros para pernos M6 en PCD 95mm

**Función:**
- Se deslizan sobre el cilindro
- Comprimen las tapas contra los extremos del cilindro
- Sistema tipo "abrazadera"

**Instalación:**
```
Brida inferior → se desliza hasta base del cilindro
Tapa inferior → se inserta en cilindro (desde abajo)
8 pernos → atraviesan brida y tapa
Apriete → comprime tapa contra cilindro (sella O-ring)

Mismo proceso arriba con brida y tapa superior
```

### 4. DIFUSORES × 2 (Impresos)

**Características:**
- Disco Ø50mm × 2mm
- 37 perforaciones Ø2mm en patrón
- 4 agujeros montaje M3

**Ubicación:**
- Difusor superior: bajo tapa superior (distribuye entrada)
- Difusor inferior: sobre tapa inferior (colecta salida)

### 5. BASE (Impresa)

**Características:**
- Disco Ø110mm × 20mm
- Cavidad central para cilindro
- 3 agujeros para patas niveladoras M8

**Función:**
- Soporte del cilindro
- Estabilidad con 3 patas
- Nivelación del equipo

### 6. CILINDRO (COMPRADO - NO imprimir)

**Especificación CRÍTICA:**
- Ø exterior: 73mm ±0.5mm
- Ø interior: 63mm ±0.5mm
- Altura: 300mm ±2mm
- Material: Acrílico cast transparente
- Espesor pared: 5mm
- Acabado: Pulido transparente

**Dónde comprar:**
- Proveedores de plásticos industriales
- Tiendas de acrílicos
- Alternativa online: McMaster-Carr, ePlastics

**Costo:** $20-30 USD

**Modificaciones necesarias:**
```
1. Perforar 2 agujeros laterales:
   - P1: a 50mm de la base (Ø5mm)
   - P2: a 250mm de la base (Ø5mm)
   
2. Roscar o pegar insertos 1/8" NPT en agujeros

3. Limpiar y pulir bordes
```

---

## 🔩 SISTEMA DE ENSAMBLAJE

### Configuración del Sandwich (Superior)

```
Vista de corte superior:

    ╔═══════════╗  ← Cabeza perno M6
    ║  BRIDA    ║  8mm (comprime hacia abajo)
    ║ SUPERIOR  ║
    ╠═══════════╣
    ║  TAPA     ║  15mm
    ║ SUPERIOR  ║
    ║   ╔═══╗   ║  ← Reborde 5mm (entra en cilindro)
    ║   ║ O ║   ║  ← O-ring sella aquí
╔═══╪═══╚═══╝═══╪═══╗
║   │ CILINDRO  │   ║  Ø73mm
║   │ (COMPRADO)│   ║  300mm altura
║   │           │   ║
║   │ Ø63 int   │   ║
```

### Configuración del Sandwich (Inferior)

```
Vista de corte inferior:

║   │ CILINDRO  │   ║
║   │           │   ║
╚═══╪═══╗═══╔═══╪═══╝
    ║   ║ O ║   ║  ← O-ring
    ║   ╚═══╝   ║  ← Reborde entra
    ║  TAPA     ║  15mm
    ║ INFERIOR  ║
    ╠═══════════╣
    ║  BRIDA    ║  8mm
    ║ INFERIOR  ║
    ╚═══════════╝  ← Tuerca M6
    
    ══BASE═══  20mm (soporte)
      ▼ ▼ ▼
    3 Patas M8
```

---

## 🎨 VENTAJAS DE ESTA CONFIGURACIÓN

### ✅ Beneficios

1. **Cilindro comercial:**
   - Más barato que imprimir ($20 vs $50 impresión grande)
   - Mejor transparencia (ver muestra)
   - No requiere impresora Z grande
   - Fácil reemplazar si se rompe

2. **Tapas impresas:**
   - Personalizables (puertos donde quieras)
   - Fácil modificar diseño
   - Rehacer si falla (solo ~7h c/u)

3. **Sistema modular:**
   - Todas las piezas independientes
   - Fácil reemplazar componente dañado
   - Permite upgrades futuros

4. **Doble difusor:**
   - Distribución uniforme entrada
   - Colección uniforme salida
   - Mejor calidad de datos

### ⚠️ Consideraciones

1. **Requiere comprar cilindro:**
   - No todas las tiendas lo tienen
   - Puede tomar 1-2 semanas conseguir
   - Verificar dimensiones exactas

2. **Más componentes:**
   - 7 piezas a imprimir vs 4 anterior
   - Más ensamblaje
   - Más puntos de sellado (2 vs 1)

---

## 💰 COSTO TOTAL ACTUALIZADO

### Impresión 3D
```
Material PETG (400g):        $12
Electricidad (35h):          $3
Total impresión:            $15
```

### Componentes Comprados
```
Cilindro acrílico:          $25
Sistema sellado:            $25
Hardware:                   $30
Puertos:                    $35
Instrumentación:            $80
Total compras:             $195
```

### **COSTO TOTAL: ~$210 USD**

**vs Diseño anterior (cuerpo impreso): $183**  
**Diferencia: +$27 (justificado por mejor transparencia)**

---

## 📋 PRÓXIMOS PASOS

### 1. Confirmar Diseño
```
□ Revisar ensamblaje en OpenSCAD
□ Verificar que entiendes el sistema
□ Decidir si usas este diseño o anterior
```

### 2. Conseguir Cilindro
```
□ Buscar proveedores locales de acrílico
□ Solicitar cotización tubo Ø73×Ø63×300mm
□ Alternativa: Buscar online (ePlastics, etc.)
□ Comprar cilindro (~$25)
```

### 3. Imprimir Componentes
```
□ Esperar a tener cilindro físico
□ Medir dimensiones reales
□ Ajustar modelos si es necesario
□ Imprimir 7 piezas (35h total)
```

### 4. Perforar Cilindro
```
□ Marcar posiciones P1 (50mm) y P2 (250mm)
□ Perforar con broca Ø5mm
□ Instalar insertos 1/8" NPT
□ Limpiar virutas
```

### 5. Ensamblar
```
□ Seguir secuencia de ensamblaje
□ Instalar O-rings
□ Apretar en patrón estrella
□ Verificar hermeticidad
```

---

**¿Procedemos con este diseño Rev.H (cilindro comprado) o prefieres el Rev.G (todo impreso)?**

Ventajas Rev.H:
- ✅ Mejor transparencia
- ✅ No requiere impresora Z grande
- ✅ Cilindro más resistente

Ventajas Rev.G:
- ✅ TODO impreso (más accesible)
- ✅ No depende de proveedores
- ✅ Menos componentes

**¿Cuál prefieres?** 🤔
