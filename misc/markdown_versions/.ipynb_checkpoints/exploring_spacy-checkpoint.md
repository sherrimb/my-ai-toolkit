# File path: ./.ipynb_checkpoints/exploring_spacy-checkpoint.ipynb


## **1. Introduction to spaCy**

spaCy is an open-source NLP library used for text processing tasks such as tokenization, named entity recognition (NER), part-of-speech (POS) tagging, dependency parsing, and more.

### Glossary:
* **spaCy**  
A free tool (or software) that helps computers understand and process human language. It’s used in things like chatbots, analyzing text, and automatically sorting information from documents.

* **NLP (Natural Language Processing)**  
A way to teach computers to understand and work with human language, like reading, writing, and even translating. Think of it as the technology behind voice assistants like Siri or Google Assistant.

* **Text Processing**  
The act of breaking down and organizing text so that a computer can understand and work with it. Examples include separating sentences, finding key words, and identifying important names or dates.

* **Tokenization**  
The process of splitting a sentence into individual words or phrases. For example, turning **"I love coding!"** into **["I", "love", "coding", "!"]** so a computer can analyze each part.

* **Named Entity Recognition (NER)**  
A technique that helps a computer find and label important names in text, like people’s names, company names, dates, and locations. Example: In **"Apple was founded by Steve Jobs in 1976."**, the computer would recognize:
   - **"Apple"** as a company  
   - **"Steve Jobs"** as a person  
   - **"1976"** as a date  <br>
<br>
* **Part-of-Speech (POS) Tagging**  
A process where a computer labels each word in a sentence with its type (noun, verb, adjective, etc.). Example:  
   - **"The quick brown fox jumps over the lazy dog."**  
   - "The" → **Determiner**  
   - "quick" → **Adjective**  
   - "fox" → **Noun**  
   - "jumps" → **Verb**  
<br>
<br>
* **Dependency Parsing**  
A way for a computer to figure out how words in a sentence are related. For example, in **"The cat sat on the mat."**, the computer learns that:
   - "cat" is the subject of "sat"  
   - "on" connects "sat" to "mat"  

This helps AI understand sentence structure, making it more effective at understanding meaning.


## **2. Installing spaCy**

### **2.1 Installing via pip**
```python
pip install -U pip setuptools wheel
pip install -U spacy
```

### **2.2 Installing via Conda**
```python
conda install -c conda-forge spacy
```

### **2.3 Installing a Specific Model**
spaCy requires language models for processing text. You can install a small English model:
```python
python -m spacy download en_core_web_sm
```

To load and use the model:



```python
import spacy
nlp = spacy.load('en_core_web_sm')
doc = nlp("spaCy is an amazing NLP library!")
print([token.text for token in doc])
```

    ['spaCy', 'is', 'an', 'amazing', 'NLP', 'library', '!']


## **3. Tokenization**
* Tokenization is *splitting* text into *meaningful* **units** (tokens).


```python
doc1 = nlp("spaCy is great for various NLP tasks!")
print("Tokens:", [token.text for token in doc])
```

    Tokens: ['spaCy', 'is', 'an', 'amazing', 'NLP', 'library', '!']


## **4. Part of Speech (POS) Tagging**
* POS tagging is the process of assigning labels to tokens.


```python
for token in doc1:
    print(f"{token.text} -> {token.pos_} ({token.tag_})")
```

    spaCy -> NUM (CD)
    is -> AUX (VBZ)
    great -> ADJ (JJ)
    for -> ADP (IN)
    various -> ADJ (JJ)
    NLP -> PROPN (NNP)
    tasks -> NOUN (NNS)
    ! -> PUNCT (.)


## **5. Named Entity Recognition (NER)**
* Named Entity Recognition allows us to *extract* entities like **persons, locations, organizations, etc.**



```python
text = "Apple was founded by Steve Jobs in California."
doc2 = nlp(text)
```


