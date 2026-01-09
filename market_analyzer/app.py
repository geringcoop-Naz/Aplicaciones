import streamlit as st
import yfinance as yf
import pandas as pd
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import numpy as np
from datetime import datetime, timedelta
import technical_indicators as ti

# Page configuration
st.set_page_config(
    page_title="Market Analyzer Pro",
    page_icon="📈",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Custom CSS for premium design
st.markdown("""
<style>
    .main-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        padding: 30px;
        border-radius: 15px;
        color: white;
        text-align: center;
        margin-bottom: 30px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    }
    .metric-card {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        padding: 20px;
        border-radius: 12px;
        border-left: 5px solid #667eea;
        margin: 10px 0;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    .positive {
        color: #10b981;
        font-weight: bold;
    }
    .negative {
        color: #ef4444;
        font-weight: bold;
    }
    .info-box {
        background: #f0f9ff;
        border-left: 4px solid #3b82f6;
        padding: 15px;
        border-radius: 8px;
        margin: 15px 0;
    }
    .stTabs [data-baseweb="tab-list"] {
        gap: 8px;
    }
    .stTabs [data-baseweb="tab"] {
        background-color: #f1f5f9;
        border-radius: 8px;
        padding: 10px 20px;
        font-weight: 600;
    }
    .stTabs [aria-selected="true"] {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
    }
</style>
""", unsafe_allow_html=True)

# Header
st.markdown("""
<div class="main-header">
    <h1>📈 Market Analyzer Pro</h1>
    <p style="font-size: 18px;">Análisis en Tiempo Real y Datos Históricos de Mercados Financieros</p>
</div>
""", unsafe_allow_html=True)

# Sidebar configuration
st.sidebar.header("⚙️ Configuración")

# Popular stocks by category
STOCK_CATEGORIES = {
    "🇺🇸 Tech Giants": ["AAPL", "MSFT", "GOOGL", "AMZN", "META", "NVDA", "TSLA"],
    "📊 Índices Principales": ["^GSPC", "^DJI", "^IXIC", "^RUT"],
    "💎 Criptomonedas": ["BTC-USD", "ETH-USD", "BNB-USD", "ADA-USD"],
    "🏦 Sector Financiero": ["JPM", "BAC", "GS", "WFC", "C"],
    "⚡ Energía": ["XOM", "CVX", "COP", "EOG"],
    "🏥 Salud": ["JNJ", "PFE", "UNH", "MRNA", "ABT"],
    "🛒 Consumo": ["WMT", "COST", "NKE", "MCD", "SBUX"],
    "🇲🇽 Acciones Mexicanas": ["AMXL.MX", "WALMEX.MX", "GFNORTEO.MX", "CEMEXCPO.MX", "ALSEA.MX"]
}

# Category selection
selected_category = st.sidebar.selectbox(
    "Seleccionar Categoría",
    list(STOCK_CATEGORIES.keys())
)

# Stock selection
default_stocks = STOCK_CATEGORIES[selected_category][:3]
selected_stocks = st.sidebar.multiselect(
    "Seleccionar Activos",
    STOCK_CATEGORIES[selected_category],
    default=default_stocks,
    help="Puedes seleccionar múltiples activos para comparar"
)

# Allow custom ticker
custom_ticker = st.sidebar.text_input(
    "O ingresa un símbolo personalizado",
    placeholder="Ejemplo: AAPL, TSLA, BTC-USD",
    help="Ingresa el símbolo del ticker de Yahoo Finance"
)

if custom_ticker:
    selected_stocks = [custom_ticker.upper()]

# Time range selection
time_ranges = {
    "1 Día": "1d",
    "5 Días": "5d",
    "1 Mes": "1mo",
    "3 Meses": "3mo",
    "6 Meses": "6mo",
    "1 Año": "1y",
    "2 Años": "2y",
    "5 Años": "5y",
    "Máximo": "max"
}

selected_range = st.sidebar.selectbox(
    "Período de Tiempo",
    list(time_ranges.keys()),
    index=6  # Default to 1 year
)

# Interval selection
interval_options = {
    "1 Minuto": "1m",
    "5 Minutos": "5m",
    "15 Minutos": "15m",
    "30 Minutos": "30m",
    "1 Hora": "1h",
    "1 Día": "1d",
    "1 Semana": "1wk",
    "1 Mes": "1mo"
}

# Adjust interval options based on period
if selected_range in ["1 Día", "5 Días"]:
    default_interval = "5 Minutos"
else:
    default_interval = "1 Día"

selected_interval = st.sidebar.selectbox(
    "Intervalo",
    list(interval_options.keys()),
    index=list(interval_options.keys()).index(default_interval)
)

# Technical indicators selection
st.sidebar.subheader("📊 Indicadores Técnicos")
show_sma = st.sidebar.checkbox("SMA (Media Móvil Simple)", value=True)
sma_periods = st.sidebar.multiselect(
    "Períodos SMA",
    [20, 50, 100, 200],
    default=[50, 200]
) if show_sma else []

show_ema = st.sidebar.checkbox("EMA (Media Móvil Exponencial)")
ema_periods = st.sidebar.multiselect(
    "Períodos EMA",
    [12, 26, 50],
    default=[12, 26]
) if show_ema else []

show_bollinger = st.sidebar.checkbox("Bandas de Bollinger")
show_rsi = st.sidebar.checkbox("RSI (Índice de Fuerza Relativa)", value=True)
show_macd = st.sidebar.checkbox("MACD", value=True)
show_volume = st.sidebar.checkbox("Volumen", value=True)

# Refresh button
if st.sidebar.button("🔄 Actualizar Datos", type="primary"):
    st.rerun()

# Display last update time
st.sidebar.markdown("---")
st.sidebar.info(f"**Última actualización:**\n{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")

# Main content
if not selected_stocks:
    st.warning("⚠️ Por favor selecciona al menos un activo para analizar.")
    st.stop()

# Create tabs
tab_overview, tab_charts, tab_comparison, tab_technical, tab_info = st.tabs([
    "📊 Vista General",
    "📈 Gráficos",
    "🔄 Comparación",
    "🔍 Análisis Técnico",
    "ℹ️ Información"
])

# Fetch data for all selected stocks
@st.cache_data(ttl=60)  # Cache for 1 minute
def fetch_stock_data(ticker, period, interval):
    try:
        stock = yf.Ticker(ticker)
        hist = stock.history(period=period, interval=interval)
        info = stock.info
        return hist, info, None
    except Exception as e:
        return None, None, str(e)

# Load data
stock_data = {}
stock_info = {}
for ticker in selected_stocks:
    with st.spinner(f"Cargando datos de {ticker}..."):
        hist, info, error = fetch_stock_data(ticker, time_ranges[selected_range], interval_options[selected_interval])
        if error:
            st.error(f"Error cargando {ticker}: {error}")
        else:
            stock_data[ticker] = hist
            stock_info[ticker] = info

if not stock_data:
    st.error("No se pudieron cargar los datos. Por favor verifica los símbolos e intenta nuevamente.")
    st.stop()

# TAB 1: Overview
with tab_overview:
    st.header("📊 Resumen de Mercado")
    
    # Create metric cards for each stock
    cols = st.columns(min(len(selected_stocks), 3))
    
    for idx, ticker in enumerate(selected_stocks):
        if ticker not in stock_data or stock_data[ticker].empty:
            continue
            
        col_idx = idx % 3
        with cols[col_idx]:
            data = stock_data[ticker]
            info = stock_info.get(ticker, {})
            
            current_price = data['Close'].iloc[-1]
            previous_price = data['Close'].iloc[0]
            change = current_price - previous_price
            change_pct = (change / previous_price) * 100
            
            # Display metrics
            st.markdown(f"### {ticker}")
            st.metric(
                label=info.get('shortName', ticker),
                value=f"${current_price:.2f}",
                delta=f"{change:+.2f} ({change_pct:+.2f}%)"
            )
            
            # Additional info
            col1, col2 = st.columns(2)
            with col1:
                st.caption(f"**Máximo:** ${data['High'].max():.2f}")
                st.caption(f"**Mínimo:** ${data['Low'].min():.2f}")
            with col2:
                st.caption(f"**Volumen:** {data['Volume'].iloc[-1]:,.0f}")
                if 'marketCap' in info:
                    market_cap = info['marketCap'] / 1e9
                    st.caption(f"**Cap. Mercado:** ${market_cap:.2f}B")
            
            # Mini chart
            fig_mini = go.Figure()
            fig_mini.add_trace(go.Scatter(
                x=data.index,
                y=data['Close'],
                mode='lines',
                name=ticker,
                line=dict(color='#667eea', width=2),
                fill='tozeroy',
                fillcolor='rgba(102, 126, 234, 0.2)'
            ))
            fig_mini.update_layout(
                height=200,
                margin=dict(l=0, r=0, t=0, b=0),
                xaxis=dict(showgrid=False, showticklabels=False),
                yaxis=dict(showgrid=True, gridcolor='rgba(0,0,0,0.1)'),
                showlegend=False,
                plot_bgcolor='rgba(0,0,0,0)',
                paper_bgcolor='rgba(0,0,0,0)'
            )
            st.plotly_chart(fig_mini, use_container_width=True)
    
    # Market summary table
    st.markdown("---")
    st.subheader("📋 Tabla de Resumen")
    
    summary_data = []
    for ticker in selected_stocks:
        if ticker not in stock_data or stock_data[ticker].empty:
            continue
        data = stock_data[ticker]
        info = stock_info.get(ticker, {})
        
        current_price = data['Close'].iloc[-1]
        previous_price = data['Close'].iloc[0]
        change_pct = ((current_price - previous_price) / previous_price) * 100
        
        summary_data.append({
            'Símbolo': ticker,
            'Nombre': info.get('shortName', ticker),
            'Precio Actual': f"${current_price:.2f}",
            'Cambio %': f"{change_pct:+.2f}%",
            'Máximo': f"${data['High'].max():.2f}",
            'Mínimo': f"${data['Low'].min():.2f}",
            'Volumen': f"{data['Volume'].iloc[-1]:,.0f}"
        })
    
    if summary_data:
        df_summary = pd.DataFrame(summary_data)
        st.dataframe(df_summary, use_container_width=True, hide_index=True)

# TAB 2: Charts
with tab_charts:
    st.header("📈 Gráficos Interactivos")
    
    for ticker in selected_stocks:
        if ticker not in stock_data or stock_data[ticker].empty:
            continue
        
        st.subheader(f"📊 {ticker}")
        data = stock_data[ticker]
        
        # Create subplots
        rows = 1
        row_heights = [0.7]
        subplot_titles = [f'{ticker} - Precio']
        
        if show_volume:
            rows += 1
            row_heights.append(0.15)
            subplot_titles.append('Volumen')
        
        if show_rsi:
            rows += 1
            row_heights.append(0.15)
            subplot_titles.append('RSI')
        
        fig = make_subplots(
            rows=rows, cols=1,
            shared_xaxes=True,
            vertical_spacing=0.05,
            row_heights=row_heights,
            subplot_titles=subplot_titles
        )
        
        # Candlestick chart
        fig.add_trace(
            go.Candlestick(
                x=data.index,
                open=data['Open'],
                high=data['High'],
                low=data['Low'],
                close=data['Close'],
                name=ticker,
                increasing_line_color='#10b981',
                decreasing_line_color='#ef4444'
            ),
            row=1, col=1
        )
        
        # Add SMAs
        for period in sma_periods:
            sma = ti.calculate_sma(data['Close'], period)
            fig.add_trace(
                go.Scatter(
                    x=data.index,
                    y=sma,
                    mode='lines',
                    name=f'SMA {period}',
                    line=dict(width=2)
                ),
                row=1, col=1
            )
        
        # Add EMAs
        for period in ema_periods:
            ema = ti.calculate_ema(data['Close'], period)
            fig.add_trace(
                go.Scatter(
                    x=data.index,
                    y=ema,
                    mode='lines',
                    name=f'EMA {period}',
                    line=dict(width=2, dash='dash')
                ),
                row=1, col=1
            )
        
        # Add Bollinger Bands
        if show_bollinger:
            upper, middle, lower = ti.calculate_bollinger_bands(data['Close'])
            fig.add_trace(
                go.Scatter(
                    x=data.index,
                    y=upper,
                    mode='lines',
                    name='BB Superior',
                    line=dict(color='rgba(102, 126, 234, 0.5)', width=1)
                ),
                row=1, col=1
            )
            fig.add_trace(
                go.Scatter(
                    x=data.index,
                    y=lower,
                    mode='lines',
                    name='BB Inferior',
                    line=dict(color='rgba(102, 126, 234, 0.5)', width=1),
                    fill='tonexty',
                    fillcolor='rgba(102, 126, 234, 0.1)'
                ),
                row=1, col=1
            )
        
        current_row = 1
        
        # Volume
        if show_volume:
            current_row += 1
            colors = ['#10b981' if data['Close'].iloc[i] >= data['Open'].iloc[i] else '#ef4444' 
                     for i in range(len(data))]
            fig.add_trace(
                go.Bar(
                    x=data.index,
                    y=data['Volume'],
                    name='Volumen',
                    marker_color=colors,
                    showlegend=False
                ),
                row=current_row, col=1
            )
        
        # RSI
        if show_rsi:
            current_row += 1
            rsi = ti.calculate_rsi(data['Close'])
            fig.add_trace(
                go.Scatter(
                    x=data.index,
                    y=rsi,
                    mode='lines',
                    name='RSI',
                    line=dict(color='#8b5cf6', width=2)
                ),
                row=current_row, col=1
            )
            # Add RSI threshold lines
            fig.add_hline(y=70, line=dict(color='red', dash='dash', width=1), row=current_row, col=1)
            fig.add_hline(y=30, line=dict(color='green', dash='dash', width=1), row=current_row, col=1)
        
        # Update layout
        fig.update_layout(
            height=600 if rows == 1 else 700,
            xaxis_rangeslider_visible=False,
            showlegend=True,
            legend=dict(
                orientation="h",
                yanchor="bottom",
                y=1.02,
                xanchor="right",
                x=1
            ),
            hovermode='x unified',
            plot_bgcolor='rgba(0,0,0,0)',
            paper_bgcolor='rgba(0,0,0,0)'
        )
        
        fig.update_xaxes(showgrid=True, gridcolor='rgba(0,0,0,0.1)')
        fig.update_yaxes(showgrid=True, gridcolor='rgba(0,0,0,0.1)')
        
        st.plotly_chart(fig, use_container_width=True)
        
        st.markdown("---")

# TAB 3: Comparison
with tab_comparison:
    st.header("🔄 Comparación de Activos")
    
    if len(selected_stocks) < 2:
        st.info("Selecciona al menos 2 activos para comparar.")
    else:
        # Normalize prices to compare
        st.subheader("📊 Rendimiento Comparativo (Normalizado)")
        
        fig_comp = go.Figure()
        
        for ticker in selected_stocks:
            if ticker not in stock_data or stock_data[ticker].empty:
                continue
            data = stock_data[ticker]
            normalized = (data['Close'] / data['Close'].iloc[0]) * 100
            
            fig_comp.add_trace(
                go.Scatter(
                    x=data.index,
                    y=normalized,
                    mode='lines',
                    name=ticker,
                    line=dict(width=3)
                )
            )
        
        fig_comp.update_layout(
            height=500,
            xaxis_title="Fecha",
            yaxis_title="Rendimiento Normalizado (%)",
            hovermode='x unified',
            showlegend=True,
            legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="right", x=1),
            plot_bgcolor='rgba(0,0,0,0)',
            paper_bgcolor='rgba(0,0,0,0)'
        )
        
        fig_comp.update_xaxes(showgrid=True, gridcolor='rgba(0,0,0,0.1)')
        fig_comp.update_yaxes(showgrid=True, gridcolor='rgba(0,0,0,0.1)')
        
        st.plotly_chart(fig_comp, use_container_width=True)
        
        # Performance table
        st.subheader("📈 Tabla de Rendimiento")
        
        perf_data = []
        for ticker in selected_stocks:
            if ticker not in stock_data or stock_data[ticker].empty:
                continue
            data = stock_data[ticker]
            
            returns = ((data['Close'].iloc[-1] - data['Close'].iloc[0]) / data['Close'].iloc[0]) * 100
            volatility = data['Close'].pct_change().std() * np.sqrt(252) * 100  # Annualized
            
            perf_data.append({
                'Activo': ticker,
                'Rendimiento %': f"{returns:+.2f}%",
                'Volatilidad Anual %': f"{volatility:.2f}%",
                'Máximo': f"${data['High'].max():.2f}",
                'Mínimo': f"${data['Low'].min():.2f}",
                'Volumen Promedio': f"{data['Volume'].mean():,.0f}"
            })
        
        if perf_data:
            df_perf = pd.DataFrame(perf_data)
            st.dataframe(df_perf, use_container_width=True, hide_index=True)

