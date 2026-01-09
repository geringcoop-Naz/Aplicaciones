import random

TEMPLATES_EN = {
    "Verse": [
        "In the {calc_adj} light, I see the {theme},\nSearching for a way to make it {rhyme_a}.\nThe streets are filling with {style_word},\nAnd I can't forget the way we {rhyme_a}.",
        "Walking down the road of {theme},\nEvery shadow looks like a {style_word}.\nI'm waiting for the {calc_noun} to call,\nBefore the empty sky begins to {rhyme_b}.",
        "They say that {theme} is a dangerous game,\nBut I'm ready to face the {style_word} just the same."
    ],
    "Chorus": [
        "Oh, give me {theme}, give me {style_word},\nLet the rhythm take us to the {rhyme_c}.\nWe don't need reason, we don't need {rhyme_d},\nJust the {theme} and you and me.",
        "It's a {adj} world when you're near,\nChasing {theme} without any fear.\n{style_word} high, {style_word} low,\nThis is the only way we know."
    ],
    "Bridge": [
        "And if the {style_word} falls apart,\nI'll keep the {theme} inside my heart.\nNo looking back, no turning 'round,\nUntil the lost is finally found."
    ]
}

TEMPLATES_ES = {
    "Verse": [
        "En la luz {calc_adj}, veo el {theme},\nBuscando la forma de hacerlo {rhyme_a}.\nLas calles se llenan de {style_word},\nY no puedo olvidar como solíamos {rhyme_a}.",
        "Caminando por el sendero del {theme},\nCada sombra parece un {style_word}.\nEstoy esperando que el {calc_noun} me llame,\nAntes de que el cielo vacío comience a {rhyme_b}.",
        "Dicen que {theme} es un juego peligroso,\nPero estoy listo para enfrentar el {style_word} sin reposo."
    ],
    "Chorus": [
        "Oh, dame {theme}, dame {style_word},\nDeja que el ritmo nos lleve a {rhyme_c}.\nNo necesitamos razón, no necesitamos {rhyme_d},\nSolo el {theme} y tú y yo al fin.",
        "Es un mundo {adj} cuando estás aquí,\nPersiguiendo {theme} sin temor ni sufrir.\n{style_word} arriba, {style_word} abajo,\nEsta es la única forma que yo trabajo."
    ],
    "Bridge": [
        "Y si el {style_word} se desmorona,\nGuardaré el {theme} en mi corona.\nSin mirar atrás, sin dar la vuelta,\nHasta que lo perdido por fin se resuelva."
    ]
}

# Latin Genre Specific Templates
TEMPLATES_BANDA = {
    "Verso": [
        "Con la banda sonando {adj},\nRecuerdo el {theme} que dejé atrás.\nLos {style_word} en el aire {rhyme_a},\nY mi corazón no puede {rhyme_a}.",
        "Entre tuba y tambora {calc_adj},\nEl {theme} me hace {rhyme_b}.\nLas trompetas gritan {style_word},\nY yo sigo queriendo {rhyme_b}."
    ],
    "Coro": [
        "¡Ay! {theme} de mi vida,\nComo {style_word} que nunca olvida.\n{style_word} en la madrugada,\nMi alma {adj} y enamorada.",
        "Que suene la banda, que suene,\nPorque el {theme} me detiene.\n{style_word} arriba, {style_word} abajo,\nCon este {calc_noun} que yo aco."
    ]
}

TEMPLATES_CORRIDOS = {
    "Primera": [
        "Voy a contarles amigos,\nLa historia del {theme} que he vivido.\nEntre {style_word} y {calc_adj} testigos,\nEste {calc_noun} no ha sido olvidado.",
    ],
    "Segunda": [
        "Por allá en {style_word},\nDonde el {theme} era rey.\nLos {calc_adj} hombres {rhyme_a},\nY las mujeres también {rhyme_a}."
    ],
    "Tercera": [
        "Dicen que el {theme} es {adj},\nPero yo lo he enfrentado sin {rhyme_d}.\nCon {style_word} en mi camino,\nY este {calc_noun} como destino."
    ],
    "Despedida": [
        "Aquí termina el corrido,\nDel {theme} que no ha sido vencido.\nQue viva el {style_word},\nY la memoria de lo vivido."
    ]
}

