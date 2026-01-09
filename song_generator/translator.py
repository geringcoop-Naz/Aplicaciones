import re
from collections import Counter
from googletrans import Translator
import random

# Initialize translator
translator_instance = Translator()

# Diccionarios de adaptación lírica para mantener musicalidad
LYRICAL_ADAPTATIONS_ES_EN = {
    "corazón": ["heart", "soul", "love"],
    "alma": ["soul", "heart", "spirit"],
    "amor": ["love", "heart", "desire"],
    "noche": ["night", "dark", "midnight"],
    "cielo": ["sky", "heaven", "stars"],
    "sueño": ["dream", "wish", "hope"],
    "vida": ["life", "days", "time"],
    "dolor": ["pain", "hurt", "ache"],
    "fuego": ["fire", "flame", "burn"],
    "tristeza": ["sadness", "sorrow", "blues"],
    "lágrimas": ["tears", "crying", "weeping"],
    "besos": ["kisses", "lips", "loving"],
    "ojos": ["eyes", "gaze", "look"],
    "manos": ["hands", "touch", "hold"]
}

LYRICAL_ADAPTATIONS_EN_ES = {
    "heart": ["corazón", "alma", "amor"],
    "soul": ["alma", "corazón", "espíritu"],
    "love": ["amor", "cariño", "querer"],
    "night": ["noche", "oscuridad", "madrugada"],
    "sky": ["cielo", "firmamento", "estrella"],
    "dream": ["sueño", "anhelo", "deseo"],
    "life": ["vida", "días", "tiempo"],
    "pain": ["dolor", "pena", "sufrimiento"],
    "fire": ["fuego", "llama", "ardor"],
    "tears": ["lágrimas", "llanto", "tristeza"],
    "kiss": ["beso", "labios", "amor"],
    "eyes": ["ojos", "mirada", "vista"],
    "hands": ["manos", "tacto", "caricia"]
}

# Palabras de rima comunes
RHYME_WORDS_EN = {
    "ay": ["way", "day", "stay", "say", "play", "pray"],
    "ight": ["night", "right", "light", "bright", "fight", "sight"],
    "ove": ["love", "above", "dove", "of"],
    "art": ["heart", "part", "start", "apart"],
    "ear": ["tear", "fear", "near", "clear", "dear"],
    "ire": ["fire", "desire", "higher", "wire"],
    "ies": ["skies", "lies", "eyes", "cries"]
}

RHYME_WORDS_ES = {
    "or": ["amor", "dolor", "calor", "flor", "color"],
    "ión": ["corazón", "pasión", "canción", "razón"],
    "ar": ["amar", "llorar", "soñar", "volar", "bailar"],
    "ía": ["vida", "día", "alegría", "melodía"],
    "ado": ["pasado", "amado", "olvidado", "llegado"],
    "ente": ["mente", "gente", "presente", "frente"],
    "eza": ["tristeza", "belleza", "certeza", "grandeza"]
}

def detect_rhyme_scheme(lyrics):
    """Detecta el esquema de rimas de una letra."""
    lines = [line.strip() for line in lyrics.split('\n') if line.strip()]
    rhyme_scheme = []
    
    for line in lines:
        # Obtener la última palabra
        words = re.findall(r'\b\w+\b', line.lower())
        if words:
            last_word = words[-1]
            # Obtener las últimas 2-3 letras como patrón de rima
            rhyme_sound = last_word[-2:] if len(last_word) >= 2 else last_word
            rhyme_scheme.append(rhyme_sound)
    
    return rhyme_scheme

def find_rhyming_word(target_word, language="en"):
    """Encuentra una palabra que rime con el target."""
    rhyme_dict = RHYME_WORDS_EN if language == "en" else RHYME_WORDS_ES
    
    # Intentar encontrar por terminación
    if len(target_word) >= 2:
        ending = target_word[-2:]
        for pattern, words in rhyme_dict.items():
            if pattern in ending or ending in pattern:
                return random.choice(words)
    
    # Si no encuentra, devolver una palabra común
    return random.choice(list(rhyme_dict.values())[0])

