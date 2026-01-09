import random
import pandas as pd
import numpy as np
from analyzer import is_prime
from collections import Counter

def generate_combinations(df, number_cols, num_combinations=5):
    """
    Genera combinaciones de lotería basadas en heurísticas de datos históricos.
    Utiliza análisis de frecuencia, balance de pares/impares, primos y suma.
    """
    all_numbers = df[number_cols].values.flatten()
    
    # Calcular pesos basados en frecuencia
    freq = pd.Series(all_numbers).value_counts()
    
    # Determinar rango dinámicamente desde los datos
    min_val = int(min(all_numbers))
    max_val = int(max(all_numbers))
    
    possible_numbers = list(range(min_val, max_val + 1))
    
    # Crear diccionario de pesos con smoothing
    weights = {}
    for num in possible_numbers:
        # Usar frecuencia histórica + smoothing para números que no han salido
        weights[num] = freq.get(num, 0) + 1
    
    recommendations = []
    
    # Cantidad de números a escoger
    pick_size = len(number_cols)
    
    # Calcular estadísticas del dataset para validación
    avg_sum = df['Sum_Numbers'].mean()
    std_sum = df['Sum_Numbers'].std()
    avg_primes = df['Primes_Count'].mean()
    avg_evens = df['Even_Count'].mean()
    
    attempts = 0
    max_attempts = 2000
    
    while len(recommendations) < num_combinations and attempts < max_attempts:
        attempts += 1
        
        # Seleccionar números únicos basados en pesos
        selection = []
        remaining_numbers = possible_numbers.copy()
        remaining_weights = [weights[n] for n in remaining_numbers]
        
        for _ in range(pick_size):
            if not remaining_numbers:
                break
            chosen = random.choices(remaining_numbers, weights=remaining_weights, k=1)[0]
            selection.append(chosen)
            idx = remaining_numbers.index(chosen)
            remaining_numbers.pop(idx)
            remaining_weights.pop(idx)
        
        # Asegurar unicidad
        if len(set(selection)) != pick_size:
            continue
        
        selection = sorted(selection)
        
        # Validación 1: Balance Par/Impar
        evens = sum(1 for x in selection if x % 2 == 0)
        # Rango aceptable basado en histórico (±1 de la media)
        if not (max(1, avg_evens - 1.5) <= evens <= min(pick_size - 1, avg_evens + 1.5)):
            continue
        
        # Validación 2: Suma dentro de rango probabilístico (±1.5 desviaciones estándar)
        total_sum = sum(selection)
        if not (avg_sum - 1.5 * std_sum <= total_sum <= avg_sum + 1.5 * std_sum):
            continue
        
        # Validación 3: Balance de números primos
        primes = sum(1 for x in selection if is_prime(x))
        # Rango aceptable basado en histórico
        if not (max(0, avg_primes - 1.5) <= primes <= min(pick_size, avg_primes + 1.5)):
            continue
        
        # Validación 4: Evitar números consecutivos excesivos
        consecutive_count = 0
        for i in range(len(selection) - 1):
            if selection[i+1] - selection[i] == 1:
                consecutive_count += 1
        if consecutive_count > 2:  # Máximo 2 pares consecutivos
            continue
        
        # Validación 5: Distribución en rangos (bajo, medio, alto)
        range_size = (max_val - min_val + 1) // 3
        low_range = sum(1 for x in selection if min_val <= x < min_val + range_size)
        mid_range = sum(1 for x in selection if min_val + range_size <= x < min_val + 2 * range_size)
        high_range = sum(1 for x in selection if x >= min_val + 2 * range_size)
        
        # Al menos un número en cada rango
        if low_range == 0 or high_range == 0:
            continue
        
        # Si pasa todas las validaciones, agregar
        if selection not in recommendations:
            recommendations.append(selection)
    
    return recommendations


