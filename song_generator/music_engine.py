import random

GENRE_PROGRESSIONS = {
    "Pop": ["I - V - vi - IV", "vi - IV - I - V", "I - IV - V - IV", "ii - V - I - vi"],
    "Rock": ["I - IV - V", "I - bVII - IV", "i - bVI - bVII", "i - bIII - bVII - IV"],
    "Jazz": ["ii7 - V7 - Imaj7", "Imaj7 - vi7 - ii7 - V7", "iii7 - vi7 - ii7 - V7", "iim7b5 - V7alt - imaj7"],
    "Reggaeton": ["bm - G - D - A", "vi - IV - I - V", "i - iv - V"],
    "Ballad": ["I - V/7 - vi - IV", "I - iii - IV - V"],
    "Synthwave": ["i - bVI - bIII - bVII", "i - bVI - iv - V"],
    "Banda": ["I - IV - I - V", "I - V - I - IV", "I - IV - V - I", "IV - I - V - I"],
    "Corridos": ["I - IV - V", "I - V - IV - I", "IV - I - V", "I - IV - I - V"],
    "Bolero": ["i - iv - V - i", "i - VI - iidim - V", "i - bVI - bVII - i", "iv - i - V - i"],
    "Cumbia": ["I - V - I - IV", "I - IV - V", "IV - I - V - I"],
    "Salsa": ["i - iv - V", "i - V - i - iv", "iv - V - i", "i - bVII - bVI - V"],
    "Ranchera": ["I - IV - I - V", "I - V - I", "IV - I - V - I", "I - IV - V - I"]
}

SECTIONS = {
    "Pop": ["Verse", "Chorus", "Verse", "Chorus", "Bridge", "Chorus", "Outro"],
    "Rock": ["Intro", "Verse", "Chorus", "Verse", "Chorus", "Solo", "Chorus"],
    "Jazz": ["Head", "Solos", "Head", "Outro"],
    "Reggaeton": ["Intro", "Chorus", "Verse", "Chorus", "Perreo Bridge", "Chorus", "Outro"],
    "Ballad": ["Verse", "Chorus", "Verse", "Chorus", "Bridge", "Chorus"],
    "Synthwave": ["Intro", "Build-up", "Drop", "Break", "Drop", "Outro"],
    "Banda": ["Intro", "Verso", "Coro", "Verso", "Coro", "Instrumental", "Coro", "Outro"],
    "Corridos": ["Intro", "Primera", "Segunda", "Tercera", "Despedida"],
    "Bolero": ["Intro", "Estrofa", "Estribillo", "Estrofa", "Estribillo", "Puente", "Estribillo"],
    "Cumbia": ["Intro", "Verso", "Coro", "Verso", "Coro", "Zapateado", "Coro"],
    "Salsa": ["Intro", "Verso", "Coro", "Mambo", "Verso", "Coro", "Montuno"],
    "Ranchera": ["Intro", "Estrofa", "Coro", "Estrofa", "Coro", "Grito", "Coro", "Outro"]
}

def generate_structure(genre, complexity):
    """
    Returns a list of song sections with chord progressions.
    """
    base_structure = SECTIONS.get(genre, SECTIONS["Pop"])
    structure_out = []
    
    # Select a primary and secondary progression for variety
    progs = GENRE_PROGRESSIONS.get(genre, GENRE_PROGRESSIONS["Pop"])
    main_prog = random.choice(progs)
    chorus_prog = random.choice(progs)
    bridge_prog = random.choice(progs)
    
    for section_name in base_structure:
        prog = main_prog
        if "Chorus" in section_name:
            prog = chorus_prog
        elif "Bridge" in section_name or "Solo" in section_name:
            prog = bridge_prog
            
        structure_out.append({
            "type": section_name,
            "progression": prog
        })
        
    return structure_out
