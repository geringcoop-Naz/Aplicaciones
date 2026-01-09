import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import data_loader
import analyzer
import predictor_enhanced as predictor
import numpy as np

st.set_page_config(page_title="Lottery Analyzer Pro - Melate Completo", layout="wide")

# Custom CSS for better styling
st.markdown("""
<style>
    .main-header {
        background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
        padding: 20px;
        border-radius: 10px;
        color: white;
        text-align: center;
        margin-bottom: 20px;
    }
    .game-section {
        background: #f8f9fa;
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 15px;
        border-left: 5px solid #667eea;
    }
    .combo-box {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 10px 15px;
        border-radius: 8px;
        margin: 5px 0;
        font-weight: bold;
        font-size: 18px;
    }
    .hybrid-combo {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        color: white;
        padding: 10px 15px;
        border-radius: 8px;
        margin: 5px 0;
        font-weight: bold;
        font-size: 18px;
    }
    .stat-card {
        background: white;
        padding: 15px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin: 10px 0;
    }
</style>
""", unsafe_allow_html=True)

st.markdown('<div class="main-header"><h1>🎲 Lottery Analyzer Pro - Melate Completo</h1><p>Análisis Estadístico y Estocástico Avanzado</p></div>', unsafe_allow_html=True)

# Load all three games
games = {
    "Melate": ("Melate", ["R1", "R2", "R3", "R4", "R5", "R6"]),
    "Revancha": ("Revancha", ["R1", "R2", "R3", "R4", "R5", "R6"]),
    "Revanchita": ("Revanchita", ["F1", "F2", "F3", "F4", "F5", "F6"])
}

all_data = {}
for game_name, (game_key, cols) in games.items():
    result = data_loader.load_data(game_key)
    if result is not None:
        df, number_cols = result
        df = analyzer.enrich_data(df, number_cols)
        all_data[game_name] = {
            'df': df,
            'number_cols': number_cols if number_cols else cols
        }