# TAB 4: Technical Analysis
with tab_technical:
    st.header("🔍 Análisis Técnico Detallado")
    
    for ticker in selected_stocks:
        if ticker not in stock_data or stock_data[ticker].empty:
            continue
        
        st.subheader(f"📊 {ticker}")
        data = stock_data[ticker]
        
        col1, col2, col3 = st.columns(3)
        
        with col1:
            st.markdown("#### Medias Móviles")
            for period in [20, 50, 200]:
                sma = ti.calculate_sma(data['Close'], period)
                current_price = data['Close'].iloc[-1]
                sma_value = sma.iloc[-1]
                diff = ((current_price - sma_value) / sma_value) * 100
                
                status = "🟢" if current_price > sma_value else "🔴"
                st.write(f"{status} **SMA {period}:** ${sma_value:.2f} ({diff:+.2f}%)")
        
        with col2:
            st.markdown("#### Indicadores de Momentum")
            
            # RSI
            rsi = ti.calculate_rsi(data['Close'])
            rsi_value = rsi.iloc[-1]
            if rsi_value > 70:
                rsi_signal = "🔴 Sobrecomprado"
            elif rsi_value < 30:
                rsi_signal = "🟢 Sobrevendido"
            else:
                rsi_signal = "🟡 Neutral"
            st.write(f"**RSI (14):** {rsi_value:.2f} - {rsi_signal}")
            
            # MACD
            if show_macd:
                macd, signal, hist = ti.calculate_macd(data['Close'])
                macd_signal = "🟢 Alcista" if hist.iloc[-1] > 0 else "🔴 Bajista"
                st.write(f"**MACD:** {macd_signal}")
                st.write(f"  MACD: {macd.iloc[-1]:.2f}")
                st.write(f"  Señal: {signal.iloc[-1]:.2f}")
        
        with col3:
            st.markdown("#### Volatilidad")
            
            # Daily change
            daily_change = data['Close'].pct_change().iloc[-1] * 100
            st.write(f"**Cambio Diario:** {daily_change:+.2f}%")
            
            # Volatility
            volatility = data['Close'].pct_change().std() * np.sqrt(252) * 100
            st.write(f"**Volatilidad Anual:** {volatility:.2f}%")
            
            # ATR (Average True Range)
            atr = ti.calculate_atr(data)
            st.write(f"**ATR (14):** ${atr.iloc[-1]:.2f}")
        
        # MACD Chart
        if show_macd:
            st.markdown("#### MACD")
            macd, signal, hist = ti.calculate_macd(data['Close'])
            
            fig_macd = make_subplots(
                rows=2, cols=1,
                row_heights=[0.7, 0.3],
                shared_xaxes=True,
                vertical_spacing=0.05,
                subplot_titles=['MACD', 'Histograma']
            )
            
            fig_macd.add_trace(
                go.Scatter(x=data.index, y=macd, mode='lines', name='MACD',
                          line=dict(color='#3b82f6', width=2)),
                row=1, col=1
            )
            fig_macd.add_trace(
                go.Scatter(x=data.index, y=signal, mode='lines', name='Señal',
                          line=dict(color='#ef4444', width=2)),
                row=1, col=1
            )
            
            colors = ['#10b981' if val >= 0 else '#ef4444' for val in hist]
            fig_macd.add_trace(
                go.Bar(x=data.index, y=hist, name='Histograma',
                      marker_color=colors),
                row=2, col=1
            )
            
            fig_macd.update_layout(
                height=400,
                showlegend=True,
                hovermode='x unified',
                plot_bgcolor='rgba(0,0,0,0)',
                paper_bgcolor='rgba(0,0,0,0)'
            )
            
            st.plotly_chart(fig_macd, use_container_width=True)
        
        st.markdown("---")

