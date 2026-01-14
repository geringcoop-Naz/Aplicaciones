# ÍNDICE DE HOJAS TÉCNICAS Y PLANOS DE MANUFACTURA

## Permeámetro de Columna con Sistema de Sellado Mejorado

**Proyecto:** PRM-2026-001  
**Fecha:** 2026-01-12  
**Revisión:** A  
**Estado:** Completo - Listo para Manufactura

---

## 📋 DOCUMENTOS DE MANUFACTURA DISPONIBLES

### HOJAS DE DATOS TÉCNICOS (Especificaciones Completas)

| Código | Documento | Componente | Páginas | Estado |
|--------|-----------|-----------|---------|--------|
| PRM-001 | [HOJA_TECNICA_TAPA_SUPERIOR.md](HOJA_TECNICA_TAPA_SUPERIOR.md) | Tapa con Brida y Canal O-ring | 1 | ✅ Completo |
| PRM-002 | [HOJA_TECNICA_BRIDA_INFERIOR.md](HOJA_TECNICA_BRIDA_INFERIOR.md) | Brida de Sujeción al Cuerpo | 1 | ✅ Completo |
| PRM-007 | [HOJA_TECNICA_DIFUSOR.md](HOJA_TECNICA_DIFUSOR.md) | Difusor Perforado de Entrada | 1 | ✅ Completo |
| PRM-008 | [HOJA_TECNICA_BASE_INFERIOR.md](HOJA_TECNICA_BASE_INFERIOR.md) | Base con Cámara Sedimentación | 1 | ✅ Completo |

---

## 🎨 MODELOS 3D PARAMÉTRICOS (OpenSCAD)

| Archivo | Componente | Exportable a | Estado |
|---------|-----------|--------------|--------|
| [00_ensamblaje_completo.scad](../modelos_3d/00_ensamblaje_completo.scad) | Vista ensamblada completa | STL, DXF | ✅ Listo |
| [01_tapa_superior.scad](../modelos_3d/01_tapa_superior.scad) | Tapa con brida | STL, DXF | ✅ Listo |
| [02_brida_inferior.scad](../modelos_3d/02_brida_inferior.scad) | Brida de cuerpo | STL, DXF | ✅ Listo |
| [03_difusor_entrada.scad](../modelos_3d/03_difusor_entrada.scad) | Difusor perforado | STL, DXF | ✅ Listo |
| [04_base_inferior.scad](../modelos_3d/04_base_inferior.scad) | Base con patas | STL, DXF | ✅ Listo |

---

## 📐 PLANOS 2D (Para Generar)

### Planos Requeridos para Manufactura

| Componente | Vista de Planta | Corte Transversal | Vista Isométrica | Prioridad |
|------------|-----------------|-------------------|------------------|-----------|
| **Tapa Superior** | ✅ Requerido | ✅ Requerido (canal O-ring) | Opcional | **ALTA** |
| **Brida Inferior** | ✅ Requerido | Opcional | Opcional | MEDIA |
| **Difusor** | ✅ Requerido (patrón perf.) | Opcional | Opcional | MEDIA |
| **Base Inferior** | ✅ Requerido | ✅ Requerido (cámara) | Opcional | MEDIA |

### Generación de Planos

**Método 1 - Automático (Requiere OpenSCAD):**
```batch
cd modelos_3d
generar_planos.bat
```
Genera todos los archivos DXF y STL automáticamente.

**Método 2 - Manual:**
1. Instalar OpenSCAD: https://openscad.org/
2. Abrir cada archivo .scad
3. Presionar F6 (render)
4. File > Export > Export as DXF (2D) o STL (3D)

**Método 3 - En Línea:**
- Usar servicio de conversión online
- Subir archivos .scad
- Descargar DXF/STL

---

## 📦 PAQUETE COMPLETO PARA EL FABRICANTE

### Documentos a Entregar al Taller de Mecanizado