def translate_with_context(text, to_language="en"):
    """Traduce usando googletrans pero con adaptaciones líricas."""
    try:
        if to_language == "en":
            result = translator_instance.translate(text, src='es', dest='en')
            translation = result.text
            adaptations = LYRICAL_ADAPTATIONS_ES_EN
        else:
            result = translator_instance.translate(text, src='en', dest='es')
            translation = result.text
            adaptations = LYRICAL_ADAPTATIONS_EN_ES
    except Exception as e:
        # Fallback simple si falla la traducción
        print(f"Translation error: {e}")
        translation = text
        adaptations = {}
    
    # Aplicar adaptaciones líricas
    for original, alternatives in adaptations.items():
        if original.lower() in translation.lower():
            # Usar una alternativa aleatoria que suene más lírica
            replacement = random.choice(alternatives)
            translation = re.sub(
                r'\b' + re.escape(original) + r'\b',
                replacement,
                translation,
                flags=re.IGNORECASE
            )
    
    return translation

def preserve_rhyme_structure(lyrics, target_language="en"):
    """Traduce preservando la estructura de rima cuando sea posible."""
    lines = [line.strip() for line in lyrics.split('\n') if line.strip()]
    translated_lines = []
    rhyme_scheme = detect_rhyme_scheme(lyrics)
    
    for i, line in enumerate(lines):
        # Traducir la línea
        translated = translate_with_context(line, target_language)
        
        # Si es necesario, ajustar la última palabra para mantener la rima
        if i > 0 and i < len(rhyme_scheme):
            # Verificar si debe rimar con líneas anteriores
            current_rhyme = rhyme_scheme[i]
            
            # Buscar líneas anteriores con la misma rima
            for j in range(i):
                if rhyme_scheme[j] == current_rhyme:
                    # Intentar hacer que rime
                    words = translated.split()
                    if words:
                        # Reemplazar la última palabra con una que rime
                        prev_line_words = translated_lines[j].split()
                        if prev_line_words:
                            target_rhyme = prev_line_words[-1]
                            rhyming_word = find_rhyming_word(target_rhyme, target_language)
                            words[-1] = rhyming_word
                            translated = ' '.join(words)
                    break
        
        translated_lines.append(translated)
    
    return '\n'.join(translated_lines)

def structure_as_song(text, target_language="en", genre="Pop"):
    """Convierte texto/poesía en estructura de canción."""
    # Dividir en estrofas (separadas por líneas en blanco o cada 4-6 líneas)
    paragraphs = [p.strip() for p in text.split('\n\n') if p.strip()]
    
    if not paragraphs:
        # Si no hay párrafos, dividir cada 4 líneas
        lines = [line for line in text.split('\n') if line.strip()]
        paragraphs = []
        for i in range(0, len(lines), 4):
            paragraphs.append('\n'.join(lines[i:i+4]))
    
    # Estructurar como canción
    song_structure = []
    
    if len(paragraphs) >= 1:
        song_structure.append({
            "section": "Verse 1" if target_language == "en" else "Verso 1",
            "lyrics": preserve_rhyme_structure(paragraphs[0], target_language)
        })
    
    if len(paragraphs) >= 2:
        song_structure.append({
            "section": "Chorus" if target_language == "en" else "Coro",
            "lyrics": preserve_rhyme_structure(paragraphs[1], target_language)
        })
    
    if len(paragraphs) >= 3:
        song_structure.append({
            "section": "Verse 2" if target_language == "en" else "Verso 2",
            "lyrics": preserve_rhyme_structure(paragraphs[2], target_language)
        })
    
    if len(paragraphs) >= 4:
        # Repetir el coro
        song_structure.append({
            "section": "Chorus" if target_language == "en" else "Coro",
            "lyrics": preserve_rhyme_structure(paragraphs[1], target_language)
        })
    
    if len(paragraphs) >= 5:
        song_structure.append({
            "section": "Bridge" if target_language == "en" else "Puente",
            "lyrics": preserve_rhyme_structure(paragraphs[4], target_language)
        })
        
        # Coro final
        song_structure.append({
            "section": "Chorus" if target_language == "en" else "Coro",
            "lyrics": preserve_rhyme_structure(paragraphs[1], target_language)
        })
    
    return song_structure

def translate_song(lyrics, from_language="es", to_language="en", maintain_structure=True):
    """
    Función principal de traducción de canciones.
    
    Args:
        lyrics: Letra de la canción a traducir
        from_language: Idioma de origen ("es" o "en")
        to_language: Idioma destino ("es" o "en")
        maintain_structure: Si True, mantiene rimas y estructura
    
    Returns:
        dict con la traducción estructurada
    """
    if maintain_structure:
        return structure_as_song(lyrics, to_language)
    else:
        # Traducción simple línea por línea
        lines = lyrics.split('\n')
        translated = [translate_with_context(line, to_language) for line in lines]
        return [{
            "section": "Translation",
            "lyrics": '\n'.join(translated)
        }]
