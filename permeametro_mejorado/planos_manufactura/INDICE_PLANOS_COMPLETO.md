# ÍNDICE COMPLETO DE PLANOS TÉCNICOS

## Permeámetro de Columna - Versión Impresión 3D FDM

**Proyecto:** PRM-2026-001-3DP  
**Fecha:** 12 de Enero de 2026  
**Revisión:** F (Impresión 3D)  
**Estado:** ✅ Completo y listo para fabricación

---

## 📐 PLANOS GENERALES DE ENSAMBLAJE

### Plano 1: Ensamblaje Completo (ASM-001 Rev.F)
**Archivo:** `plano_ensamblaje_final.png`  
**Formato:** A1 Horizontal  
**Escala:** 1:2 (detalles como indicado)

**Contenido:**
- ✅ Vista frontal completa
- ✅ Corte transversal A-A
- ✅ Vista superior (patrón de pernos)
- ✅ Detalle B: Canal O-ring (escala 5:1)
- ✅ Detalle C: Ensamblaje de perno (escala 2:1)
- ✅ Detalle D: Puerto de presión (escala 2:1)

**Dimensiones principales mostradas:**
- Altura total: 350mm
- Sistema de 4 puertos (entrada, salida, P1, P2)
- Sistema de 2 bridas + 8 pernos M6×30mm
- Presión operativa: 2 bar máx

**Para:** Comprensión general del sistema ensamblado

---

### Plano 2: Vista Explosionada Completa (ASM-002 Rev.F)
**Archivo:** `plano_despiece_final.png`  
**Formato:** A1 Horizontal  
**Escala:** 1:3

**Contenido:**
- ✅ Despiece vertical de todos los componentes (17 items)
- ✅ Componentes impresos 3D destacados (izquierda)
  - Tapa: 180g, 14h
  - Brida: 60g, 4h
  - Difusor: 15g, 2h
  - Base: 150g, 12h
- ✅ Hardware y plomería (derecha)
- ✅ BOM completo en tabla
- ✅ Secuencia de ensamblaje (10 pasos)

**Información clave:**
- Total material PETG: 405g (~$14)
- Tiempo total impresión: 32 horas
- Tiempo ensamblaje: 2-3 horas

**Para:** Identificación de componentes y orden de ensamblaje

---

## 🔍 PLANOS DE DETALLES DE INGENIERÍA

### Plano 3: Detalles de Sellado y Bridas (DET-001 Rev.A)
**Archivo:** `detalles_sellado.png`  
**Formato:** A2 Horizontal  
**Escalas:** Múltiples (indicadas en cada detalle)

**Contenido:**
- ✅ Detalle 1: Ranura junta tórica (escala 10:1)
  - Ancho: 6.0±0.1mm
  - Profundidad: 2.5±0.05mm
  - Radio esquinas: R0.5mm
  - Compresión O-ring: 25%
  
- ✅ Detalle 2: Ensamblaje de perno (escala 3:1)
  - Perno M6×30mm a través de ambas bridas
  - Tuerca y arandela
  - Par de apriete: 5 Nm
  
- ✅ Detalle 3: Patrón de pernos brida (vista superior)
  - 8 posiciones en PCD 95mm
  - Secuencia de apriete: 1→5→3→7→2→6→4→8
  - Espaciamiento angular: 45°

**Especificaciones de impresión incluidas:**
- Material: PETG
- Boquilla: 0.4mm
- Altura capa: 0.2mm
- Temperatura: 240°C (nozzle), 75°C (cama)

**Para:** Fabricación precisa del sistema de sellado

---

### Plano 4: Detalles de Puertos y Difusor (DET-002 Rev.A)
**Archivo:** `detalles_puertos.png`  
**Formato:** A2 Horizontal  
**Escalas:** Múltiples (3:1, 5:1)

**Contenido:**
- ✅ Detalle A: Puerto de entrada superior (escala 3:1)
  - Inserto 1/4" NPT en tapa
  - Conexión a difusor
  - Dirección de flujo
  
- ✅ Detalle B: Puerto de presión (escala 5:1)
  - Inserto 1/8" NPT en pared de columna
  - Penetración 3mm flush con interior
  - Sellado con cinta PTFE
  
- ✅ Detalle C: Puerto de salida en base (escala 3:1)
  - Puerto lateral 1/4" NPT
  - Altura 5mm sobre piso de cámara
  - Ángulo 15° descendente
  