TEMPLATES_BOLERO = {
    "Estrofa": [
        "En la {calc_adj} noche de {style_word},\nEl {theme} me hace {rhyme_a}.\nTu recuerdo {adj} baila,\nY mi alma no puede {rhyme_a}.",
        "Bajo la luna {calc_adj},\nEl {theme} vuelve a {rhyme_b}.\nCon {style_word} en mis labios,\nYo te vuelvo a {rhyme_b}."
    ],
    "Estribillo": [
        "{theme}, mi {theme},\nComo {style_word} que se desvanece.\nEres {adj} melodía,\nQue en mi pecho permanece.",
        "Oh {theme} {adj},\nEres {style_word} de mi {calc_noun}.\nSin ti todo es {rhyme_d},\nSolo {calc_adj} tormento."
    ]
}

TEMPLATES_CUMBIA = {
    "Verso": [
        "Con la cumbia {adj} sonando,\nEl {theme} me está llamando.\nLos {style_word} están {rhyme_a},\nY todos siguen {rhyme_a}.",
        "Mueve la cintura al ritmo del {theme},\nQue {style_word} te hace {rhyme_b}.\nLa cumbia {calc_adj} no para,\nMi corazón quiere {rhyme_b}."
    ],
    "Coro": [
        "¡Cumbia, cumbia! {theme},\nQue {style_word} te mueva.\n{adj} y {calc_adj} sin parar,\nToda la noche vamos a {rhyme_a}.",
        "Dale {theme}, dale {style_word},\nQue la cumbia nos lleva.\nCon {calc_noun} y alegría,\nHasta que amanezca el día."
    ]
}

TEMPLATES_SALSA = {
    "Verso": [
        "Con sabor de {style_word},\nEl {theme} nos hace {rhyme_a}.\nLa salsa {adj} retumba,\nY nadie puede parar de {rhyme_a}.",
        "Al ritmo de la clave {calc_adj},\nEl {theme} me hace {rhyme_b}.\nCon {style_word} en la sangre,\nMi corazón quiere {rhyme_b}."
    ],
    "Coro": [
        "¡Salsa! {theme} caliente,\nQue {style_word} se siente.\n{adj} y sabroso,\nComo {calc_noun} misterioso.",
        "¡Wepa! {theme} de mi vida,\nCon {style_word} en la movida.\nSalsa {calc_adj} que no para,\nHasta que el sol nos separa."
    ],
    "Montuno": [
        "{theme}, {theme}, ¡Oye!,\n{style_word}, {style_word}, ¡Dale!,\nQue siga la fiesta {adj},\nHasta que el cuerpo aguante."
    ]
}

TEMPLATES_RANCHERA = {
    "Estrofa": [
        "Por estas tierras {calc_adj},\nDonde el {theme} es sagrado.\nLos {style_word} me acompañan,\nEn este camino {adj}.",
        "Con el mariachi {calc_adj} sonando,\nEl {theme} sigo {rhyme_a}.\nLas estrellas me miran,\nMientras yo sigo {rhyme_a}."
    ],
    "Coro": [
        "¡Ay! {theme} de mis amores,\nComo {style_word} entre flores.\nEres {adj} destino,\nEn mi camino.",
        "{theme} {calc_adj},\nQue {style_word} me llama.\nCon {calc_noun} en el alma,\nY tequila en la copa."
    ],
    "Grito": [
        "¡Ay, ay, ay! {theme},\n¡Que viva el {style_word}!\n¡Arriba, arriba!\n¡Que siga la fiesta {adj}!"
    ]
}

ADJECTIVES_EN = ["neon", "broken", "silent", "burning", "electric", "faded", "golden"]
ADJECTIVES_ES = ["neón", "roto", "silente", "ardiente", "eléctrico", "desvanecido", "dorado"]

RHYME_A_EN = ["stay", "play", "sway", "pray"]
RHYME_A_ES = ["brillar", "soñar", "bailar", "volar"]

RHYME_B_EN = ["fall", "call", "stall", "wall"]
RHYME_B_ES = ["caer", "arder", "crecer", "vencer"]

RHYME_C_EN = ["stars", "cars", "bars", "mars"]
RHYME_C_ES = ["brillar", "volar", "soñar", "amar"]

RHYME_D_EN = ["time", "rhyme", "crime", "climb"]
RHYME_D_ES = ["tiempo", "viento", "tormento", "momento"]

NOUNS_EN = ["moment", "dream", "night", "love"]
NOUNS_ES = ["momento", "sueño", "noche", "amor"]

