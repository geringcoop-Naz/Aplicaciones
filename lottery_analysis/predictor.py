import random
import pandas as pd
import numpy as np
from analyzer import is_prime

def generate_combinations(df, number_cols, num_combinations=5):
    """
    Generates lottery combinations based on historical data heuristics.
    """
    all_numbers = df[number_cols].values.flatten()
    
    # Calculate weights based on frequency
    freq = pd.Series(all_numbers).value_counts()
    
    # Determine range dynamically from data
    min_val = int(min(all_numbers))
    max_val = int(max(all_numbers))
    
    # If standard 1-56 not fitting, adjust.
    # Usually max is 56 for Melate.
    
    possible_numbers = list(range(min_val, max_val + 1))
    
    # Create weights dictionary
    weights = {}
    for num in possible_numbers:
        weights[num] = freq.get(num, 0) + 1 # +1 smoothing
    
    recommendations = []
    
    # How many numbers to pick? (e.g. 6)
    pick_size = len(number_cols)
    
    attempts = 0
    while len(recommendations) < num_combinations and attempts < 1000:
        attempts += 1
        
        # Select n unique numbers based on weights
        selection = random.choices(possible_numbers, weights=[weights[n] for n in possible_numbers], k=pick_size)
        
        # Ensure uniqueness in the set
        if len(set(selection)) != pick_size:
            continue
            
        selection = sorted(selection)
        
        # Validate against heuristics ("Game Theory")
        
        # 1. Even/Odd Balance:
        evens = sum(1 for x in selection if x % 2 == 0)
        # Relaxed check: allow mostly balanced (e.g. for 6: 2-4 evens)
        if pick_size == 6:
             if not (2 <= evens <= 4): continue
        elif pick_size == 7: # If 7 numbers
             if not (2 <= evens <= 5): continue

        # 2. Sum range:
        # Calculate expected avg sum
        avg_sum = (min_val + max_val) / 2 * pick_size
        std_sum_range = (max_val - min_val) * pick_size * 0.2 # approximate acceptable variance
        
        total_sum = sum(selection)
        if not (avg_sum - std_sum_range <= total_sum <= avg_sum + std_sum_range):
             # Try to be more lenient if the first heuristic fails too often
             # But usually this is the key to 'Game Theory' (Bell Curve)
             continue
            
        # 3. Prime balance:
        primes = sum(1 for x in selection if is_prime(x))
        if pick_size == 6:
             if not (1 <= primes <= 4): continue
        
        # If it passes checks, add it
        recommendations.append(selection)
        
    return recommendations