- ✅ Detalle D: Patrón de perforaciones del difusor
  - Centro: Ø8mm
  - Anillo 1: 6× Ø2mm @ R8mm (60°)
  - Anillo 2: 12× Ø2mm @ R16mm (30°)
  - Anillo 3: 18× Ø2mm @ R24mm (20°)
  - Total: 37 perforaciones de flujo + 4 montaje

**Sistema de 4 puertos especificado:**
- Entrada: Centro tapa (1/4" NPT)
- Salida: Lateral base (1/4" NPT)
- Medición P1: 50mm (1/8" NPT)
- Medición P2: 250mm (1/8" NPT)

**Para:** Instalación correcta de puertos y fabricación del difusor

---

### Plano 5: Guía de Configuración de Impresión 3D (PRINT-001 Rev.A)
**Archivo:** `plano_impresion_3d.png`  
**Formato:** A2 Horizontal  
**Escala:** Ilustrativa

**Contenido:**
- ✅ Orientación de impresión para cada componente:
  
  **Tapa Superior:**
  - Orientación: Boca abajo (brida en cama)
  - Soportes: SÍ (árbol, en canal O-ring)
  - Parámetros: 0.15mm layer, 5 walls, 50% infill
  - Adhesión: Brim 8mm
  - Post-proceso: Lijar superficie de sellado con grano 600
  
  **Brida Inferior:**
  - Orientación: Plana en cama
  - Soportes: NO
  - Parámetros: 0.2mm layer, 4 walls, 40% infill
  - Adhesión: Brim 5mm
  
  **Difusor:**
  - Orientación: Plano horizontal
  - Soportes: SÍ (opcional, bajo perforaciones)
  - Parámetros: 0.1mm layer (alta calidad), 3 walls, 30% infill
  - Alternativa: Imprimir sólido, perforar manualmente Ø2mm
  
  **Base:**
  - Orientación: Boca abajo (patas arriba)
  - Soportes: SÍ (árbol, en cámara interior)
  - Parámetros: 0.2mm layer, 5 walls, 50% infill
  - Adhesión: Brim 8mm

**Tabla de parámetros completos incluida**

**Especificaciones de material:**
- Material: PETG
- Temperatura nozzle: 240°C
- Temperatura cama: 80°C
- Velocidad: 40-50mm/s
- Enfriamiento: 30-50%
- Total material: 405g (~$14 USD)
- Tiempo total: 32 horas

**Para:** Configuración correcta de slicer (Cura, PrusaSlicer, etc.)

---

## 📊 RESUMEN DE PLANOS

| # | Código | Nombre | Formato | Función |
|---|--------|---------|---------|---------|
| 1 | ASM-001 Rev.F | Ensamblaje Completo | A1 | Vista general + detalles |
| 2 | ASM-002 Rev.F | Despiece Completo | A1 | BOM + secuencia |
| 3 | DET-001 Rev.A | Detalles Sellado y Bridas | A2 | Sistema de sujeción |
| 4 | DET-002 Rev.A | Detalles Puertos y Difusor | A2 | Sistema de flujo |
| 5 | PRINT-001 Rev.A | Guía Impresión 3D | A2 | Configuración FDM |

**Total: 5 planos técnicos profesionales**

---

## 🎯 USO RECOMENDADO DE LOS PLANOS

### Para Fabricación (Impresión 3D):
1. **Leer primero:** Plano 5 (PRINT-001) - Configuración de impresión
2. **Referencia durante impresión:** Plano 5 - Orientaciones y parámetros
3. **Post-procesamiento:** Plano 3 (DET-001) - Dimensiones críticas a verificar

### Para Compra de Componentes:
1. **Lista de compras:** Plano 2 (ASM-002) - BOM completo
2. **Especificaciones:** Planos 3 y 4 - Detalles de hardware

### Para Ensamblaje:
1. **Secuencia general:** Plano 2 (ASM-002) - 10 pasos
2. **Detalles de montaje:** Plano 3 (DET-001) - Sistema de pernos
3. **Instalación de puertos:** Plano 4 (DET-002) - Cada puerto

### Para Comprensión del Sistema:
1. **Vista general:** Plano 1 (ASM-001) - Ensamblaje completo
2. **Funcionamiento:** Plano 4 (DET-002) - Sistema de flujo

### Para Presentación Académica:
- **Plano 1:** Diagrama general del sistema
- **Plano 2:** Despiece y componentes
- **Planos 3-4:** Detalles técnicos de innovaciones

---

## 📝 NOTAS IMPORTANTES

### Escalas de los Planos:
- **Vistas generales:** 1:2 o 1:3
- **Detalles críticos:** 3:1, 5:1, 10:1 (según detalle)
- **Guía impresión:** Ilustrativa (no a escala)

### Unidades:
- **Todas las dimensiones en milímetros (mm)**
- **Torques en Newton-metro (Nm)**
- **Presiones en bar**
- **Temperaturas en °C**

### Tolerancias Generales:
- Dimensiones lineales: ±0.5mm (impresión 3D)
- Dimensiones críticas: Según indicado en plano
- Agujeros de pernos: +0.5mm (holgura)
- Canal O-ring: 6.0±0.1mm × 2.5±0.05mm (CRÍTICO)

### Material de Fabricación:
- **Componentes impresos:** PETG (filamento FDM)
- **Tubo principal:** Acrílico o PVC transparente (comprado comercial)
- **O-ring:** Viton FKM 70 Shore A
- **Insertos/fittings:** Latón o acero inoxidable

---

## 🔄 HISTORIAL DE REVISIONES

| Rev. | Fecha | Cambios | Aprobado |
|------|-------|---------|----------|
| A | 12-ENE-2026 | Emisión inicial (mecanizado CNC) | - |
| B | 12-ENE-2026 | Sistema medición optimizado (5→2 puertos) | - |
| C | 12-ENE-2026 | Sistema de puertos flujo agregado | - |
| D | 12-ENE-2026 | Sistema completo 4 puertos | - |
| E | 12-ENE-2026 | Correcciones sistema bridas | - |
| **F** | **12-ENE-2026** | **Adaptación a impresión 3D FDM** | **ACTUAL** |

---

## 📦 ARCHIVOS RELACIONADOS

### Modelos 3D (OpenSCAD → STL):
- `01_tapa_superior.scad` → `tapa_superior.stl`
- `02_brida_inferior.scad` → `brida_inferior.stl`
- `03_difusor_entrada.scad` → `difusor.stl`
- `04_base_inferior.scad` → `base_inferior.stl`

### Documentación Técnica:
- `GUIA_IMPRESION_3D.md` - Guía detallada de impresión
- `SISTEMA_PUERTOS_COMPLETO.md` - Sistema de 4 puertos
- `ACLARACION_SISTEMA_BRIDAS.md` - Sistema de 2 bridas
- `05_ENSAMBLAJE.md` - Procedimiento de ensamblaje
- `RESUMEN_FINAL.md` - Resumen ejecutivo del proyecto

### Hojas Técnicas de Componentes:
- `HOJA_TECNICA_TAPA_SUPERIOR.md`
- `HOJA_TECNICA_BRIDA_INFERIOR.md`
- `HOJA_TECNICA_DIFUSOR.md`
- `HOJA_TECNICA_BASE_INFERIOR.md`
- `HOJA_TECNICA_INSTRUMENTACION.md`

---

## ✅ CHECKLIST DE FABRICACIÓN

### Antes de Imprimir:
- [ ] Exportar todos los STL desde OpenSCAD
- [ ] Verificar modelos en slicer (sin errores)
- [ ] Configurar parámetros según Plano 5
- [ ] Verificar material PETG suficiente (>0.5kg)
- [ ] Calibrar impresora (nivel de cama, E-steps)

### Durante Impresión:
- [ ] Seguir orientaciones del Plano 5
- [ ] Usar soportes según indicado
- [ ] Aplicar brim para adhesión
- [ ] Monitorear primeras capas

### Post-Impresión:
- [ ] Remover soportes cuidadosamente
- [ ] Lijar superficie de sellado tapa (Plano 3)
- [ ] Limpiar perforaciones difusor (Plano 4)
- [ ] Verificar dimensiones críticas (Plano 3)
- [ ] Repasar agujeros si es necesario

### Ensamblaje:
- [ ] Seguir secuencia Plano 2
- [ ] Instalar puertos según Plano 4
- [ ] Aplicar patrón de apriete Plano 3
- [ ] Torque final: 5 Nm

---

**Proyecto:** Permeámetro de Columna - Versión Impresión 3D  
**Estado:** ✅ Planos completos y listos para fabricación  
**Costo estimado:** $148-223 USD  
**Tiempo fabricación:** 7-10 días  
**Nivel técnico:** Intermedio (requiere impresora 3D calibrada)

---

**Los 5 planos técnicos están generados y listos para usar.** 🎉

¿Necesitas alguna modificación o plano adicional específico?