#### Paquete Mínimo (Esencial):
- [ ] Hoja técnica: TAPA_SUPERIOR (PRM-001) ⭐ **PRIORITARIA**
- [ ] Hoja técnica: BRIDA_INFERIOR (PRM-002)
- [ ] Hoja técnica: DIFUSOR (PRM-007)
- [ ] Hoja técnica: BASE_INFERIOR (PRM-008)
- [ ] Lista de materiales: `../06_LISTA_MATERIALES.md`

#### Paquete Completo (Recomendado):
- [ ] Todo el paquete mínimo
- [ ] Archivos DXF (planos 2D) de cada componente
- [ ] Archivos STL (modelos 3D) si aplica
- [ ] Documento de ensamblaje: `../05_ENSAMBLAJE.md`
- [ ] Especificaciones de sellado: `../02_SISTEMA_SELLADO.md`

---

## 🔑 DIMENSIONES CRÍTICAS - RESUMEN

### Tapa Superior (PRM-001)
```
CRÍTICO - Canal para O-ring:
- Ancho: 6.0mm ± 0.1mm
- Profundidad: 2.5mm ± 0.05mm
- Radio esquinas: R 0.5mm mínimo
- Planicidad superficie: < 0.05mm
- Acabado: Ra < 1.6 μm
```

### Brida Inferior (PRM-002)
```
CRÍTICO - Alineación con tapa:
- PCD pernos: 95.0mm ± 0.2mm
- DEBE usar misma plantilla que tapa
- Ø interior: 73.5mm (ajuste en tubo)
```

### Difusor (PRM-007)
```
CRÍTICO - Patrón de perforaciones:
- 37 perforaciones total (1 central + 36)
- Ø perforaciones: 2.0mm ± 0.1mm
- Distribución en 3 anillos concéntricos
- Sin rebabas (obstruyen flujo)
```

### Base Inferior (PRM-008)
```
CRÍTICO - Nivelación:
- Planicidad cara superior: < 0.1mm
- PCD patas: 85mm ± 0.5mm
- 3 patas a 120° (estabilidad tripodal)
```

---

## 🛠️ MATERIALES ESPECIFICADOS

| Componente | Material Principal | Alternativas | Espesor/Dim. |
|------------|-------------------|--------------|--------------|
| Tapa Superior | Acrílico Cast PMMA | PVC, Policarbonato | 15mm |
| Brida Inferior | Acrílico Cast PMMA | PVC | 8mm |
| Difusor | Acero Inox 316L | HDPE | 2mm |
| Base Inferior | Acrílico Cast PMMA | PVC, Policarbonato | 10mm |

**Nota:** Acrílico cast (colado) es superior al extruido para tolerancias dimensionales.

---

## 📊 PROCESO DE FABRICACIÓN - SECUENCIA

### Orden Recomendado de Fabricación:

**1. Componentes Mecanizados (Taller de plásticos)**
```
Semanas 1-2:
1. Tapa superior (componente más crítico)
2. Brida inferior (usar misma plantilla que tapa)
3. Base inferior
```

**2. Componentes de Corte (Taller de metal)**
```
Semana 2:
4. Difusor perforado (corte láser en acero inox)
```

**3. Ensamblaje Preliminar**
```
Semana 3:
5. Pegar brida a cuerpo de columna
6. Instalar insertos roscados
7. Montar patas en base
```

**4. Ensamblaje Final**
```
Semana 3-4:
8. Instalar difusor en tapa
9. Pruebas de ajuste
10. Instalación de o-rings
11. Pruebas de sellado
```

---

## ✅ CHECKLIST DE VERIFICACIÓN PRE-MANUFACTURA

### Antes de Enviar a Fabricar

**Documentación:**
- [ ] Hojas técnicas revisadas
- [ ] Dimensiones verificadas vs. equipo actual
- [ ] Tolerancias críticas resaltadas
- [ ] Material especificado claramente

**Archivos Digitales:**
- [ ] Archivos .scad disponibles
- [ ] Planos DXF generados (o procedimiento claro)
- [ ] Archivos STL si se requieren

**Especificaciones:**
- [ ] Acabado superficial especificado
- [ ] Tolerancias críticas documentadas
- [ ] Proceso de mecanizado sugerido
- [ ] Plantilla de perforaciones definida

