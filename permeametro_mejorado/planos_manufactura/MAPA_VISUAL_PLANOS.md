# 🗺️ MAPA VISUAL DE PLANOS TÉCNICOS - REV.I

Este documento describe el contenido técnico de los planos generados (imágenes PNG) para el diseño final del permeámetro (Rev.I).

## 1. Plano de Ensamblaje General (ASM-001 Rev.I)
**Archivo:** `plano_ensamblaje_rev_i.png`

**Propósito:** Visión global del equipo terminado y validación de dimensiones principales.

*   **Vista Frontal (Izquierda):** Muestra el equipo completo sobre su base. Se aprecian las bridas robustas superior e inferior unidas por pernos, y la ubicación de las boquillas de instrumentación P1 y P2 en el cuerpo del cilindro.
*   **Vista de Sección A-A (Derecha):** **CRÍTICA.** Muestra el corte longitudinal.
    *   **Pared Gruesa:** Se observa el espesor sólido de 12.7mm (1/2") del cilindro, marcado con un patrón de sombreado (hatching).
    *   **Inserción Tapa Macho:** Se ve claramente cómo el "plug" de la tapa entra en el cilindro.
    *   **Sistema de Sellado:** Muestra la ubicación de los O-rings sellando radialmente contra la pared interna.

## 2. Vista Explosionada (ASM-002 Rev.I)
**Archivo:** `plano_despiece_rev_i.png`

**Propósito:** Guía de ensamblaje paso a paso e identificación de componentes.

*   **Secuencia Vertical:** Muestra el orden lógico de montaje desde abajo hacia arriba.
*   **Componentes Clave:**
    *   Base de Soporte (Pieza Inferior).
    *   Tapa Macho Inferior + O-ring + Difusor.
    *   Cilindro Principal Bridado (Núcleo).
    *   Difusor + O-ring + Tapa Macho Superior.
    *   Boquilla de Entrada Superior.
*   **Hardware:** Muestra la disposición de los pernos y tuercas en las bridas.

## 3. Detalles de Manufactura (DET-001 Rev.I)
**Archivo:** `detalles_manufactura_rev_i.png`

**Propósito:** Verificación dimensional para la impresión 3D.

*   **Detalle Cilindro:** Corte transversal mostrando el diámetro interno (ID Ø63mm) y externo (OD Ø88.4mm), confirmando la pared de 1/2".
*   **Detalle Tapa Macho:** Zoom al perfil del "plug", mostrando las dimensiones de la ranura del O-ring (5mm ancho x 2mm profundidad), crítica para un buen sellado.
*   **Patrón de Pernos:** Vista superior de la brida mostrando la distribución de los 8 agujeros.

## 4. Ingeniería de Detalle (DET-002 Rev.I)
**Archivo:** `detalles_ingenieria_rev_i.png`

**Propósito:** Especificación de interfaces críticas y sellado.

*   **Detalle A (Unión Brida):** Muestra el "sandwich" de sellado:
    1.  Sellado Radial: O-ring comprimido por el plug.
    2.  Sellado Axial: Junta plana ("Sello Mecánico") entre las caras de las bridas.
*   **Detalle B (Difusor):** Muestra cómo el disco difusor se asienta en el interior, protegido por la tapa.
*   **Detalle C (Puerto):** Muestra la rosca 1/8" NPT realizada directamente en la pared gruesa del cilindro para recibir la boquilla de latón.

---

**Nota de Fabricación:** Utilice estos planos visuales junto con los modelos STL generados para garantizar que la impresión y el post-procesado (roscado de agujeros, limpieza de ranuras) cumplan con las tolerancias requeridas.
