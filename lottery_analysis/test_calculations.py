import data_loader
import analyzer
import predictor
import os

def test_pro_features():
    print("Testing Auto Update & Multi-Game Loading...")
    
    # Try updating Melate (downloads if missing)
    msg = data_loader.update_data()
    print(f"Update Status: {msg}")
    
    # Load Melate
    res_melate = data_loader.load_data("Melate")
    if res_melate:
        df_m, cols_m = res_melate
        print(f"PASS: Loaded Melate. Rows: {len(df_m)}. Columns: {cols_m}")
        
        # Test Analysis
        df_m = analyzer.enrich_data(df_m, cols_m)
        stats = analyzer.calculate_stats(df_m, cols_m)
        print("PASS: Analyzed Melate.")
        
        # Test Prediction
        recs = predictor.generate_combinations(df_m, cols_m, num_combinations=2)
        print(f"PASS: Generated Melate predictions: {recs[0]}")
    else:
        print("FAIL: Could not load Melate.")

    # Load Revancha
    res_rev = data_loader.load_data("Revancha")
    if res_rev:
        df_r, cols_r = res_rev
        print(f"PASS: Loaded Revancha. Rows: {len(df_r)}. Columns: {cols_r}")
        
        # Verify it likely has 6 columns
        if len(cols_r) == 6:
            print("PASS: Revancha has 6 numbers as expected.")
    else:
        print("FAIL: Could not load Revancha.")

if __name__ == "__main__":
    test_pro_features()