**Cotización:**
- [ ] Lista de componentes clara
- [ ] Cantidades especificadas (1 de cada)
- [ ] Incluye instalación de insertos
- [ ] Incluye pegado de brida (si aplica)

---

## 💰 ESTIMADO DE COSTOS DE MANUFACTURA

### Mecanizado de Componentes (Referencia)

| Componente | Complejidad | Tiempo Est. | Costo Est. (USD) |
|------------|-------------|-------------|------------------|
| Tapa Superior | Alta (canal O-ring) | 3-4 horas | $60-100 |
| Brida Inferior | Media | 1-2 horas | $20-30 |
| Base Inferior | Media | 2-3 horas | $40-60 |
| Difusor (láser) | Baja | 0.5 hora | $15-25 |
| **SUBTOTAL Mecanizado** | | **6-9 horas** | **$135-215** |

**Más:**
- Material (acrílico, acero): $40-60
- Insertos roscados: $10-15
- Patas niveladoras: $15-25
- **TOTAL ESTIMADO:** $200-315 USD

*Precios variables según país y proveedor*

---

## 📞 CONTACTO CON FABRICANTES - PLANTILLA

### Email de Solicitud de Cotización

```
Asunto: Cotización - Mecanizado de Componentes para Permeámetro

Estimado [Nombre del Taller],

Solicito cotización para mecanizado de 4 componentes en plástico/metal
según especificaciones técnicas adjuntas.

COMPONENTES:
1. Tapa superior con brida - Acrílico cast 15mm (1 pieza)
2. Brida inferior - Acrílico cast 8mm (1 pieza)
3. Base inferior - Acrílico cast 10mm (1 pieza)
4. Difusor perforado - Acero inox 316L 2mm (1 pieza)

ARCHIVOS ADJUNTOS:
- Hojas de datos técnicos (4 archivos PDF/MD)
- Archivos DXF para CNC (si disponibles)
- Lista de materiales completa

PUNTOS CRÍTICOS:
- Canal para O-ring en tapa: tolerancia ±0.1mm (ver plano)
- Superficie de sellado pulida (Ra < 1.6μm)
- Plantilla común para tapa y brida (PCD 95mm)
- Material: Acrílico CAST (no extruido)

Por favor incluir en cotización:
- Costo por componente (detallado)
- Costo de material incluido/separado
- Instalación de insertos roscados
- Tiempo de entrega
- Forma de pago
- Garantía dimensional

¿Es posible una visita para revisar especificaciones técnicas?

Adjunto documentación técnica completa.

Quedo atento a su respuesta.

Saludos,
[Su Nombre]
[Teléfono]
[Email]
```

---

## 🎓 CAPACITACIÓN/SOPORTE AL FABRICANTE

### Consultas Técnicas Frecuentes

**P: ¿Qué es "acrílico cast" vs "extruido"?**
R: Cast es colado en moldes (mayor calidad, mejor tolerancia dimensional).
   Extruido es procesado continuo (menor costo, menor precisión).
   ESPECIFICAR: Cast para este proyecto.

**P: ¿Cómo verifico el canal del O-ring?**
R: Usar calibrador de profundidad (2.5mm) y calibrador de ancho interior (6mm).
   Crítico: radio en esquinas R0.5mm mínimo.

**P: ¿Qué es PCD?**
R: Pitch Circle Diameter - diámetro del círculo que pasa por el centro
   de las perforaciones de los pernos (95mm en este caso).

**P: ¿Puedo simplificar el difusor?**
R: El patrón de 37 perforaciones es óptimo, pero puede reducirse a
   ~25 perforaciones si es muy complejo.

**P: ¿Material alternativo más económico?**
R: PVC puede sustituir todo el acrílico, exceptoplanos si se requiere transparencia.

---

## 📚 DOCUMENTACIÓN DE REFERENCIA

### Archivos del Proyecto

