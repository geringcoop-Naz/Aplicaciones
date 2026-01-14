# ⚡ HOJA DE REFERENCIA RÁPIDA - IMPRESIÓN PERMEÁMETRO

## 🎯 PARÁMETROS RÁPIDOS

### Material: PETG
```
Nozzle:  240°C
Cama:    80°C
Fan:     35-40%
Speed:   40-45 mm/s
```

---

## 📋 TABLA RÁPIDA POR PIEZA

| Pieza | Orient. | Layer | Walls | Infill | Support | Brim | Peso | Tiempo |
|-------|---------|-------|-------|--------|---------|------|------|--------|
| **Cuerpo** | ⬆️ Vertical | 0.2 | 5 | 45% | Mín | 10mm | 350g | 26h |
| **Tapa** | ⬇️ Boca abajo | 0.15 | 5 | 50% | ✅ Tree | 8mm | 120g | 11h |
| **Difusor** | ➡️ Plano | 0.1 | 3 | 30% | ❌ | 3mm | 15g | 2h |
| **Base** | ⬆️ Patas arriba | 0.2 | 5 | 50% | ✅ Tree | 8mm | 150g | 12h |

---

## 🔢 PERFIL CURA - COPIAR/PEGAR

```ini
[quality]
layer_height = 0.2
line_width = 0.4
wall_line_count = 5
top_layers = 6
bottom_layers = 6

[shell]
wall_thickness = 2.0
top_thickness = 1.2
bottom_thickness = 1.2

[infill]
infill_sparse_density = 50
infill_pattern = grid

[material]
material_print_temperature = 240
material_bed_temperature = 80
material_flow = 100

[speed]
speed_print = 45
speed_wall = 40
speed_travel = 120
speed_layer_0 = 20

[cooling]
cool_fan_enabled = True
cool_fan_speed = 40
cool_fan_speed_0 = 0

[support]
support_enable = False  # Cambiar por pieza
support_type = tree
support_z_distance = 0.2

[platform_adhesion]
adhesion_type = brim
brim_width = 8
```

---

## ⚠️ PUNTOS CRÍTICOS

### ✅ ANTES de Imprimir

```
□ Cama nivelada < 24h
□ Nozzle limpio
□ Filamento seco (PETG absorbe humedad)
□ Cama limpia (IPA)
□ Brim/Raft configurado
□ Preview verificado
```

### 🔴 DURANTE Impresión

```
PRIMERAS 10 CAPAS:
→ Monitorear cada 15 min
→ Brim debe adherir 100%
→ Sin warping

CADA 4-6 HORAS:
→ Filamento fluyendo ok
→ Sin enredos
→ Temp estable

SI FALLA:
→ Detener inmediatamente
→ No dejar terminar pieza mala
→ Ajustar y reiniciar
```

---

## 🛠️ AJUSTES RÁPIDOS

### Problema: No Adhiere
```
✓ Subir temp cama +5°C → 85°C
✓ Aplicar glue stick
✓ Usar raft en lugar de brim
✓ Reducir speed layer_0 a 15mm/s
```

### Problema: Warping Esquinas
```
✓ Aumentar brim a 15mm
✓ Cerrar enclosure
✓ Eliminar corrientes aire
✓ Usar draft shield
```

### Problema: Stringing
```
✓ Retraction distance: 5mm
✓ Retraction speed: 45mm/s
✓ Combing: Within Infill
✓ Reducir temp -5°C
```

### Problema: Soportes Difíciles Quitar
```
✓ Support Z-distance: 0.25mm
✓ Support density: 15%
✓ Support pattern: Grid
```

---

## 📦 ORDEN DE IMPRESIÓN

### Semana 1
```
DÍA 1-2:
  ☐ Difusor (2h) → Validar config
  ☐ Tapa macho (11h) → Pieza crítica
  
DÍA 3-4:
  ☐ Base (12h)
```

### Semana 2
```
DÍA 5-7:
  ☐ Cuerpo (26h) → REQUIERE Z≥320mm
  
  Alternativa Z pequeña:
  ☐ Cuerpo parte 1 (13h)
  ☐ Cuerpo parte 2 (13h)
  ☐ Pegar ambas secciones
```

---

## 🧪 POST-PROCESO RÁPIDO

```
1. ESPERAR 10 min en cama caliente
2. Enfriar a 40°C
3. Remover con espátula
4. Quitar brim/soportes
5. Limpiar agujeros con broca
6. Lijar superficies críticas:
   - Tapa: cara sellado (600 grit)
   - Cuerpo: cara brida (400 grit)
7. Limpiar con IPA
```

---

## 📏 VERIFICACIÓN DIMENSIONAL

```
Con calibrador medir:

Cuerpo:
  ✓ Ø interior: 63.0 ±0.5mm
  ✓ PCD pernos: 95.0 ±0.5mm
  
Tapa:
  ✓ Ø plug: 62.0 ±0.5mm
  ✓ PCD pernos: 95.0 ±0.5mm
  
Fit test:
  ✓ Plug entra con resistencia leve
  ✓ Agujeros pernos alineados
```

---

## 💾 ARCHIVOS G-CODE SUGERIDOS

```
Nombres claros:
→ permeametro_cuerpo_PETG240_v1.gcode
→ permeametro_tapa_PETG240_v1.gcode
→ permeametro_difusor_PETG240_v1.gcode
→ permeametro_base_PETG240_v1.gcode

Guardar en carpeta:
/sdcard/permeametro/
```

---

## 🚨 EMERGENCIAS

### Impresión Despegándose
```
1. PAUSAR inmediatamente
2. Esperar enfriar 5 min
3. Aplicar glue stick alrededor
4. Reanudar
5. Monitorear siguiente hora
```

### Extrusión Inconsistente
```
1. Verificar tensión extrusor
2. Limpiar nozzle (cold pull)
3. Verificar temp real con termómetro
4. Secar filamento (horno 50°C 4h)
```

### Clogged Nozzle
```
1. Calentar a 250°C
2. Cold pull con filamento limpiador
3. O desmontar y limpiar con aguja
4. Reinstalar
```

---

## ✅ CHECKLIST IMPRESIÓN

### Pre-Start
```
□ STL sliced correctamente
□ Material suficiente (verificar peso)
□ SD card con espacio
□ G-code verificado en preview
□ Cama limpia
□ Filament dry and loaded
```

### Post-Print
```
□ Pieza enfriada completamente
□ Soportes removidos
□ Dimensiones verificadas
□ Agujeros limpios
□ Superficies críticas lijadas
□ Listo para ensamblar ✓
```

---

## 📞 AYUDA RÁPIDA

**Si tienes problemas:**
1. Revisar: `GUIA_CONFIGURACION_SLICER.md`
2. Consultar: `GUIA_IMPRESION_3D.md`
3. Buscar error específico online
4. Foros: r/3Dprinting, Prusa forums

---

**RECUERDA:** 
- Mejor imprimir LENTO y bien que rápido y mal
- 40mm/s es perfecto para PETG
- Paciencia = buenos resultados 🎯

**¡Buena impresión!** 🖨️✨
