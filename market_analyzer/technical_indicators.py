import pandas as pd
import numpy as np

def calculate_sma(data, period):
    """Calculate Simple Moving Average"""
    return data.rolling(window=period).mean()

def calculate_ema(data, period):
    """Calculate Exponential Moving Average"""
    return data.ewm(span=period, adjust=False).mean()

def calculate_rsi(data, period=14):
    """Calculate Relative Strength Index"""
    delta = data.diff()
    gain = (delta.where(delta > 0, 0)).rolling(window=period).mean()
    loss = (-delta.where(delta < 0, 0)).rolling(window=period).mean()
    
    rs = gain / loss
    rsi = 100 - (100 / (1 + rs))
    return rsi

def calculate_macd(data, fast=12, slow=26, signal=9):
    """Calculate MACD (Moving Average Convergence Divergence)"""
    ema_fast = calculate_ema(data, fast)
    ema_slow = calculate_ema(data, slow)
    
    macd = ema_fast - ema_slow
    signal_line = calculate_ema(macd, signal)
    histogram = macd - signal_line
    
    return macd, signal_line, histogram

def calculate_bollinger_bands(data, period=20, std_dev=2):
    """Calculate Bollinger Bands"""
    middle_band = calculate_sma(data, period)
    std = data.rolling(window=period).std()
    
    upper_band = middle_band + (std * std_dev)
    lower_band = middle_band - (std * std_dev)
    
    return upper_band, middle_band, lower_band

def calculate_atr(data, period=14):
    """Calculate Average True Range"""
    high = data['High']
    low = data['Low']
    close = data['Close']
    
    tr1 = high - low
    tr2 = abs(high - close.shift())
    tr3 = abs(low - close.shift())
    
    tr = pd.concat([tr1, tr2, tr3], axis=1).max(axis=1)
    atr = tr.rolling(window=period).mean()
    
    return atr

def calculate_stochastic(data, period=14):
    """Calculate Stochastic Oscillator"""
    high = data['High']
    low = data['Low']
    close = data['Close']
    
    lowest_low = low.rolling(window=period).min()
    highest_high = high.rolling(window=period).max()
    
    k = 100 * ((close - lowest_low) / (highest_high - lowest_low))
    d = k.rolling(window=3).mean()
    
    return k, d

def calculate_obv(data):
    """Calculate On-Balance Volume"""
    obv = [0]
    for i in range(1, len(data)):
        if data['Close'].iloc[i] > data['Close'].iloc[i-1]:
            obv.append(obv[-1] + data['Volume'].iloc[i])
        elif data['Close'].iloc[i] < data['Close'].iloc[i-1]:
            obv.append(obv[-1] - data['Volume'].iloc[i])
        else:
            obv.append(obv[-1])
    
    return pd.Series(obv, index=data.index)

def calculate_williams_r(data, period=14):
    """Calculate Williams %R"""
    high = data['High']
    low = data['Low']
    close = data['Close']
    
    highest_high = high.rolling(window=period).max()
    lowest_low = low.rolling(window=period).min()
    
    williams_r = -100 * ((highest_high - close) / (highest_high - lowest_low))
    
    return williams_r

def calculate_adx(data, period=14):
    """Calculate Average Directional Index (ADX)"""
    high = data['High']
    low = data['Low']
    close = data['Close']
    
    # Calculate +DM and -DM
    plus_dm = high.diff()
    minus_dm = -low.diff()
    
    plus_dm[plus_dm < 0] = 0
    minus_dm[minus_dm < 0] = 0
    
    # Calculate ATR
    atr = calculate_atr(data, period)
    
    # Calculate +DI and -DI
    plus_di = 100 * (plus_dm.rolling(window=period).mean() / atr)
    minus_di = 100 * (minus_dm.rolling(window=period).mean() / atr)
    
    # Calculate DX and ADX
    dx = 100 * abs(plus_di - minus_di) / (plus_di + minus_di)
    adx = dx.rolling(window=period).mean()
    
    return adx, plus_di, minus_di

def calculate_cci(data, period=20):
    """Calculate Commodity Channel Index"""
    typical_price = (data['High'] + data['Low'] + data['Close']) / 3
    sma = typical_price.rolling(window=period).mean()
    mean_deviation = typical_price.rolling(window=period).apply(lambda x: np.abs(x - x.mean()).mean())
    
    cci = (typical_price - sma) / (0.015 * mean_deviation)
    
    return cci

def calculate_momentum(data, period=10):
    """Calculate Momentum"""
    return data.diff(period)

def calculate_roc(data, period=12):
    """Calculate Rate of Change"""
    roc = ((data - data.shift(period)) / data.shift(period)) * 100
    return roc

def identify_support_resistance(data, window=20):
    """Identify potential support and resistance levels"""
    highs = data['High'].rolling(window=window, center=True).max()
    lows = data['Low'].rolling(window=window, center=True).min()
    
    resistance_levels = highs[data['High'] == highs].dropna().unique()
    support_levels = lows[data['Low'] == lows].dropna().unique()
    
    return sorted(support_levels)[-3:], sorted(resistance_levels)[-3:]

def detect_patterns(data):
    """Basic pattern detection (simplified)"""
    patterns = []
    
    # Golden Cross (50 SMA crosses above 200 SMA)
    sma_50 = calculate_sma(data['Close'], 50)
    sma_200 = calculate_sma(data['Close'], 200)
    
    if len(sma_50) > 1 and len(sma_200) > 1:
        if sma_50.iloc[-2] <= sma_200.iloc[-2] and sma_50.iloc[-1] > sma_200.iloc[-1]:
            patterns.append("🟢 Golden Cross detectado")
        elif sma_50.iloc[-2] >= sma_200.iloc[-2] and sma_50.iloc[-1] < sma_200.iloc[-1]:
            patterns.append("🔴 Death Cross detectado")
    
    # RSI extremes
    rsi = calculate_rsi(data['Close'])
    if rsi.iloc[-1] > 70:
        patterns.append("⚠️ RSI en zona de sobrecompra (>70)")
    elif rsi.iloc[-1] < 30:
        patterns.append("⚠️ RSI en zona de sobreventa (<30)")
    
    return patterns