if len(all_data) == 3:
    # Create tabs for different views
    tab_overview, tab_stats, tab_predictions = st.tabs(["📊 Vista General", "📈 Análisis Estadístico", "🔮 Predicciones"])
    
    with tab_overview:
        st.header("Resumen de los Tres Juegos")
        
        cols = st.columns(3)
        for idx, (game_name, data) in enumerate(all_data.items()):
            with cols[idx]:
                st.markdown(f'<div class="game-section">', unsafe_allow_html=True)
                st.subheader(f"🎯 {game_name}")
                
                df = data['df']
                number_cols = data['number_cols']
                
                # Key metrics
                st.metric("Total Sorteos", len(df))
                st.metric("Último Sorteo", df.iloc[0]['CONCURSO'] if 'CONCURSO' in df.columns else "N/A")
                
                # Recent draw
                st.write("**Último Resultado:**")
                recent = df.iloc[0][number_cols].values.tolist()
                st.write(f"🎱 {' - '.join(map(str, recent))}")
                
                # Quick stats
                st.write("**Estadísticas Rápidas:**")
                st.write(f"• Suma promedio: {df['Sum_Numbers'].mean():.1f}")
                st.write(f"• Primos promedio: {df['Primes_Count'].mean():.1f}")
                st.write(f"• Pares promedio: {df['Even_Count'].mean():.1f}")
                
                st.markdown('</div>', unsafe_allow_html=True)
    
    with tab_stats:
        st.header("📈 Análisis Estadístico y Estocástico Detallado")
        
        for game_name, data in all_data.items():
            st.markdown(f'<div class="game-section">', unsafe_allow_html=True)
            st.subheader(f"📊 {game_name}")
            
            df = data['df']
            number_cols = data['number_cols']
            
            # Create sub-columns for charts
            col1, col2 = st.columns(2)
            
            with col1:
                st.write("**Frecuencia de Números**")
                freq = analyzer.get_frequency_distribution(df, number_cols)
                fig, ax = plt.subplots(figsize=(10, 4))
                colors = plt.cm.viridis(np.linspace(0, 1, len(freq)))
                ax.bar(freq.index, freq.values, color=colors)
                ax.set_ylabel("Apariciones")
                ax.set_xlabel("Número")
                ax.set_title(f"Frecuencia Histórica - {game_name}")
                ax.grid(axis='y', alpha=0.3)
                st.pyplot(fig)
                plt.close()
                
                # Hot and Cold numbers
                st.write("**Números Calientes y Fríos**")
                top_5 = freq.nlargest(5)
                bottom_5 = freq.nsmallest(5)
                
                col_hot, col_cold = st.columns(2)
                with col_hot:
                    st.write("🔥 **Calientes:**")
                    for num, count in top_5.items():
                        st.write(f"   {num}: {count} veces")
                with col_cold:
                    st.write("❄️ **Fríos:**")
                    for num, count in bottom_5.items():
                        st.write(f"   {num}: {count} veces")
            
            with col2:
                st.write("**Distribución de Suma**")
                fig2, ax2 = plt.subplots(figsize=(10, 4))
                ax2.hist(df['Sum_Numbers'], bins=30, color='#667eea', alpha=0.7, edgecolor='black')
                ax2.axvline(df['Sum_Numbers'].mean(), color='red', linestyle='--', linewidth=2, label='Media')
                ax2.set_xlabel("Suma de Números")
                ax2.set_ylabel("Frecuencia")
                ax2.set_title(f"Distribución de Suma - {game_name}")
                ax2.legend()
                ax2.grid(axis='y', alpha=0.3)
                st.pyplot(fig2)
                plt.close()
                
                st.write("**Distribución de Números Primos**")
                fig3, ax3 = plt.subplots(figsize=(10, 3))
                prime_counts = df['Primes_Count'].value_counts().sort_index()
                ax3.bar(prime_counts.index, prime_counts.values, color='#764ba2', alpha=0.7, edgecolor='black')
                ax3.set_xlabel("Cantidad de Primos")
                ax3.set_ylabel("Frecuencia")
                ax3.set_title(f"Primos por Sorteo - {game_name}")
                ax3.grid(axis='y', alpha=0.3)
                st.pyplot(fig3)
                plt.close()
            
            # Statistical summary table
            st.write("**Tabla de Estadísticas Descriptivas**")
            stats = analyzer.calculate_stats(df, number_cols)
            st.dataframe(stats.style.background_gradient(cmap='viridis'), use_container_width=True)
            
            st.markdown('</div>', unsafe_allow_html=True)
            st.markdown("---")
    
    with tab_predictions:
        st.header("🔮 Generador de Combinaciones Inteligentes")
        
        st.markdown("""
        **Metodología:**
        - Análisis de frecuencia histórica con ponderación estocástica
        - Validación de balance par/impar óptimo
        - Distribución de suma dentro de rangos probabilísticos
        - Balance de números primos según patrones históricos
        - Combinaciones híbridas usando patrones cruzados de los 3 juegos
        """)
        
        if st.button("🎲 Generar Todas las Combinaciones", type="primary"):
            with st.spinner("Analizando patrones históricos y generando combinaciones optimizadas..."):
                
                # Generate combinations for each game
                all_combinations = {}
                for game_name, data in all_data.items():
                    df = data['df']
                    number_cols = data['number_cols']
                    combos = predictor.generate_combinations(df, number_cols, num_combinations=5)
                    all_combinations[game_name] = combos
                
                # Generate hybrid combinations
                hybrid_combos = predictor.generate_hybrid_combinations(
                    all_data['Melate']['df'], 
                    all_data['Revancha']['df'],
                    all_data['Revanchita']['df'],
                    all_data['Melate']['number_cols'],
                    num_combinations=5
                )
                
                st.success("✅ Análisis completado! Aquí están tus combinaciones optimizadas:")
                
                # Display individual game combinations
                cols = st.columns(3)
                for idx, (game_name, combos) in enumerate(all_combinations.items()):
                    with cols[idx]:
                        st.subheader(f"🎯 {game_name}")
                        if combos:
                            for i, combo in enumerate(combos):
                                combo_sum = sum(combo)
                                st.markdown(f'<div class="combo-box">#{i+1}: {" - ".join(map(str, combo))} <br/>📊 Suma: {combo_sum}</div>', unsafe_allow_html=True)
                        else:
                            st.warning("No se pudieron generar combinaciones")
                
                # Display hybrid combinations
                st.markdown("---")
                st.subheader("🌟 Combinaciones Híbridas (Patrón Cruzado)")
                st.write("*Estas combinaciones integran patrones de los tres juegos para Melate*")
                
                if hybrid_combos:
                    for i, combo in enumerate(hybrid_combos):
                        combo_sum = sum(combo)
                        st.markdown(f'<div class="hybrid-combo">🔥 Híbrida #{i+1}: {" - ".join(map(str, combo))} <br/>📊 Suma: {combo_sum}</div>', unsafe_allow_html=True)
                else:
                    st.warning("No se pudieron generar combinaciones híbridas")
                
                # Add download option
                st.markdown("---")
                st.subheader("💾 Exportar Combinaciones")
                
                # Create a comprehensive report
                report = "=== LOTTERY ANALYZER PRO - COMBINACIONES GENERADAS ===\n\n"
                for game_name, combos in all_combinations.items():
                    report += f"\n{game_name}:\n"
                    for i, combo in enumerate(combos):
                        combo_sum = sum(combo)
                        report += f"  {i+1}. {combo} - Suma: {combo_sum}\n"
                
                report += f"\n\nCombinaciones Híbridas (Melate):\n"
                for i, combo in enumerate(hybrid_combos):
                    combo_sum = sum(combo)
                    report += f"  {i+1}. {combo} - Suma: {combo_sum}\n"
                
                st.download_button(
                    label="📥 Descargar Combinaciones (TXT)",
                    data=report,
                    file_name="combinaciones_melate_completo.txt",
                    mime="text/plain"
                )

else:
    st.error("❌ No se pudieron cargar los datos de los tres juegos. Verifica que los archivos CSV estén disponibles.")
    st.info("Archivos necesarios: data_Melate.csv, data_Revancha.csv, data_Revanchita.csv")