**Raíz del proyecto:**
```
permeametro_mejorado/
├── README.md
├── RESUMEN_EJECUTIVO.md
├── GUIA_INICIO_RAPIDO.md
├── INSTRUCCIONES_PLANOS.md ⭐
├── 01_TAPA_SUPERIOR.md
├── 02_SISTEMA_SELLADO.md
├── 03_CUERPO_COLUMNA.md
├── 04_CONEXIONES.md
├── 05_ENSAMBLAJE.md
├── 06_LISTA_MATERIALES.md
├── modelos_3d/ (archivos .scad)
└── planos_manufactura/ (este directorio)
    ├── INDICE_PLANOS.md (este archivo)
    ├── HOJA_TECNICA_TAPA_SUPERIOR.md
    ├── HOJA_TECNICA_BRIDA_INFERIOR.md
    ├── HOJA_TECNICA_DIFUSOR.md
    └── HOJA_TECNICA_BASE_INFERIOR.md
```

### Navegación Rápida

| Necesito... | Ver archivo... |
|-------------|----------------|
| Comenzar rápido | `../GUIA_INICIO_RAPIDO.md` |
| Entender el proyecto | `../RESUMEN_EJECUTIVO.md` |
| Generar planos DXF | `../INSTRUCCIONES_PLANOS.md` |
| Especificaciones tapa | `HOJA_TECNICA_TAPA_SUPERIOR.md` |
| Lista de compras | `../06_LISTA_MATERIALES.md` |
| Cómo ensamblar | `../05_ENSAMBLAJE.md` |
| Modelos 3D | `../modelos_3d/*.scad` |

---

## 🔄 CONTROL DE REVISIONES

| Rev. | Fecha | Componente | Cambio | Aprobado |
|------|-------|-----------|--------|----------|
| A | 2026-01-12 | Todos | Emisión inicial | - |

### Próximas Revisiones Esperadas

Cuando corresponda:
- Rev. B: Tras primer prototipo (ajustes dimensionales)
- Rev. C: Tras validación funcional (optimizaciones)

---

## ✅ ESTADO DEL PROYECTO

### Completitud de Documentación

| Categoría | Progreso | Estado |
|-----------|----------|---------|
| Modelos 3D | 5/5 | ✅ 100% Completo |
| Hojas Técnicas | 4/4 | ✅ 100% Completo |
| Planos DXF | Por generar | ⚠️ Pendiente (requiere OpenSCAD) |
| Documentación diseño | 6/6 | ✅ 100% Completo |
| Instrucciones ensamblaje | 1/1 | ✅ 100% Completo |
| Lista de materiales | 1/1 | ✅ 100% Completo |

**ESTADO GENERAL: ✅ LISTO PARA MANUFACTURA**

### Aprobaciones Requeridas

- [ ] Revisión técnica de hojas (ingeniero)
- [ ] Verificación de dimensiones vs. equipo actual
- [ ] Aprobación de presupuesto
- [ ] Selección de fabricante
- [ ] Orden de compra emitida

---

## 📅 CRONOGRAMA SUGERIDO

```
Semana 1:     Cotizaciones y selección de fabricante
Semana 2-3:   Fabricación de componentes
Semana 4:     Ensamblaje y pruebas preliminares
Semana 5:     Validación funcional
Semana 6-7:   Ajustes y operación normal
```

---

## 🎯 PRÓXIMOS PASOS

### Acciones Inmediatas

1. **[ ] Generar planos DXF** (seguir INSTRUCCIONES_PLANOS.md)
2. **[ ] Medir permeámetro actual** con precisión
3. **[ ] Ajustar dimensiones** en archivos .scad si es necesario
4. **[ ] Preparar paquete** para fabricante
5. **[ ] Solicitar cotizaciones** a 2-3 talleres
6. **[ ] Aprobar presupuesto** y ordenar fabricación

---

**Documento:** Índice de Hojas Técnicas y Planos  
**Código:** PRM-INDEX-Rev.A  
**Página:** 1 de 1  
**Proyecto:** Permeámetro con Sistema de Sellado Mejorado  
**Fecha:** 2026-01-12
