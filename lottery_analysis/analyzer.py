import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

def is_prime(n):
    """Checks if a number is prime."""
    if n <= 1:
        return False
    if n <= 3:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True

def count_primes_in_row(row, cols):
    """Counts how many prime numbers are in the specified columns of a row."""
    count = 0
    for col in cols:
        val = row.get(col)
        # Ensure value is valid (not NaN or NA)
        if pd.notna(val) and isinstance(val, (int, float)) and is_prime(int(val)):
            count += 1
    return count

def enrich_data(df, number_cols):
    """Adds statistical columns to the dataframe."""
    
    # Primes count
    df['Primes_Count'] = df.apply(lambda row: count_primes_in_row(row, number_cols), axis=1)
    
    # Sum of numbers
    df['Sum_Numbers'] = df[number_cols].sum(axis=1)
    
    # Even/Odd counts
    df['Even_Count'] = df[number_cols].apply(lambda x: (x % 2 == 0).sum(), axis=1)
    df['Odd_Count'] = df[number_cols].apply(lambda x: (x % 2 != 0).sum(), axis=1)
    
    return df

def get_frequency_distribution(df, number_cols):
    """Calculates the frequency of each number across all draws."""
    all_numbers = df[number_cols].values.flatten()
    freq_series = pd.Series(all_numbers).value_counts().sort_index()
    return freq_series

def calculate_stats(df, number_cols):
    """Returns basic stats for the number columns."""
    stats = df[number_cols].describe()
    return stats
