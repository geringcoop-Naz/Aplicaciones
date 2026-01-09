import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import data_loader
import analyzer
import predictor

st.set_page_config(page_title="Lottery Analyzer Pro", layout="wide")

st.title("🎲 Pro Lottery Analysis (Melate/Revancha)")

# Sidebar for controls
st.sidebar.header("Configuration")

# Game Selection
game_choice = st.sidebar.selectbox("Select Game", ["Melate", "Revancha", "Revanchita"])

# Auto-Update
if st.sidebar.button("Check for Updates Now"):
    with st.spinner("Checking GitHub for updates..."):
        msg = data_loader.update_data()
    st.sidebar.success(msg)

# Load Data logic
result = data_loader.load_data(game_choice)

if result is None:
    # Try updating if missing
    with st.spinner(f"Data for {game_choice} not found. Downloading..."):
        data_loader.update_data()
        result = data_loader.load_data(game_choice)

if result is not None:
    df, number_cols = result
    
    # Enrich Data
    df = analyzer.enrich_data(df, number_cols)

    # --- Dashboard Overview ---
    st.header(f"📊 {game_choice} Analysis")
    
    col1, col2 = st.columns(2)
    
    with col1:
        st.subheader("Raw Data (Recent)")
        st.dataframe(df.head(10))
        
    with col2:
        st.subheader("Statistics Summary")
        stats = analyzer.calculate_stats(df, number_cols)
        st.dataframe(stats)

    # --- Distributions ---
    st.header("📈 Distributions & Trends")
    
    tab1, tab2, tab3 = st.tabs(["Number Frequency", "Prime Numbers", "Sum Distribution"])
    
    with tab1:
        st.subheader("Frequency of Each Number")
        freq = analyzer.get_frequency_distribution(df, number_cols)
        fig, ax = plt.subplots(figsize=(10, 5))
        sns.barplot(x=freq.index, y=freq.values, ax=ax, palette="viridis")
        ax.set_ylabel("Occurrences")
        ax.set_xlabel("Lottery Number")
        st.pyplot(fig)
        
    with tab2:
        st.subheader("Primes per Draw Distribution")
        fig2, ax2 = plt.subplots(figsize=(8, 4))
        sns.histplot(df['Primes_Count'], bins=range(0, len(number_cols)+2), discrete=True, kde=False, ax=ax2, color="orange")
        ax2.set_xlabel("Number of Primes in a Draw")
        st.pyplot(fig2)

    with tab3:
        st.subheader("Sum of Numbers Distribution")
        fig3, ax3 = plt.subplots(figsize=(8, 4))
        sns.histplot(df['Sum_Numbers'], kde=True, ax=ax3, color="green")
        ax3.set_xlabel(f"Sum of {', '.join(number_cols)}")
        st.pyplot(fig3)

    # --- Prediction Section ---
    st.markdown("---")
    st.header(f"🔮 AI Prediction for {game_choice}")
    st.markdown("""
    Based on historical frequency, prime balance, and sum probability theories.
    """)
    
    if st.button("Generate Winning Combinations"):
        with st.spinner("Analyzing patterns and generating probabilities..."):
            recommendations = predictor.generate_combinations(df, number_cols, num_combinations=5)
            
        if recommendations:
            st.success("Analysis Complete! Here are your suggested plays:")
            for i, combo in enumerate(recommendations):
                st.write(f"**Option {i+1}:** {combo}")
        else:
            st.warning("Could not generate combinations matching strict criteria. Try again.")
            
else:
    st.error(f"Could not load data for {game_choice}. Please check internet connection and try updating.")
