import re
from collections import Counter
from textblob import TextBlob
import requests
from bs4 import BeautifulSoup

def analyze_references(text_input):
    """
    Analyzes input text or URLs to extract stylistic features.
    """
    profile = {
        "vibe": "Neutral",
        "top_words": [],
        "sentiment": 0
    }
    
    if not text_input:
        return profile
        
    # Check if input is likely a URL
    text_content = ""
    lines = text_input.split('\n')
    for line in lines:
        if line.strip().startswith('http'):
            try:
                # Simple scrape attempt
                resp = requests.get(line.strip(), headers={'User-Agent': 'Mozilla/5.0'})
                if resp.status_code == 200:
                    soup = BeautifulSoup(resp.content, 'html.parser')
                    # Naively grab paragraphs - in a real app, specialized extractors for Genius/AZLyrics would be used
                    text_content += " ".join([p.text for p in soup.find_all('p')])
            except:
                pass
        else:
            text_content += line + " "
            
    if not text_content:
        return profile

    # Sentiment Analysis
    blob = TextBlob(text_content)
    profile['sentiment'] = blob.sentiment.polarity
    
    if profile['sentiment'] < -0.3:
        profile['vibe'] = "Dark/Sad"
    elif profile['sentiment'] > 0.3:
        profile['vibe'] = "Bright/Happy"
    else:
        profile['vibe'] = "Neutral/Mixed"
        
    # Vocabulary Extraction (Simple Frequency)
    words = re.findall(r'\b[a-z]{4,}\b', text_content.lower())
    # Filter common stop words (naive list)
    stop_words = set(['that', 'this', 'what', 'with', 'from', 'have', 'they', 'will', 'your', 'just', 'when', 'make', 'like', 'know', 'time', 'yeah', 'baby'])
    filtered_words = [w for w in words if w not in stop_words]
    
    common = Counter(filtered_words).most_common(20)
    profile['top_words'] = [w[0] for w in common]
    
    return profile