def compose_song(theme, genre, mood, structure, style_profile, language="English"):
    """
    Composes lyrics based on parameters.
    """
    # Select language-specific resources
    is_spanish = (language == "Español")
    
    # Select genre-specific templates or default templates
    if genre == "Banda":
        templates = TEMPLATES_BANDA
    elif genre == "Corridos":
        templates = TEMPLATES_CORRIDOS
    elif genre == "Bolero":
        templates = TEMPLATES_BOLERO
    elif genre == "Cumbia":
        templates = TEMPLATES_CUMBIA
    elif genre == "Salsa":
        templates = TEMPLATES_SALSA
    elif genre == "Ranchera":
        templates = TEMPLATES_RANCHERA
    else:
        templates = TEMPLATES_ES if is_spanish else TEMPLATES_EN
    
    adjectives = ADJECTIVES_ES if is_spanish else ADJECTIVES_EN
    rhyme_a = RHYME_A_ES if is_spanish else RHYME_A_EN
    rhyme_b = RHYME_B_ES if is_spanish else RHYME_B_EN
    rhyme_c = RHYME_C_ES if is_spanish else RHYME_C_EN
    rhyme_d = RHYME_D_ES if is_spanish else RHYME_D_EN
    nouns = NOUNS_ES if is_spanish else NOUNS_EN
    
    song_data = {
        "title": f"{theme.title()} ({genre} {'Himno' if is_spanish else 'Anthem'})",
        "sections": []
    }
    
    # Prepare word banks
    style_words = style_profile.get('top_words', [])
    if not style_words:
        style_words = ["sueño", "noche", "fuego", "alma"] if is_spanish else ["dream", "night", "fire", "soul"]
        
    for section in structure:
        sec_type = section['type']
        
        # Determine template category based on section type
        # Handle genre-specific section names
        if sec_type in templates:
            # Direct match for genre-specific sections (Primera, Segunda, Montuno, Grito, etc.)
            tmpl_cat = sec_type
        elif "Chorus" in sec_type or "Coro" in sec_type or "Estribillo" in sec_type:
            tmpl_cat = "Coro" if "Coro" in templates else ("Estribillo" if "Estribillo" in templates else "Chorus")
        elif "Bridge" in sec_type or "Puente" in sec_type:
            tmpl_cat = "Puente" if "Puente" in templates else "Bridge"
        elif "Verse" in sec_type or "Verso" in sec_type or "Estrofa" in sec_type:
            tmpl_cat = "Verso" if "Verso" in templates else ("Estrofa" if "Estrofa" in templates else "Verse")
        else:
            # Default to first available template type
            tmpl_cat = list(templates.keys())[0]
            
        # Select and format template
        template = random.choice(templates[tmpl_cat])
        
        # Fill placeholders
        lyrics = template.format(
            theme=theme,
            adj=random.choice(adjectives),
            calc_adj=random.choice(adjectives),
            calc_noun=random.choice(nouns),
            style_word=random.choice(style_words),
            rhyme_a=random.choice(rhyme_a),
            rhyme_b=random.choice(rhyme_b),
            rhyme_c=random.choice(rhyme_c),
            rhyme_d=random.choice(rhyme_d)
        )
        
        # Post-processing for genre flavor
        if genre == "Reggaeton" and not is_spanish:
            lyrics = lyrics.replace("I", "Yo").replace("my", "mi").replace("the", "el") + "\n(Dale!)"
        elif genre == "Reggaeton" and is_spanish:
            lyrics += "\n(¡Dale, dale!)"
        elif genre == "Synthwave":
            if is_spanish:
                lyrics = lyrics.replace("sendero", "grid").replace("cielo", "cielo digital")
            else:
                lyrics = lyrics.replace("road", "grid").replace("sky", "digital sky")
        elif genre == "Banda" and "Coro" in sec_type:
            if random.random() > 0.5:
                lyrics += "\n(¡Eso es!)"
        elif genre == "Corridos" and "Despedida" in sec_type:
            lyrics += "\n(Compa, así es la vida)"
        elif genre == "Ranchera" and "Grito" not in sec_type and random.random() > 0.7:
            lyrics += "\n(¡Ay, jalisco!)"
        elif genre == "Cumbia" and "Coro" in sec_type:
            lyrics += "\n(¡Wepa!)"
        elif genre == "Salsa" and "Montuno" not in sec_type and "Coro" in sec_type:
            lyrics += "\n(¡Azúcar!)"
             
        song_data['sections'].append({
            "type": sec_type,
            "progression": section['progression'],
            "lyrics": lyrics
        })
        
    return song_data
