# 🎓 Asistente Inteligente para Maestría en Ciencias del Agua

## 🆕 NUEVAS FUNCIONALIDADES

### 📅 **Calendario Académico Interactivo**
- Visualización mensual completa
- Eventos color coded por tipo y urgencia
- Lista de "Actividades Próximas" con contadores de días
- Agregar/editar eventos personalizados
- Navegación prev/next mes

### 📊 **Gestión de Proyectos de Investigación**
- Seguimiento de múltiples proyectos simultáneos
- **Cronogramas por fases** (Gantt simplificado):
  - Diseño Conceptual
  - Desarrollo/Implementación
  - Pruebas y Validación
  - Fases completadas, activas y pendientes
- **Métricas de progreso**:
  - Porcentaje de avance general
  - Tareas completadas vs totales
  - Días restantes hasta deadline
- **Integración GitHub** (¡Novedad!)
  - Conexión con tu cuenta GitHub
  - Visualización de repositorios
  - Tracking de commits automático
  - Actualización de progreso basado en actividad Git

---

## 🚀 Características Principales (Actualizadas)

### 📚 **Gestión Académica**
- Seguimiento de progreso del programa (créditos, promedio)
- Visualización de materias actuales con calificaciones
- **NUEVO:** Calendario de entregas y exámenes
- Progreso visual por materia

### 🔬 **Centro de Investigación**
- Feed de publicaciones científicas recientes
- Filtros por área temática (Hidrología, Calidad del Agua, etc.)
- Enlaces a artículos completos
- Sistema de citaciones

### 💰 **Gestor Financiero**
- Balance mensual actualizado
- Seguimientode ingresos (beca CONACYT)
- Categorización de gastos:
  - **Gastos Fijos**: Renta, servicios, transporte
  - **Gastos Corrientes**: Alimentación, material, personal
- Cálculo automático de ahorro
- Gráfica de tendencias mensuales

### 📅 **Calendario Académico** ⭐ NUEVO
**Funcionalidades:**
- Vista de cuadrícula mensual completa
- Navegación entre meses (flechas prev/next)
- Eventos visuales con indicadores de color
- Lista de "Actividades Próximas" ordenada por fecha
- Agregar nuevas actividades con un clic

**Tipos de Eventos:**
- 🔴 Entregas urgentes (marcadas en rojo)
- 📝 Entregas regulares
- 📊 Exámenes
- 🎓 Clases especiales

**Interacción:**
```
Clic en el botón "Nueva Actividad"
→ Ingresar título, fecha y tipo
→ Evento automáticamente aparece en el calendario
→ Se guarda en localStorage (persistente)
```

### 📊 **Proyectos de Investigación** ⭐ NUEVO
**Panel de Control:**
- Tarjetas de proyecto individuales con toda la información
- Filtros: Todos / Activos / Completados
- Botón "Nuevo Proyecto" para agregar

**Información por Proyecto:**
- Título y descripción
- Categoría (Tesis, Proyecto Final, Materia)
- Fecha límite (deadline)
- Número de commits (si conectado a GitHub)
- **Progreso general** (barra visual + %)
- **Tareas completadas** (ej. 17/20)
- **Días restantes** (contador automático)

**Cronograma de Fases:**
```
✅ Fase Completada     (check verde)
⏳ Fase Activa         (spinner animado)
⚪ Fase Pendiente      (círculo gris)
```

Ejemplo visual del proyecto "Permeámetro 3D":
```
[✓] Diseño Conceptual
[✓] Modelado 3D
[⏳] Fabricación (actualmente)
[ ] Pruebas y Validación
```

### 🔗 **Integración con GitHub** ⭐ MEGA NOVEDAD

**Setup (Una sola vez):**
1. Clic en "Conectar GitHub"
2. Generar Personal Access Token en GitHub:
   ```
   GitHub → Settings → Developer settings → 
   Personal access tokens → Generate new token
   ```
3. Ingresar token y username
4. ¡Listo! La app automáticamente:
   - Lista tus repositorios
   - Actualiza contadores de commits
   - Sincroniza el progreso

