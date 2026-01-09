import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import music_engine
import lyric_engine
import style_analyzer
import translator

st.set_page_config(page_title="AI Songwriter - Subliminal & Structural", layout="wide")

st.title("🎵 AI Songwriter & Composer")
st.markdown("""
Generate songs with specific themes, genres, and subliminal stylistic influences.
""")

# Sidebar controls
with st.sidebar:
    st.header("Configuration")
    language = st.selectbox("Language / Idioma", ["English", "Español"])
    genre = st.selectbox("Select Genre", [
        "Pop", "Rock", "Jazz", "Reggaeton", "Ballad", "Synthwave",
        "Banda", "Corridos", "Bolero", "Cumbia", "Salsa", "Ranchera"
    ])
    mood = st.select_slider("Mood", options=["Melancholic", "Sad", "Neutral", "Happy", "Euphoric", "Aggressive"])
    
    st.header("Advanced Settings")
    complexity = st.slider("Musical Complexity", 1, 10, 5)
    
    st.markdown("### References")
    ref_input = st.text_area("Paste Reference Text or Lyric URLs", height=150, help="Paste lyrics or URLs to lyrics here. The AI will analyze these for style and vocabulary.")

# Create tabs for different features
tab1, tab2 = st.tabs(["🎸 Song Generator", "🌐 Song Translator"])

with tab1:
    st.markdown("Generate original songs with specific themes, genres, and styles.")
    
    # Main Input
    theme = st.text_input("Central Theme / Concept", placeholder="e.g., A heartbreak in a neon city...")

    if st.button("Generate Song"):
        if not theme:
            st.error("Please enter a theme first.")
        else:
            with st.spinner("Analyzing references and composing..."):
                # 1. Analyze References (Subliminal Layer)
                style_profile = style_analyzer.analyze_references(ref_input)
                
                # 2. Generate Structure & Chords
                structure = music_engine.generate_structure(genre, complexity)
                
                # 3. Generate Lyrics
                song = lyric_engine.compose_song(theme, genre, mood, structure, style_profile, language)
                
                # Display Result
                st.write("---")
                st.header(f"Title: {song['title']}")
                
                col1, col2 = st.columns([2, 1])
                
                with col1:
                    st.subheader("Lyrics & Chords")
                    for section in song['sections']:
                        st.markdown(f"**[{section['type']}]**")
                        st.caption(f"Chord Progression: {section['progression']}")
                        st.text(section['lyrics'])
                        st.write("")
                
                with col2:
                    st.subheader("Analysis")
                    st.metric("Detected Reference Style", style_profile['vibe'])
                    st.write("**Key Vocabulary from Ref:**")
                    st.write(", ".join(style_profile['top_words'][:10]))
                    st.progress(complexity/10, text="Harmonic Complexity")

with tab2:
    st.markdown("Translate songs or poetry while preserving rhyme, rhythm and musicality.")
    
    col_trans1, col_trans2 = st.columns(2)
    
    with col_trans1:
        trans_direction = st.radio(
            "Translation Direction",
            ["Spanish → English", "English → Spanish"]
        )
    
    with col_trans2:
        maintain_rhyme = st.checkbox(
            "Maintain Rhyme & Structure",
            value=True,
            help="Adapts words to preserve rhyme scheme and musical flow"
        )
    
    st.markdown("---")
    
    input_lyrics = st.text_area(
        "Paste Song Lyrics or Poetry",
        height=300,
        placeholder="Paste the lyrics you want to translate here..."
    )
    
    if st.button("Translate", type="primary"):
        if not input_lyrics:
            st.error("Please paste some lyrics or poetry first.")
        else:
            with st.spinner("Translating with lyrical adaptation..."):
                from_lang = "es" if "Spanish" in trans_direction else "en"
                to_lang = "en" if "English" in trans_direction else "es"
                
                translated_song = translator.translate_song(
                    input_lyrics,
                    from_language=from_lang,
                    to_language=to_lang,
                    maintain_structure=maintain_rhyme
                )
                
                # Display results side by side
                st.write("---")
                st.header("Translation Result")
                
                col_orig, col_transl = st.columns(2)
                
                with col_orig:
                    st.subheader("Original")
                    st.text(input_lyrics)
                
                with col_transl:
                    st.subheader("Translated")
                    for section in translated_song:
                        st.markdown(f"**[{section['section']}]**")
                        st.text(section['lyrics'])
                        st.write("")
                
                # Download option
                translation_text = "\n\n".join([
                    f"[{section['section']}]\n{section['lyrics']}" 
                    for section in translated_song
                ])
                
                st.download_button(
                    label="Download Translation",
                    data=translation_text,
                    file_name=f"translated_song_{to_lang}.txt",
                    mime="text/plain"
                )