```python
for ent in doc2.ents:
    print(f"{ent.text} -> {ent.label_} ({spacy.explain(ent.label_)})")
```

    Apple -> ORG (Companies, agencies, institutions, etc.)
    Steve Jobs -> PERSON (People, including fictional)
    California -> GPE (Countries, cities, states)


## **6. Dependency Parsing**
* Analyzes grammatical structure of sentences.


```python
for token in doc:
    print(f"{token.text} -> {token.dep_} (head: {token.head.text})")

```

    spaCy -> nsubj (head: is)
    is -> ROOT (head: is)
    an -> det (head: library)
    amazing -> amod (head: library)
    NLP -> compound (head: library)
    library -> attr (head: is)
    ! -> punct (head: is)


## **7. Lemmatization**
* Reduces words to their base form.


```python
print("Doc Lemmas:", [(token.text, token.lemma_) for token in doc])
print("Doc1 Lemmas:", [(token.text, token.lemma_) for token in doc1])
print("Doc2 Lemmas:", [(token.text, token.lemma_) for token in doc2])

```

    Doc Lemmas: [('spaCy', 'spacy'), ('is', 'be'), ('an', 'an'), ('amazing', 'amazing'), ('NLP', 'NLP'), ('library', 'library'), ('!', '!')]
    Doc1 Lemmas: [('spaCy', 'spacy'), ('is', 'be'), ('great', 'great'), ('for', 'for'), ('various', 'various'), ('NLP', 'NLP'), ('tasks', 'task'), ('!', '!')]
    Doc2 Lemmas: [('Apple', 'Apple'), ('was', 'be'), ('founded', 'found'), ('by', 'by'), ('Steve', 'Steve'), ('Jobs', 'Jobs'), ('in', 'in'), ('California', 'California'), ('.', '.')]


## **8. Stopword Removal**
* Stopwords are *common* words that are usually removed in NLP...


```python
from spacy.lang.en.stop_words import STOP_WORDS

```


```python
filtered_tokens = [token.text for token in doc if not token.is_stop]
print(doc)
print("Filtered tokens:", filtered_tokens)

```

    spaCy is a great NLP tool.
    Filtered tokens: ['spaCy', 'great', 'NLP', 'tool', '.']


## **9. Custom Named Entity Recognition**
You can add custom entities using `EntityRuler`.



```python
from spacy.pipeline import EntityRuler
nlp = spacy.load("en_core_web_sm")
ruler = nlp.add_pipe("entity_ruler", before="ner")
patterns = [{"label": "SOFTWARE", "pattern": "spaCy"}]
ruler.add_patterns(patterns)

doc = nlp("spaCy is a great NLP tool.")
print([(ent.text, ent.label_) for ent in doc.ents])
```

    [('spaCy', 'SOFTWARE'), ('NLP', 'ORG')]


## **10. Saving and Loading Custom Models**
* Train and save a custom model:


```python
nlp.to_disk("my_spacy_model")
# Load model
nlp2 = spacy.load("my_spacy_model")
```

## **11. Exporting Processed Data**
* You can export tokenized text, entities, or POS tags for further processing.


```python
import json
output = [{"text": token.text, "lemma": token.lemma_, "pos": token.pos_} for token in doc2]
print(json.dumps(output, indent=2))
```

    [
      {
        "text": "Apple",
        "lemma": "Apple",
        "pos": "PROPN"
      },
      {
        "text": "was",
        "lemma": "be",
        "pos": "AUX"
      },
      {
        "text": "founded",
        "lemma": "found",
        "pos": "VERB"
      },
      {
        "text": "by",
        "lemma": "by",
        "pos": "ADP"
      },
      {
        "text": "Steve",
        "lemma": "Steve",
        "pos": "PROPN"
      },
      {
        "text": "Jobs",
        "lemma": "Jobs",
        "pos": "PROPN"
      },
      {
        "text": "in",
        "lemma": "in",
        "pos": "ADP"
      },
      {
        "text": "California",
        "lemma": "California",
        "pos": "PROPN"
      },
      {
        "text": ".",
        "lemma": ".",
        "pos": "PUNCT"
      }
    ]



```python

```