**Datos que se obtienen:**
- Nombre del repositorio
- Número de commits totales
- Estrellas y forks
- Lenguaje principal
- Última actualización

**Cómo funciona:**
```javascript
Conexión → GitHub API
↓
Obtiene lista de repos
↓
Match con tus proyectos (por nombre)
↓
Actualiza # commits y progreso
↓
Datos se actualizan cada vez que navegas a Proyectos
```

---

## 📋 Cómo Usar las Nuevas Funcionalidades

### Calendario

#### Agregar un Evento
```
1. Clic en "Calendario" en el sidebar
2. Clic en "Nueva Actividad"
3. Ingresar:
   - Título (ej. "Examen Parcial - Hidrología")
   - Fecha (DD/MM/YYYY)
   - Tipo (entrega/examen/clase)
4. El evento aparece automáticamente
```

#### Ver Eventos de un Día
```
Clic en cualquier día del calendario
→ Muestra pop-up con actividades de ese día
→ Opción de agregar si está vacío
```

#### Navegar Meses
```
← Flecha izquierda: Mes anterior
→ Flecha derecha: Mes siguiente
```

### Proyectos

#### Agregar un Proyecto
```
1. Clic en "Proyectos"
2. Clic en "+ Nuevo Proyecto"
3. Ingresar:
   - Nombre
   - Descripción
   - Deadline
   - (Opcional) Repo de GitHub asociado
```

#### Filtrar Proyectos
```
Todos → Ver todos
Activos → Solo proyectos en curso
Completados → Solo finalizados
```

#### Conectar GitHub
```
1. Clic en "Conectar GitHub"
2. Panel lateral se abre
3. Ingresar:
   - Personal Access Token
   - Username de GitHub
4. Clic en "Guardar"
5. ¡Automáticamente sincroniza!
```

#### Ver Detalles de Proyecto
Cada tarjeta muestra:
- **Badge de Estado**: Activo (azul) / Completado (verde)
- **Metadata**: Categoría, Deadline, # Commits
- **Progreso**: Barra visual + porcentaje
- **Tareas**: X/Y tareas completadas
- **Cronograma**: Fases del proyecto con estado

---

## 🎨 Personalización

### Colores de Estado
```css
Proyecto Activo:    #3b82f6 (azul)
Proyecto Completado: #10b981 (verde)
Fase Activa:        #667eea (púrpura)
Evento Urgente:     #ef4444 (rojo)
```

### Agregar Tus Propias Fases de Proyecto
Edita `calendar-projects.js`:
```javascript
const phases = [
    'Tu Fase 1',
    'Tu Fase 2',
    'Tu Fase 3'
];
```

---

## 💾 Almacenamiento de Datos

### LocalStorage
La aplicación guarda automáticamente:
- ✅ Eventos del calendario
- ✅ Proyectos y su progreso
- ✅ Credenciales de GitHub (encriptadas)
- ✅ Preferencias de usuario

### Backup Manual
```javascript
// En la consola del navegador:
const backup = {
    calendar: localStorage.getItem('calendarEvents'),
    projects: localStorage.getItem('projects'),
    github: localStorage.getItem('githubUsername')
};
console.log(JSON.stringify(backup));
// Copiar y guardar el output
```

---

## 🔮 Próximas Mejoras Planificadas

### Corto Plazo
- [ ] Exportar calendario a Google Calendar / iCal
- [ ] Notificaciones push para deadlines
- [ ] Sincronización bidireccional con GitHub (crear issues desde la app)
- [ ] Drag & drop para reordenar fases de proyectos
- [ ] Vista Gantt completa para cronogramas

### Mediano Plazo
- [ ] Modo colaborativo (compartir proyectos con equipo)
- [ ] Integración con Overleaf (para LaTeX de tesis)
- [ ] Dashboard de actividad GitHub (contributions graph)
- [ ] Métricas de productividad (pomodoros, tiempo dedicado)
- [ ] Integración con Mendeley/Zotero para referencias

