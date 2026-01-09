import pandas as pd
import requests
import os
import time

GAME_URLS = {
    "Revancha": "https://raw.githubusercontent.com/pakinja/pakin/master/Historico-Revancha.csv",
    "Revanchita": "https://raw.githubusercontent.com/pakinja/pakin/master/Historico-Revanchita.csv"
}

GAME_FILES = {
    "Melate": "data_Melate.csv",
    "Revancha": "data_Revancha.csv",
    "Revanchita": "data_Revanchita.csv"
}

def update_data():
    """
    Checks if data files are older than 72 hours or missing, and downloads them.
    Returns a status message.
    """
    updated_files = []
    errors = []
    
    for game, url in GAME_URLS.items():
        filename = GAME_FILES[game]
        should_download = False
        
        if not os.path.exists(filename):
            should_download = True
        else:
            # Check age (72 hours = 259200 seconds)
            file_age = time.time() - os.path.getmtime(filename)
            if file_age > 72 * 3600:
                should_download = True
                
        if should_download:
            try:
                response = requests.get(url)
                response.raise_for_status()
                with open(filename, 'wb') as f:
                    f.write(response.content)
                updated_files.append(game)
            except Exception as e:
                errors.append(f"Failed to update {game}: {str(e)}")
                
    if not updated_files and not errors:
        return "Data is up to date."
    elif errors:
        return f"Updated: {', '.join(updated_files)}. Errors: {', '.join(errors)}"
    else:
        return f"Successfully updated: {', '.join(updated_files)}"

def load_data(game_name="Melate"):
    """
    Loads the number data for the specified game.
    """
    filepath = GAME_FILES.get(game_name)
    if not filepath or not os.path.exists(filepath):
        return None

    try:
        df = pd.read_csv(filepath)
        return _process_dataframe(df)
    except Exception as e:
        print(f"Error loading {game_name}: {e}")
        return None

def _process_dataframe(df, is_sample=False):
    """
    Common preprocessing for the dataframe.
    """
    # Standardize Column Names
    # GitHub files have 'FECHA' at the end.
    # We want to ensure 'FECHA' is datetime.
    
    if 'FECHA' in df.columns:
         df['FECHA'] = pd.to_datetime(df['FECHA'], errors='coerce')
    
    # Identify number columns dynamically
    # For Melate and Revancha: R1-R7 or R1-R6
    # For Revanchita: F1-F6
    valid_cols = []
    
    # Check for R columns
    r_cols = [col for col in df.columns if col.startswith('R') and col[1:].isdigit()]
    if r_cols:
        valid_cols = r_cols
    
    # Check for F columns (Revanchita)
    f_cols = [col for col in df.columns if col.startswith('F') and col[1:].isdigit()]
    if f_cols:
        valid_cols = f_cols
    
    # Ensure they are integers
    for col in valid_cols:
        df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0).astype(int)
        
    return df, valid_cols