# TAB 5: Information
with tab_info:
    st.header("ℹ️ Información Detallada")
    
    for ticker in selected_stocks:
        if ticker not in stock_info:
            continue
        
        info = stock_info[ticker]
        st.subheader(f"📋 {ticker} - {info.get('shortName', ticker)}")
        
        col1, col2 = st.columns(2)
        
        with col1:
            st.markdown("#### Información General")
            if 'longName' in info:
                st.write(f"**Nombre Completo:** {info['longName']}")
            if 'sector' in info:
                st.write(f"**Sector:** {info['sector']}")
            if 'industry' in info:
                st.write(f"**Industria:** {info['industry']}")
            if 'country' in info:
                st.write(f"**País:** {info['country']}")
            if 'website' in info:
                st.write(f"**Sitio Web:** {info['website']}")
        
        with col2:
            st.markdown("#### Métricas Financieras")
            if 'marketCap' in info:
                st.write(f"**Capitalización:** ${info['marketCap']:,.0f}")
            if 'trailingPE' in info:
                st.write(f"**P/E Ratio:** {info['trailingPE']:.2f}")
            if 'dividendYield' in info and info['dividendYield']:
                st.write(f"**Dividendo:** {info['dividendYield']*100:.2f}%")
            if 'beta' in info:
                st.write(f"**Beta:** {info['beta']:.2f}")
            if '52WeekHigh' in info:
                st.write(f"**Máximo 52 sem:** ${info['52WeekHigh']:.2f}")
            if '52WeekLow' in info:
                st.write(f"**Mínimo 52 sem:** ${info['52WeekLow']:.2f}")
        
        # Description
        if 'longBusinessSummary' in info:
            with st.expander("📄 Descripción del Negocio"):
                st.write(info['longBusinessSummary'])
        
        st.markdown("---")

# Footer
st.markdown("---")
st.markdown("""
<div style="text-align: center; color: #6b7280; padding: 20px;">
    <p><strong>Market Analyzer Pro</strong> - Análisis Profesional de Mercados Financieros</p>
    <p style="font-size: 12px;">Datos proporcionados por Yahoo Finance. Los datos pueden tener un retraso. 
    Esta herramienta es solo para fines informativos y educativos, no constituye asesoramiento financiero.</p>
</div>
""", unsafe_allow_html=True)