def generate_hybrid_combinations(df_melate, df_revancha, df_revanchita, number_cols, num_combinations=5):
    """
    Genera combinaciones híbridas para Melate combinando patrones de los tres juegos.
    Analiza los números ganadores de Revancha y Revanchita para encontrar patrones
    que puedan aplicarse a Melate.
    """
    # Obtener todos los números de los tres juegos
    all_melate = df_melate[number_cols].values.flatten()
    
    # Para Revancha y Revanchita, usar las columnas correspondientes
    revancha_cols = ['R1', 'R2', 'R3', 'R4', 'R5', 'R6']
    revanchita_cols = ['F1', 'F2', 'F3', 'F4', 'F5', 'F6']
    
    all_revancha = df_revancha[revancha_cols].values.flatten()
    all_revanchita = df_revanchita[revanchita_cols].values.flatten()
    
    # Calcular frecuencias combinadas
    combined_numbers = np.concatenate([all_melate, all_revancha, all_revanchita])
    freq_combined = pd.Series(combined_numbers).value_counts()
    
    # Identificar números que aparecen en múltiples juegos (hot across games)
    freq_melate = pd.Series(all_melate).value_counts()
    freq_revancha = pd.Series(all_revancha).value_counts()
    freq_revanchita = pd.Series(all_revanchita).value_counts()
    
    # Números que están en el top 50% de frecuencia en al menos 2 juegos
    hot_across_games = set()
    
    median_melate = freq_melate.median()
    median_revancha = freq_revancha.median()
    median_revanchita = freq_revanchita.median()
    
    for num in range(1, 57):  # Rango típico de Melate
        in_melate_top = freq_melate.get(num, 0) >= median_melate
        in_revancha_top = freq_revancha.get(num, 0) >= median_revancha
        in_revanchita_top = freq_revanchita.get(num, 0) >= median_revanchita
        
        count = sum([in_melate_top, in_revancha_top, in_revanchita_top])
        if count >= 2:
            hot_across_games.add(num)
    
    # Crear pesos híbridos
    min_val = int(min(all_melate))
    max_val = int(max(all_melate))
    possible_numbers = list(range(min_val, max_val + 1))
    
    weights = {}
    for num in possible_numbers:
        base_weight = freq_combined.get(num, 0) + 1
        # Bonus para números populares en múltiples juegos
        if num in hot_across_games:
            base_weight *= 1.5
        weights[num] = base_weight
    
    recommendations = []
    pick_size = len(number_cols)
    
    # Calcular estadísticas promedio de los tres juegos
    avg_sum = (df_melate['Sum_Numbers'].mean() + 
               df_revancha['Sum_Numbers'].mean() + 
               df_revanchita['Sum_Numbers'].mean()) / 3
    std_sum = (df_melate['Sum_Numbers'].std() + 
               df_revancha['Sum_Numbers'].std() + 
               df_revanchita['Sum_Numbers'].std()) / 3
    
    avg_primes = (df_melate['Primes_Count'].mean() + 
                  df_revancha['Primes_Count'].mean() + 
                  df_revanchita['Primes_Count'].mean()) / 3
    
    avg_evens = (df_melate['Even_Count'].mean() + 
                 df_revancha['Even_Count'].mean() + 
                 df_revanchita['Even_Count'].mean()) / 3
    
    attempts = 0
    max_attempts = 2000
    
    while len(recommendations) < num_combinations and attempts < max_attempts:
        attempts += 1
        
        # Estrategia híbrida: incluir al menos 2-3 números "hot across games"
        selection = []
        
        # Agregar 2-3 números hot
        hot_count = random.randint(2, min(3, len(hot_across_games)))
        if len(hot_across_games) >= hot_count:
            hot_nums = random.sample(list(hot_across_games), hot_count)
            selection.extend(hot_nums)
        
        # Completar con números basados en pesos
        remaining_count = pick_size - len(selection)
        remaining_numbers = [n for n in possible_numbers if n not in selection]
        remaining_weights = [weights[n] for n in remaining_numbers]
        
        if len(remaining_numbers) >= remaining_count:
            additional = random.choices(remaining_numbers, weights=remaining_weights, k=remaining_count)
            selection.extend(additional)
        
        # Asegurar unicidad
        if len(set(selection)) != pick_size:
            continue
        
        selection = sorted(list(set(selection)))
        if len(selection) != pick_size:
            continue
        
        # Aplicar las mismas validaciones que en generate_combinations
        
        # Validación 1: Balance Par/Impar
        evens = sum(1 for x in selection if x % 2 == 0)
        if not (max(1, avg_evens - 1.5) <= evens <= min(pick_size - 1, avg_evens + 1.5)):
            continue
        
        # Validación 2: Suma
        total_sum = sum(selection)
        if not (avg_sum - 1.5 * std_sum <= total_sum <= avg_sum + 1.5 * std_sum):
            continue
        
        # Validación 3: Primos
        primes = sum(1 for x in selection if is_prime(x))
        if not (max(0, avg_primes - 1.5) <= primes <= min(pick_size, avg_primes + 1.5)):
            continue
        
        # Validación 4: Consecutivos
        consecutive_count = 0
        for i in range(len(selection) - 1):
            if selection[i+1] - selection[i] == 1:
                consecutive_count += 1
        if consecutive_count > 2:
            continue
        
        # Validación 5: Distribución en rangos
        range_size = (max_val - min_val + 1) // 3
        low_range = sum(1 for x in selection if min_val <= x < min_val + range_size)
        high_range = sum(1 for x in selection if x >= min_val + 2 * range_size)
        
        if low_range == 0 or high_range == 0:
            continue
        
        # Si pasa todas las validaciones, agregar
        if selection not in recommendations:
            recommendations.append(selection)
    
    return recommendations


def analyze_pattern_correlation(df_melate, df_revancha, df_revanchita):
    """
    Analiza la correlación de patrones entre los tres juegos.
    Retorna insights sobre números que tienden a salir juntos.
    """
    # Esta función podría expandirse para análisis más profundos
    insights = {
        'melate_hot': [],
        'revancha_hot': [],
        'revanchita_hot': [],
        'cross_game_hot': []
    }
    
    return insights
