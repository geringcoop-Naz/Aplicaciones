# 📈 Market Analyzer Pro

## Plataforma Profesional de Análisis de Mercados Financieros

**Market Analyzer Pro** es una aplicación avanzada para análisis de mercados bursátiles que proporciona datos históricos y en tiempo real, gráficos interactivos, indicadores técnicos y herramientas de comparación para múltiples activos financieros.

![Market Analyzer Pro](https://img.shields.io/badge/Version-1.0-blue) ![Python](https://img.shields.io/badge/Python-3.8+-green) ![Streamlit](https://img.shields.io/badge/Streamlit-1.30+-red)

## ✨ Características Principales

### 📊 Datos en Tiempo Real
- Actualización automática de precios y datos de mercado
- Soporte para acciones, índices, ETFs y criptomonedas
- Datos de Yahoo Finance con alta precisión
- Intervalos personalizables desde 1 minuto hasta 1 mes

### 📈 Gráficos Interactivos
- **Gráficos de velas (Candlestick)** profesionales
- Zoom, pan y selección de rango temporal
- Múltiples indicadores técnicos superpuestos
- Visualización de volumen sincronizada

### 🔍 Indicadores Técnicos Avanzados
#### Medias Móviles
- **SMA** (Simple Moving Average) - 20, 50, 100, 200 períodos
- **EMA** (Exponential Moving Average) - 12, 26, 50 períodos
- **Bandas de Bollinger** - Identificación de volatilidad

#### Indicadores de Momentum
- **RSI** (Relative Strength Index) - Sobrecompra/sobreventa
- **MACD** (Moving Average Convergence Divergence)
- **Stochastic Oscillator**
- **Williams %R**

#### Volatilidad
- **ATR** (Average True Range)
- **Bollinger Bands**
- Volatilidad anualizada

#### Volumen
- **OBV** (On-Balance Volume)
- Análisis de volumen por operación

### 🔄 Comparación Multi-Activo
- Comparación normalizada de rendimiento
- Tabla de métricas comparativas
- Análisis de correlación
- Volatilidad relativa

### ℹ️ Información Detallada
- Datos fundamentales de la empresa
- Sector e industria
- Ratios financieros (P/E, Beta, Dividendos)
- Capitalización de mercado
- Máximos y mínimos de 52 semanas

## 🚀 Instalación

### Requisitos Previos
- Python 3.8 o superior
- pip (gestor de paquetes de Python)

### Pasos de Instalación

1. **Clonar o descargar el repositorio**
```bash
cd market_analyzer
```

2. **Instalar dependencias**
```bash
pip install -r requirements.txt
```

3. **Ejecutar la aplicación**
```bash
streamlit run app.py
```

4. La aplicación se abrirá automáticamente en tu navegador en `http://localhost:8501`

## 📚 Uso de la Aplicación

### 1. Selección de Activos

#### Por Categoría
Selecciona una categoría predefinida:
- 🇺🇸 **Tech Giants**: Apple, Microsoft, Google, Amazon, Meta, NVIDIA, Tesla
- 📊 **Índices Principales**: S&P 500, Dow Jones, NASDAQ, Russell 2000
- 💎 **Criptomonedas**: Bitcoin, Ethereum, Binance Coin, Cardano
- 🏦 **Sector Financiero**: JPMorgan, Bank of America, Goldman Sachs
- ⚡ **Energía**: Exxon, Chevron, ConocoPhillips
- 🏥 **Salud**: Johnson & Johnson, Pfizer, UnitedHealth
- 🛒 **Consumo**: Walmart, Costco, Nike, McDonald's
- 🇲🇽 **Acciones Mexicanas**: América Móvil, Walmart México, Banorte, Cemex

#### Símbolo Personalizado
Ingresa cualquier símbolo de ticker de Yahoo Finance:
- Acciones: `AAPL`, `TSLA`, `GOOGL`
- ETFs: `SPY`, `QQQ`, `VOO`
- Criptomonedas: `BTC-USD`, `ETH-USD`
- Acciones internacionales: `BABA`, `TSM`, `NVDA`

### 2. Configuración de Tiempo

**Períodos Disponibles:**
- 1 Día, 5 Días
- 1 Mes, 3 Meses, 6 Meses
- 1 Año, 2 Años, 5 Años
- Máximo disponible

**Intervalos:**
- Intradía: 1m, 5m, 15m, 30m, 1h
- Diario: 1d
- Semanal: 1wk
- Mensual: 1mo

### 3. Indicadores Técnicos

Activa o desactiva indicadores desde la barra lateral:
- ✓ **SMA**: Selecciona múltiples períodos (20, 50, 100, 200)
- ✓ **EMA**: Períodos 12, 26, 50
- ✓ **Bandas de Bollinger**: Visualiza volatilidad
- ✓ **RSI**: Identifica condiciones de sobrecompra/sobreventa
- ✓ **MACD**: Análisis de tendencias y momentum
- ✓ **Volumen**: Análisis de liquidez

### 4. Navegación por Pestañas

#### 📊 Vista General
- Tarjeta resumen para cada activo
- Precio actual y cambio porcentual
- Máximos, mínimos y volumen
- Mini gráfico de tendencia
- Tabla comparativa de todos los activos

#### 📈 Gráficos
- Gráficos de velas interactivos
- Indicadores técnicos superpuestos
- Panel de volumen (opcional)
- Panel de RSI (opcional)
- Controls de zoom y navegación

#### 🔄 Comparación
- Rendimiento normalizado para comparar múltiples activos
- Gráfico de rendimiento relativo
- Tabla de estadísticas comparativas
- Análisis de volatilidad

#### 🔍 Análisis Técnico
- Estado de medias móviles (SMA 20, 50, 200)
- Indicadores de momentum (RSI, MACD)
- Métricas de volatilidad (ATR, Volatilidad anual)
- Gráfico MACD detallado
- Señales de trading

#### ℹ️ Información
- Datos de la empresa/activo
- Sector e industria
- Métricas financieras clave
- Ratios de valoración
- Descripción del negocio

## 📊 Ejemplos de Uso

### Análisis de Acción Individual
```
1. Selecciona "Tech Giants"
2. Elige "AAPL"
3. Período: "1 Año"
4. Intervalo: "1 Día"
5. Activa: SMA 50, SMA 200, RSI, MACD
6. Navega a la pestaña "Gráficos"
```

### Comparación de Criptomonedas
```
1. Selecciona "Criptomonedas"
2. Selecciona múltiples: BTC-USD, ETH-USD, BNB-USD
3. Período: "6 Meses"
4. Ve a "Comparación" para ver rendimiento relativo
```

### Trading Intradía
```
1. Ingresa símbolo personalizado: "TSLA"
2. Período: "1 Día" o "5 Días"
3. Intervalo: "5 Minutos"
4. Activa EMA 12, EMA 26, RSI, Volumen
5. Analiza en tiempo real
```

## 🔧 Indicadores Técnicos - Interpretación

### RSI (Relative Strength Index)
- **> 70**: Zona de sobrecompra (posible corrección bajista)
- **< 30**: Zona de sobreventa (posible rebote alcista)
- **50**: Nivel neutral

### MACD
- **Cruce alcista**: Línea MACD cruza por encima de señal
- **Cruce bajista**: Línea MACD cruza por debajo de señal
- **Histograma positivo**: Momentum alcista
- **Histograma negativo**: Momentum bajista

### Bandas de Bollinger
- **Precio en banda superior**: Posible sobreventa
- **Precio en banda inferior**: Posible sobrecompra
- **Bandas estrechas**: Baja volatilidad (posible ruptura)
- **Bandas anchas**: Alta volatilidad

### Medias Móviles
- **Golden Cross**: SMA 50 cruza por encima de SMA 200 (señal alcista)
- **Death Cross**: SMA 50 cruza por debajo de SMA 200 (señal bajista)
- **Precio sobre SMA**: Tendencia alcista
- **Precio bajo SMA**: Tendencia bajista

## 📈 Símbolos Populares

### Acciones Americanas
- **Tech**: AAPL, MSFT, GOOGL, AMZN, META, NVDA, TSLA
- **Finanzas**: JPM, BAC, GS, WFC, C, MS
- **Salud**: JNJ, UNH, PFE, ABBV, TMO
- **Consumo**: WMT, HD, DIS, NKE, SBUX

### Índices
- **S&P 500**: ^GSPC
- **Dow Jones**: ^DJI
- **NASDAQ**: ^IXIC
- **Russell 2000**: ^RUT

### Criptomonedas
- **Bitcoin**: BTC-USD
- **Ethereum**: ETH-USD
- **Binance Coin**: BNB-USD
- **Cardano**: ADA-USD

### ETFs Populares
- **SPY**: S&P 500 ETF
- **QQQ**: NASDAQ 100 ETF
- **VOO**: Vanguard S&P 500 ETF
- **IWM**: Russell 2000 ETF

## ⚙️ Tecnologías Utilizadas

- **Streamlit**: Framework de aplicación web
- **yfinance**: API de datos financieros
- **Plotly**: Gráficos interactivos
- **Pandas**: Manipulación de datos
- **NumPy**: Cálculos numéricos

## 🎨 Características de Diseño

- Interfaz moderna y profesional
- Gradientes y colores premium
- Diseño responsive
- Gráficos interactivos de alta calidad
- Organización intuitiva con pestañas
- Tarjetas de métricas visuales
- Indicadores de estado con emojis

## ⚠️ Limitaciones y Consideraciones

1. **Datos de Yahoo Finance**: Los datos pueden tener un retraso de ~15 minutos para algunos mercados
2. **Intervalos cortos**: Los intervalos de 1m, 5m solo están disponibles para períodos cortos (últimos 60 días)
3. **Uso educativo**: Esta herramienta es para análisis y educación, no constituye asesoramiento financiero
4. **Rate Limits**: Yahoo Finance tiene límites de consulta, evita hacer demasiadas peticiones simultáneas

## 🔐 Privacidad y Seguridad

- No se almacenan datos personales
- No se requiere autenticación
- Todos los datos son públicos de Yahoo Finance
- Ejecución local en tu máquina

## 🚧 Mejoras Futuras

- [ ] Alertas de precio configurables
- [ ] Backtesting de estrategias
- [ ] Análisis de cartera
- [ ] Exportación de datos a Excel/CSV
- [ ] Más indicadores técnicos (Ichimoku, Fibonacci)
- [ ] Machine Learning para predicciones
- [ ] Noticias en tiempo real
- [ ] Análisis fundamental automático
- [ ] Comparación con benchmarks

## 📝 Notas

**Descargo de Responsabilidad**: Esta aplicación proporciona datos y análisis con fines educativos e informativos únicamente. No constituye asesoramiento de inversión. Las decisiones de inversión deben tomarse bajo tu propia responsabilidad y discreción. Consulta con un asesor financiero profesional antes de realizar inversiones.

---

**Desarrollado con ❤️ para traders e inversores**

*Versión: 1.0*  
*Última Actualización: Enero 2026*