### Largo Plazo
- [ ] App móvil (React Native)
- [ ] Asistente IA para sugerencias académicas
- [ ] Integración con sistemas universitarios
- [ ] Modo offline completo (PWA)

---

## 📂 Estructura de Archivos

```
asistente_maestria/
├── index.html                 # Estructura principal
├── styles.css                 # Estilos base
├── calendar-projects.css      # Estilos calendario/proyectos
├── script.js                  # Lógica core (académico, finanzas)
├── calendar-projects.js       # Lógica calendario/proyectos/GitHub
└── README.md                  # Este archivo
```

---

## 🛠️ Tecnologías Utilizadas

- **HTML5**: Estructura semántica
- **CSS3**: Diseño moderno con gradientes y animaciones
- **JavaScript (Vanilla)**: Lógica e interactividad
- **LocalStorage API**: Persistencia de datos
- **GitHub API**: Integración de repositorios
- **Font Awesome**: Iconografía
- **Google Fonts (Inter)**: Tipografía premium

---

## 🔧 Configuración Avanzada

### Variables de Entorno (LocalStorage)
```javascript
// Configurar manualmente en la consola:
localStorage.setItem('githubToken', 'tu_token_aquí');
localStorage.setItem('githubUsername', 'tu_usuario');
```

### Personalizar GitHub API
Editar en `calendar-projects.js`:
```javascript
// Cambiar endpoint o agregar más datos
const response = await fetch(
    `https://api.github.com/users/${username}/repos`,
    { headers: { ... } }
);
```

---

## 🎯 Casos de Uso Reales

### Scenario 1: Gestión de Tesis
```
1. Crear proyecto "Tesis de Maestría"
2. Agregar fases:
   - Revisión bibliográfica
   - Metodología
   - Trabajo de campo
   - Análisis de datos
   - Redacción
3. Conectar repo de GitHub con LaTeX
4. El # de commits se actualiza automáticamente
5. Puedes ver exactamente cuánto has avanzado
```

### Scenario 2: Múltiples Proyectos Paralelos
```
Tesis (85% - Activo)
Proyecto Final Materia A (60% - Activo)
Proyecto Final Materia B (100% - Completado)

Filtrar por "Activos" para enfocarte
Ver deadlines en calendario
Priorizar según días restantes
```

### Scenario 3: Preparación de Exámenes
```
Agregar en calendario:
- Fecha de examen
- Fechas de estudio (eventos personalizados)
- Entregas previas

Vista semanal te muestra claramente:
"Tengo 3 entregas y 1 examen esta semana"
```

---

## 📝 Notas Importantes

### GitHub Personal Access Token
**Permisos necesarios:**
- ✅ `repo` (acceso a repositorios)
- ✅ `read:user` (leer información de usuario)

**Seguridad:**
- Los tokens se guardan en localStorage (solo en tu navegador)
- Nunca se envían a servidores externos
- Usa tokens con permisos mínimos necesarios

### Limitaciones Conocidas
- GitHub API tiene límite de 60 requests/hora sin autenticación
- Con token: 5000 requests/hora
- Los eventos del calendario NO se sincronizan con Google Calendar (por ahora)

---

## 🤝 Contribuciones y Soporte

Este es un proyecto personal para uso académico durante la maestría.

**Sugerencias de mejora:**
1. Agregar issue describiendo la funcionalidad
2. Fork el proyecto
3. Implementar mejora
4. Pull request con descripción

---

## 📄 Licencia

Uso personal - Maestría en Ciencias del Agua 2026

---

**Desarrollado con ❤️ para estudiantes de posgrado**

## 🎓💧 ¡Éxito en tu maestría!

---

## 📸 Screenshots

### Dashboard Principal
`dashboard_asistente_maestria.png`

### Calendario Académico
`asistente_calendario.png`

### Proyectos de Investigación
`asistente_proyectos.png`

---

**Última actualización:** 13 de Enero de 2026  
**Versión:** 2.0.0 (Calendar & Projects Update)
