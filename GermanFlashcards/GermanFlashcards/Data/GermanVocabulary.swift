import Foundation

struct GermanVocabulary {
    // MARK: - Flashcards Database

    static let flashcards: [Flashcard] = [
        // MARK: - Greetings & Introductions (A1)
        Flashcard(
            german: "Guten Morgen",
            english: "Good morning",
            explanation: "Used to greet someone in the morning until around noon.",
            example: "Guten Morgen! Wie geht es Ihnen?",
            exampleTranslation: "Good morning! How are you?",
            category: .greetings,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Guten Tag",
            english: "Good day / Hello",
            explanation: "A formal greeting used during the day. Common in professional settings.",
            example: "Guten Tag, mein Name ist Anna.",
            exampleTranslation: "Good day, my name is Anna.",
            category: .greetings,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Guten Abend",
            english: "Good evening",
            explanation: "Used to greet someone in the evening, typically after 6 PM.",
            example: "Guten Abend! Schön, Sie zu sehen.",
            exampleTranslation: "Good evening! Nice to see you.",
            category: .greetings,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Auf Wiedersehen",
            english: "Goodbye",
            explanation: "Formal way to say goodbye. Literally means 'until we see again'.",
            example: "Auf Wiedersehen! Bis morgen!",
            exampleTranslation: "Goodbye! See you tomorrow!",
            category: .greetings,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Tschüss",
            english: "Bye",
            explanation: "Informal way to say goodbye, used among friends and family.",
            example: "Tschüss! Mach's gut!",
            exampleTranslation: "Bye! Take care!",
            category: .greetings,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Wie heißen Sie?",
            english: "What is your name? (formal)",
            explanation: "Formal way to ask someone's name. Use 'Sie' with strangers and in professional settings.",
            example: "Guten Tag! Wie heißen Sie?",
            exampleTranslation: "Good day! What is your name?",
            category: .greetings,
            difficulty: .a1,
            cardType: .sentence,
            grammarTip: "The formal 'Sie' (you) is always capitalized."
        ),
        Flashcard(
            german: "Wie heißt du?",
            english: "What is your name? (informal)",
            explanation: "Informal way to ask someone's name. Use 'du' with friends, family, and children.",
            example: "Hallo! Wie heißt du?",
            exampleTranslation: "Hello! What is your name?",
            category: .greetings,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Ich heiße...",
            english: "My name is...",
            explanation: "Used to introduce yourself. Literally means 'I am called...'",
            example: "Ich heiße Maria. Ich komme aus Deutschland.",
            exampleTranslation: "My name is Maria. I come from Germany.",
            category: .greetings,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Freut mich!",
            english: "Nice to meet you!",
            explanation: "Short for 'Es freut mich, Sie kennenzulernen.' Common response when meeting someone.",
            example: "Ich bin Thomas. - Freut mich!",
            exampleTranslation: "I am Thomas. - Nice to meet you!",
            category: .greetings,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Woher kommen Sie?",
            english: "Where are you from? (formal)",
            explanation: "Formal way to ask about someone's origin.",
            example: "Woher kommen Sie? - Ich komme aus Frankreich.",
            exampleTranslation: "Where are you from? - I come from France.",
            category: .greetings,
            difficulty: .a1,
            cardType: .sentence
        ),

        // MARK: - Numbers & Time (A1)
        Flashcard(
            german: "eins, zwei, drei",
            english: "one, two, three",
            explanation: "Basic counting numbers 1-3 in German.",
            example: "Ich habe drei Kinder.",
            exampleTranslation: "I have three children.",
            category: .numbers,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "vier, fünf, sechs",
            english: "four, five, six",
            explanation: "Counting numbers 4-6 in German.",
            example: "Der Film beginnt um sechs Uhr.",
            exampleTranslation: "The film starts at six o'clock.",
            category: .numbers,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "sieben, acht, neun, zehn",
            english: "seven, eight, nine, ten",
            explanation: "Counting numbers 7-10 in German.",
            example: "Ich arbeite von acht bis zehn.",
            exampleTranslation: "I work from eight to ten.",
            category: .numbers,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Wie viel Uhr ist es?",
            english: "What time is it?",
            explanation: "Common question to ask for the time.",
            example: "Entschuldigung, wie viel Uhr ist es?",
            exampleTranslation: "Excuse me, what time is it?",
            category: .numbers,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "halb",
            english: "half past",
            explanation: "Used for telling time. 'Halb drei' means 'half to three' (2:30), not 'half past three'!",
            example: "Es ist halb neun.",
            exampleTranslation: "It is half past eight (8:30).",
            category: .numbers,
            difficulty: .a1,
            cardType: .vocabulary,
            grammarTip: "German 'halb' refers to half TO the next hour, not half past!"
        ),
        Flashcard(
            german: "Viertel vor / Viertel nach",
            english: "Quarter to / Quarter past",
            explanation: "Used for telling time. 'Viertel vor' is quarter to, 'Viertel nach' is quarter past.",
            example: "Es ist Viertel nach sieben.",
            exampleTranslation: "It is quarter past seven (7:15).",
            category: .numbers,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Montag",
            english: "Monday",
            explanation: "Days of the week are masculine (der) in German.",
            example: "Am Montag gehe ich ins Fitnessstudio.",
            exampleTranslation: "On Monday I go to the gym.",
            category: .numbers,
            difficulty: .a1,
            cardType: .vocabulary,
            grammarTip: "Use 'am' (an + dem) before days: am Montag, am Dienstag..."
        ),
        Flashcard(
            german: "heute, morgen, gestern",
            english: "today, tomorrow, yesterday",
            explanation: "Basic time expressions used in daily conversation.",
            example: "Gestern war ich müde, aber heute geht es mir gut.",
            exampleTranslation: "Yesterday I was tired, but today I feel good.",
            category: .numbers,
            difficulty: .a1,
            cardType: .vocabulary
        ),

        // MARK: - Family & Relationships (A1)
        Flashcard(
            german: "die Familie",
            english: "the family",
            explanation: "A feminine noun. Refers to the family unit.",
            example: "Meine Familie wohnt in Berlin.",
            exampleTranslation: "My family lives in Berlin.",
            category: .family,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Mutter / der Vater",
            english: "the mother / the father",
            explanation: "Basic family terms. Mother is feminine (die), father is masculine (der).",
            example: "Meine Mutter kocht sehr gut.",
            exampleTranslation: "My mother cooks very well.",
            category: .family,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Eltern",
            english: "the parents",
            explanation: "Plural noun for parents. Always used in plural form.",
            example: "Meine Eltern sind sehr nett.",
            exampleTranslation: "My parents are very nice.",
            category: .family,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Bruder / die Schwester",
            english: "the brother / the sister",
            explanation: "Sibling terms. Brother is masculine, sister is feminine.",
            example: "Ich habe einen Bruder und zwei Schwestern.",
            exampleTranslation: "I have one brother and two sisters.",
            category: .family,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Großeltern",
            english: "the grandparents",
            explanation: "Compound word: Groß (grand/big) + Eltern (parents).",
            example: "Meine Großeltern leben auf dem Land.",
            exampleTranslation: "My grandparents live in the countryside.",
            category: .family,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Kind / die Kinder",
            english: "the child / the children",
            explanation: "Child is neuter (das). Plural is Kinder.",
            example: "Die Kinder spielen im Garten.",
            exampleTranslation: "The children are playing in the garden.",
            category: .family,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "verheiratet / ledig",
            english: "married / single",
            explanation: "Marital status terms used in forms and introductions.",
            example: "Sind Sie verheiratet? - Nein, ich bin ledig.",
            exampleTranslation: "Are you married? - No, I am single.",
            category: .family,
            difficulty: .a1,
            cardType: .vocabulary
        ),

        // MARK: - Food & Drinks (A1-A2)
        Flashcard(
            german: "das Frühstück",
            english: "breakfast",
            explanation: "Morning meal. Compound word: früh (early) + Stück (piece).",
            example: "Zum Frühstück esse ich Brot mit Käse.",
            exampleTranslation: "For breakfast I eat bread with cheese.",
            category: .food,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Mittagessen",
            english: "lunch",
            explanation: "Midday meal. Compound word: Mittag (noon) + Essen (food/meal).",
            example: "Das Mittagessen ist um 12 Uhr.",
            exampleTranslation: "Lunch is at 12 o'clock.",
            category: .food,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Abendessen",
            english: "dinner",
            explanation: "Evening meal. Compound word: Abend (evening) + Essen (food/meal).",
            example: "Was gibt es zum Abendessen?",
            exampleTranslation: "What's for dinner?",
            category: .food,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Ich möchte...",
            english: "I would like...",
            explanation: "Polite way to order or request something. Subjunctive form of 'mögen'.",
            example: "Ich möchte einen Kaffee, bitte.",
            exampleTranslation: "I would like a coffee, please.",
            category: .food,
            difficulty: .a1,
            cardType: .sentence,
            grammarTip: "'Möchte' is the polite/conditional form. Use accusative case after it."
        ),
        Flashcard(
            german: "das Brot",
            english: "bread",
            explanation: "Neuter noun. Bread is a staple in German cuisine.",
            example: "Deutsches Brot ist sehr lecker.",
            exampleTranslation: "German bread is very delicious.",
            category: .food,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Wasser / der Saft",
            english: "water / juice",
            explanation: "Water is neuter (das), juice is masculine (der).",
            example: "Möchten Sie Wasser oder Saft?",
            exampleTranslation: "Would you like water or juice?",
            category: .food,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Kaffee / der Tee",
            english: "coffee / tea",
            explanation: "Both are masculine nouns in German.",
            example: "Ich trinke morgens immer Kaffee.",
            exampleTranslation: "I always drink coffee in the morning.",
            category: .food,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Die Rechnung, bitte!",
            english: "The bill, please!",
            explanation: "Essential phrase for restaurants. 'Rechnung' is feminine.",
            example: "Entschuldigung, die Rechnung, bitte!",
            exampleTranslation: "Excuse me, the bill please!",
            category: .food,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Guten Appetit!",
            english: "Enjoy your meal!",
            explanation: "Said before eating, similar to 'Bon appétit' in French.",
            example: "Das Essen ist fertig. Guten Appetit!",
            exampleTranslation: "The food is ready. Enjoy your meal!",
            category: .food,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "lecker / köstlich",
            english: "delicious / tasty",
            explanation: "Adjectives to describe good food. 'Lecker' is more casual.",
            example: "Das schmeckt sehr lecker!",
            exampleTranslation: "This tastes very delicious!",
            category: .food,
            difficulty: .a1,
            cardType: .vocabulary
        ),

        // MARK: - Travel & Directions (A1-A2)
        Flashcard(
            german: "der Bahnhof",
            english: "train station",
            explanation: "Compound word: Bahn (train/track) + Hof (yard/station). Masculine noun.",
            example: "Der Bahnhof ist in der Stadtmitte.",
            exampleTranslation: "The train station is in the city center.",
            category: .travel,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Flughafen",
            english: "airport",
            explanation: "Compound word: Flug (flight) + Hafen (harbor/port). Masculine noun.",
            example: "Der Flughafen ist 20 Kilometer entfernt.",
            exampleTranslation: "The airport is 20 kilometers away.",
            category: .travel,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Wo ist...?",
            english: "Where is...?",
            explanation: "Basic question for asking directions.",
            example: "Entschuldigung, wo ist die Toilette?",
            exampleTranslation: "Excuse me, where is the toilet?",
            category: .travel,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "links / rechts / geradeaus",
            english: "left / right / straight ahead",
            explanation: "Essential direction words for navigation.",
            example: "Gehen Sie geradeaus und dann links.",
            exampleTranslation: "Go straight ahead and then left.",
            category: .travel,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Straße",
            english: "the street",
            explanation: "Feminine noun. Note the German letter 'ß' (Eszett).",
            example: "Die Hauptstraße ist sehr lang.",
            exampleTranslation: "The main street is very long.",
            category: .travel,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Wie komme ich zu...?",
            english: "How do I get to...?",
            explanation: "Essential phrase for asking directions to a place.",
            example: "Wie komme ich zum Bahnhof?",
            exampleTranslation: "How do I get to the train station?",
            category: .travel,
            difficulty: .a2,
            cardType: .sentence,
            grammarTip: "Use 'zu + dative' for destinations: zum (zu dem), zur (zu der)."
        ),
        Flashcard(
            german: "die U-Bahn / die S-Bahn",
            english: "subway / suburban train",
            explanation: "U-Bahn (Untergrundbahn) goes underground, S-Bahn (Schnellbahn) is faster surface transit.",
            example: "Nehmen Sie die U-Bahn Linie 3.",
            exampleTranslation: "Take subway line 3.",
            category: .travel,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Fahrkarte",
            english: "the ticket (transportation)",
            explanation: "Feminine noun. Compound: Fahrt (trip) + Karte (card/ticket).",
            example: "Ich brauche eine Fahrkarte nach München.",
            exampleTranslation: "I need a ticket to Munich.",
            category: .travel,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "einsteigen / aussteigen",
            english: "to get on / to get off",
            explanation: "Separable verbs for boarding and exiting vehicles.",
            example: "Wir steigen am Hauptbahnhof aus.",
            exampleTranslation: "We get off at the main station.",
            category: .travel,
            difficulty: .a2,
            cardType: .vocabulary,
            grammarTip: "Separable prefix verbs: the prefix goes to the end in main clauses."
        ),
        Flashcard(
            german: "umsteigen",
            english: "to transfer/change (trains)",
            explanation: "Separable verb for changing transportation.",
            example: "Sie müssen in Frankfurt umsteigen.",
            exampleTranslation: "You have to transfer in Frankfurt.",
            category: .travel,
            difficulty: .a2,
            cardType: .vocabulary
        ),

        // MARK: - Shopping & Money (A1-A2)
        Flashcard(
            german: "Wie viel kostet das?",
            english: "How much does this cost?",
            explanation: "Essential shopping phrase to ask for the price.",
            example: "Entschuldigung, wie viel kostet das T-Shirt?",
            exampleTranslation: "Excuse me, how much does the T-shirt cost?",
            category: .shopping,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "der Euro / der Cent",
            english: "the Euro / the Cent",
            explanation: "German currency. Both are masculine nouns.",
            example: "Das kostet fünf Euro fünfzig.",
            exampleTranslation: "That costs five euros fifty (cents).",
            category: .shopping,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "teuer / billig",
            english: "expensive / cheap",
            explanation: "Price adjectives. 'Günstig' (affordable) is more polite than 'billig'.",
            example: "Das ist zu teuer für mich.",
            exampleTranslation: "That is too expensive for me.",
            category: .shopping,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Kann ich mit Karte zahlen?",
            english: "Can I pay by card?",
            explanation: "Useful phrase as Germany often prefers cash payments.",
            example: "Kann ich mit Karte zahlen? - Ja, natürlich.",
            exampleTranslation: "Can I pay by card? - Yes, of course.",
            category: .shopping,
            difficulty: .a2,
            cardType: .sentence
        ),
        Flashcard(
            german: "der Supermarkt / das Geschäft",
            english: "supermarket / shop",
            explanation: "Shopping locations. Supermarkt is masculine, Geschäft is neuter.",
            example: "Der Supermarkt ist um die Ecke.",
            exampleTranslation: "The supermarket is around the corner.",
            category: .shopping,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Haben Sie...?",
            english: "Do you have...?",
            explanation: "Polite question when looking for products in a shop.",
            example: "Haben Sie diese Schuhe in Größe 42?",
            exampleTranslation: "Do you have these shoes in size 42?",
            category: .shopping,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "die Größe",
            english: "the size",
            explanation: "Feminine noun. Used for clothing and shoe sizes.",
            example: "Welche Größe haben Sie?",
            exampleTranslation: "What size do you have?",
            category: .shopping,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "anprobieren",
            english: "to try on",
            explanation: "Separable verb for trying on clothes.",
            example: "Kann ich das anprobieren?",
            exampleTranslation: "Can I try this on?",
            category: .shopping,
            difficulty: .a2,
            cardType: .vocabulary
        ),

        // MARK: - Weather & Seasons (A1-A2)
        Flashcard(
            german: "Wie ist das Wetter?",
            english: "How is the weather?",
            explanation: "Common question about weather conditions.",
            example: "Wie ist das Wetter heute? - Es regnet.",
            exampleTranslation: "How is the weather today? - It's raining.",
            category: .weather,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Es ist sonnig / bewölkt",
            english: "It is sunny / cloudy",
            explanation: "Weather descriptions. German uses 'Es ist...' (It is...) for weather.",
            example: "Heute ist es sonnig und warm.",
            exampleTranslation: "Today it is sunny and warm.",
            category: .weather,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Es regnet / Es schneit",
            english: "It's raining / It's snowing",
            explanation: "Impersonal verbs for precipitation. Always use 'es' as subject.",
            example: "Es regnet seit drei Tagen.",
            exampleTranslation: "It has been raining for three days.",
            category: .weather,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "heiß / warm / kalt",
            english: "hot / warm / cold",
            explanation: "Temperature adjectives for weather and other contexts.",
            example: "Im Sommer ist es sehr heiß.",
            exampleTranslation: "In summer it is very hot.",
            category: .weather,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Frühling / der Sommer",
            english: "spring / summer",
            explanation: "Seasons are masculine nouns in German. Use 'im' (in dem) before seasons.",
            example: "Im Frühling blühen die Blumen.",
            exampleTranslation: "In spring the flowers bloom.",
            category: .weather,
            difficulty: .a1,
            cardType: .vocabulary,
            grammarTip: "All seasons are masculine: der Frühling, der Sommer, der Herbst, der Winter."
        ),
        Flashcard(
            german: "der Herbst / der Winter",
            english: "autumn / winter",
            explanation: "Seasons are masculine nouns. 'Herbst' is cognate with 'harvest'.",
            example: "Im Herbst werden die Blätter bunt.",
            exampleTranslation: "In autumn the leaves become colorful.",
            category: .weather,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Grad",
            english: "degree (temperature)",
            explanation: "Masculine noun. Used with numbers for temperature.",
            example: "Es sind 25 Grad Celsius.",
            exampleTranslation: "It is 25 degrees Celsius.",
            category: .weather,
            difficulty: .a2,
            cardType: .vocabulary
        ),

        // MARK: - Health & Body (A1-A2)
        Flashcard(
            german: "Wie geht es Ihnen?",
            english: "How are you? (formal)",
            explanation: "Formal way to ask about someone's wellbeing. Uses dative case (Ihnen).",
            example: "Guten Tag! Wie geht es Ihnen? - Gut, danke!",
            exampleTranslation: "Good day! How are you? - Good, thank you!",
            category: .health,
            difficulty: .a1,
            cardType: .sentence,
            grammarTip: "'Wie geht es' requires dative: Ihnen (formal), dir (informal)."
        ),
        Flashcard(
            german: "Mir geht es gut / schlecht",
            english: "I am well / unwell",
            explanation: "Response to 'Wie geht es dir/Ihnen?' Uses dative 'mir' (to me).",
            example: "Wie geht es dir? - Mir geht es sehr gut!",
            exampleTranslation: "How are you? - I am very well!",
            category: .health,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "der Kopf",
            english: "the head",
            explanation: "Masculine noun. Part of the body.",
            example: "Ich habe Kopfschmerzen.",
            exampleTranslation: "I have a headache.",
            category: .health,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Ich habe Schmerzen",
            english: "I have pain",
            explanation: "'Schmerzen' (pain) is usually plural. Often combined with body part.",
            example: "Ich habe Bauchschmerzen.",
            exampleTranslation: "I have stomach pain.",
            category: .health,
            difficulty: .a2,
            cardType: .sentence
        ),
        Flashcard(
            german: "der Arzt / die Ärztin",
            english: "doctor (m) / doctor (f)",
            explanation: "Masculine and feminine forms. Note the umlaut in feminine form.",
            example: "Ich muss zum Arzt gehen.",
            exampleTranslation: "I have to go to the doctor.",
            category: .health,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Apotheke",
            english: "pharmacy",
            explanation: "Feminine noun. German pharmacies are marked with a red 'A'.",
            example: "Die Apotheke ist neben dem Supermarkt.",
            exampleTranslation: "The pharmacy is next to the supermarket.",
            category: .health,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Ich bin krank / gesund",
            english: "I am sick / healthy",
            explanation: "Basic health status expressions.",
            example: "Ich bin krank. Ich bleibe heute zu Hause.",
            exampleTranslation: "I am sick. I am staying home today.",
            category: .health,
            difficulty: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "das Medikament",
            english: "medicine/medication",
            explanation: "Neuter noun. Plural is 'Medikamente'.",
            example: "Nehmen Sie dieses Medikament dreimal täglich.",
            exampleTranslation: "Take this medicine three times daily.",
            category: .health,
            difficulty: .a2,
            cardType: .vocabulary
        ),

        // MARK: - Work & Education (A1-A2)
        Flashcard(
            german: "Was sind Sie von Beruf?",
            english: "What is your profession?",
            explanation: "Formal way to ask about someone's job.",
            example: "Was sind Sie von Beruf? - Ich bin Lehrer.",
            exampleTranslation: "What is your profession? - I am a teacher.",
            category: .work,
            difficulty: .a1,
            cardType: .sentence,
            grammarTip: "No article before professions: 'Ich bin Lehrer' not 'Ich bin ein Lehrer'."
        ),
        Flashcard(
            german: "Ich arbeite als...",
            english: "I work as...",
            explanation: "Use 'als' to indicate your profession/role.",
            example: "Ich arbeite als Ingenieur bei Siemens.",
            exampleTranslation: "I work as an engineer at Siemens.",
            category: .work,
            difficulty: .a2,
            cardType: .sentence
        ),
        Flashcard(
            german: "das Büro",
            english: "the office",
            explanation: "Neuter noun. Workplace for many professionals.",
            example: "Ich gehe um 9 Uhr ins Büro.",
            exampleTranslation: "I go to the office at 9 o'clock.",
            category: .work,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Schule / die Universität",
            english: "school / university",
            explanation: "Educational institutions. Both are feminine nouns.",
            example: "Mein Sohn geht in die Schule.",
            exampleTranslation: "My son goes to school.",
            category: .work,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "lernen / studieren",
            english: "to learn / to study (at university)",
            explanation: "'Lernen' is general learning, 'studieren' specifically means university study.",
            example: "Ich studiere Medizin in Berlin.",
            exampleTranslation: "I study medicine in Berlin.",
            category: .work,
            difficulty: .a1,
            cardType: .vocabulary,
            grammarTip: "'Studieren' is only for university. For school subjects, use 'lernen'."
        ),
        Flashcard(
            german: "der Lehrer / die Lehrerin",
            english: "teacher (m) / teacher (f)",
            explanation: "Teaching profession with gendered forms.",
            example: "Meine Lehrerin ist sehr nett.",
            exampleTranslation: "My teacher (f) is very nice.",
            category: .work,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Besprechung / das Meeting",
            english: "meeting",
            explanation: "'Besprechung' is German, 'Meeting' is borrowed English. Both are common.",
            example: "Ich habe um 14 Uhr eine Besprechung.",
            exampleTranslation: "I have a meeting at 2 PM.",
            category: .work,
            difficulty: .a2,
            cardType: .vocabulary
        ),

        // MARK: - Hobbies & Free Time (A1-A2)
        Flashcard(
            german: "Was machst du gern?",
            english: "What do you like to do?",
            explanation: "Question about hobbies/interests. 'Gern' indicates liking/enjoyment.",
            example: "Was machst du gern? - Ich lese gern.",
            exampleTranslation: "What do you like to do? - I like to read.",
            category: .hobbies,
            difficulty: .a1,
            cardType: .sentence,
            grammarTip: "'Gern' after the verb indicates enjoyment: 'Ich spiele gern Fußball'."
        ),
        Flashcard(
            german: "Sport treiben",
            english: "to do sports",
            explanation: "Expression for engaging in sports activities.",
            example: "Ich treibe jeden Tag Sport.",
            exampleTranslation: "I do sports every day.",
            category: .hobbies,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Musik hören",
            english: "to listen to music",
            explanation: "Common hobby expression. 'Hören' means to hear/listen.",
            example: "Ich höre gern klassische Musik.",
            exampleTranslation: "I like to listen to classical music.",
            category: .hobbies,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "lesen / schreiben",
            english: "to read / to write",
            explanation: "Common hobby verbs. Both are strong (irregular) verbs.",
            example: "Ich lese jeden Abend ein Buch.",
            exampleTranslation: "I read a book every evening.",
            category: .hobbies,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "schwimmen / wandern",
            english: "to swim / to hike",
            explanation: "Outdoor activity verbs. 'Wandern' is very popular in German-speaking countries.",
            example: "Am Wochenende gehe ich wandern.",
            exampleTranslation: "On the weekend I go hiking.",
            category: .hobbies,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Kino / das Theater",
            english: "cinema / theater",
            explanation: "Entertainment venues. Both are neuter nouns.",
            example: "Gehen wir heute Abend ins Kino?",
            exampleTranslation: "Shall we go to the cinema tonight?",
            category: .hobbies,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "kochen / backen",
            english: "to cook / to bake",
            explanation: "Culinary hobby verbs. 'Kochen' for general cooking, 'backen' for baking.",
            example: "Ich koche gern italienisch.",
            exampleTranslation: "I like to cook Italian.",
            category: .hobbies,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "fotografieren",
            english: "to photograph / take photos",
            explanation: "Hobby verb for photography.",
            example: "Ich fotografiere gern Landschaften.",
            exampleTranslation: "I like to photograph landscapes.",
            category: .hobbies,
            difficulty: .a2,
            cardType: .vocabulary
        ),

        // MARK: - Home & Living (A1-A2)
        Flashcard(
            german: "die Wohnung / das Haus",
            english: "apartment / house",
            explanation: "'Wohnung' (f) is an apartment, 'Haus' (n) is a house.",
            example: "Ich wohne in einer kleinen Wohnung.",
            exampleTranslation: "I live in a small apartment.",
            category: .home,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Zimmer",
            english: "room",
            explanation: "Neuter noun. Used in compounds: Schlafzimmer, Wohnzimmer, etc.",
            example: "Die Wohnung hat drei Zimmer.",
            exampleTranslation: "The apartment has three rooms.",
            category: .home,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Küche / das Bad",
            english: "kitchen / bathroom",
            explanation: "Kitchen is feminine, bathroom is neuter.",
            example: "Die Küche ist sehr modern.",
            exampleTranslation: "The kitchen is very modern.",
            category: .home,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Schlafzimmer / das Wohnzimmer",
            english: "bedroom / living room",
            explanation: "Compound nouns: Schlaf (sleep) + Zimmer, Wohn (living) + Zimmer.",
            example: "Das Wohnzimmer ist sehr gemütlich.",
            exampleTranslation: "The living room is very cozy.",
            category: .home,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die Miete",
            english: "rent",
            explanation: "Feminine noun. Monthly payment for housing.",
            example: "Wie hoch ist die Miete?",
            exampleTranslation: "How much is the rent?",
            category: .home,
            difficulty: .a2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Tisch / der Stuhl",
            english: "table / chair",
            explanation: "Basic furniture. Both are masculine nouns.",
            example: "Der Tisch steht in der Mitte.",
            exampleTranslation: "The table is in the middle.",
            category: .home,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Bett / der Schrank",
            english: "bed / closet/wardrobe",
            explanation: "Bedroom furniture. Bed is neuter, wardrobe is masculine.",
            example: "Das Bett ist sehr bequem.",
            exampleTranslation: "The bed is very comfortable.",
            category: .home,
            difficulty: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "aufräumen / putzen",
            english: "to tidy up / to clean",
            explanation: "Household chores. 'Aufräumen' is separable.",
            example: "Ich muss mein Zimmer aufräumen.",
            exampleTranslation: "I have to tidy up my room.",
            category: .home,
            difficulty: .a2,
            cardType: .vocabulary
        ),

        // MARK: - Grammar Essentials (A1-A2)
        Flashcard(
            german: "der / die / das",
            english: "the (masculine / feminine / neuter)",
            explanation: "German definite articles must match noun gender. This is essential to learn!",
            example: "der Mann, die Frau, das Kind",
            exampleTranslation: "the man, the woman, the child",
            category: .grammar,
            difficulty: .a1,
            cardType: .grammar,
            grammarTip: "Learn every noun WITH its article. There's no reliable rule for genders."
        ),
        Flashcard(
            german: "ein / eine / ein",
            english: "a/an (masculine / feminine / neuter)",
            explanation: "Indefinite articles. Masculine and neuter share 'ein', feminine uses 'eine'.",
            example: "ein Tisch, eine Lampe, ein Buch",
            exampleTranslation: "a table, a lamp, a book",
            category: .grammar,
            difficulty: .a1,
            cardType: .grammar
        ),
        Flashcard(
            german: "Nominativ / Akkusativ",
            english: "Nominative / Accusative case",
            explanation: "Nominative = subject, Accusative = direct object. Only masculine articles change.",
            example: "Der Mann (nom.) sieht den Hund (acc.).",
            exampleTranslation: "The man sees the dog.",
            category: .grammar,
            difficulty: .a1,
            cardType: .grammar,
            grammarTip: "Only MASCULINE changes: der→den, ein→einen. Feminine and neuter stay the same."
        ),
        Flashcard(
            german: "Dativ",
            english: "Dative case",
            explanation: "Used for indirect objects and with certain prepositions and verbs.",
            example: "Ich gebe dem Mann das Buch.",
            exampleTranslation: "I give the book to the man.",
            category: .grammar,
            difficulty: .a2,
            cardType: .grammar,
            grammarTip: "Dative: dem (m), der (f), dem (n), den (pl). Plural nouns add -n."
        ),
        Flashcard(
            german: "Ich bin / du bist / er ist",
            english: "I am / you are / he is",
            explanation: "Conjugation of 'sein' (to be) - the most important irregular verb.",
            example: "Ich bin müde. Du bist nett. Er ist groß.",
            exampleTranslation: "I am tired. You are nice. He is tall.",
            category: .grammar,
            difficulty: .a1,
            cardType: .grammar
        ),
        Flashcard(
            german: "Ich habe / du hast / er hat",
            english: "I have / you have / he has",
            explanation: "Conjugation of 'haben' (to have) - essential auxiliary verb.",
            example: "Ich habe Zeit. Du hast Recht. Er hat Hunger.",
            exampleTranslation: "I have time. You are right. He is hungry.",
            category: .grammar,
            difficulty: .a1,
            cardType: .grammar
        ),
        Flashcard(
            german: "nicht / kein",
            english: "not / no (negation)",
            explanation: "'Nicht' negates verbs/adjectives, 'kein' negates nouns with ein/eine.",
            example: "Ich habe kein Auto. Ich fahre nicht.",
            exampleTranslation: "I don't have a car. I don't drive.",
            category: .grammar,
            difficulty: .a1,
            cardType: .grammar,
            grammarTip: "Use 'kein' instead of 'nicht ein': 'Ich habe kein Geld' not 'nicht ein Geld'."
        ),
        Flashcard(
            german: "Modalverben: können, müssen, wollen",
            english: "Modal verbs: can, must, want",
            explanation: "Modal verbs modify other verbs. Main verb goes to the end in infinitive form.",
            example: "Ich kann schwimmen. Ich muss arbeiten.",
            exampleTranslation: "I can swim. I have to work.",
            category: .grammar,
            difficulty: .a2,
            cardType: .grammar,
            grammarTip: "Modal verb is conjugated, main verb stays infinitive at the END."
        ),
        Flashcard(
            german: "Perfekt: haben/sein + Partizip II",
            english: "Perfect tense: have/be + past participle",
            explanation: "German past tense for conversation. Use 'haben' for most verbs, 'sein' for movement/change.",
            example: "Ich habe gegessen. Ich bin gegangen.",
            exampleTranslation: "I ate (have eaten). I went (have gone).",
            category: .grammar,
            difficulty: .a2,
            cardType: .grammar,
            grammarTip: "Use 'sein' for: movement (gehen, fahren), change of state (werden, sterben), and sein/bleiben."
        ),
        Flashcard(
            german: "Trennbare Verben",
            english: "Separable verbs",
            explanation: "Verbs with prefixes that separate in main clauses. Prefix goes to the end.",
            example: "aufstehen → Ich stehe um 7 Uhr auf.",
            exampleTranslation: "to get up → I get up at 7 o'clock.",
            category: .grammar,
            difficulty: .a2,
            cardType: .grammar,
            grammarTip: "Common separable prefixes: an-, auf-, aus-, ein-, mit-, vor-, zu-"
        ),
    ]

    // MARK: - Swipe Sentences (Correct/Incorrect German)

    static let swipeSentences: [SwipeSentence] = [
        // Correct sentences
        SwipeSentence(
            sentence: "Ich habe einen Hund.",
            translation: "I have a dog.",
            isCorrect: true,
            explanation: "Correct! 'Hund' is masculine, so it takes 'einen' in the accusative case after 'haben'.",
            correctVersion: nil
        ),
        SwipeSentence(
            sentence: "Die Frau liest ein Buch.",
            translation: "The woman reads a book.",
            isCorrect: true,
            explanation: "Correct! Subject (die Frau) + verb (liest) + object (ein Buch). 'Buch' is neuter, so 'ein' stays unchanged in accusative.",
            correctVersion: nil
        ),
        SwipeSentence(
            sentence: "Ich bin müde.",
            translation: "I am tired.",
            isCorrect: true,
            explanation: "Correct! 'Sein' (to be) conjugates to 'bin' for 'ich'. Adjectives don't need endings after 'sein'.",
            correctVersion: nil
        ),
        SwipeSentence(
            sentence: "Er geht in die Schule.",
            translation: "He goes to school.",
            isCorrect: true,
            explanation: "Correct! 'In' + accusative shows movement towards. 'Schule' is feminine, so 'die' remains 'die' in accusative.",
            correctVersion: nil
        ),
        SwipeSentence(
            sentence: "Wir haben kein Geld.",
            translation: "We have no money.",
            isCorrect: true,
            explanation: "Correct! 'Kein' negates nouns. 'Geld' is neuter, so 'kein' takes no ending in accusative.",
            correctVersion: nil
        ),
        SwipeSentence(
            sentence: "Ich muss morgen arbeiten.",
            translation: "I have to work tomorrow.",
            isCorrect: true,
            explanation: "Correct! Modal verb 'müssen' is conjugated, infinitive 'arbeiten' goes to the end.",
            correctVersion: nil
        ),
        SwipeSentence(
            sentence: "Das Essen schmeckt gut.",
            translation: "The food tastes good.",
            isCorrect: true,
            explanation: "Correct! 'Essen' is neuter (das), and 'schmecken' is correctly conjugated for third person singular.",
            correctVersion: nil
        ),
        SwipeSentence(
            sentence: "Sie gibt dem Kind einen Apfel.",
            translation: "She gives the child an apple.",
            isCorrect: true,
            explanation: "Correct! Dative (dem Kind = indirect object) + Accusative (einen Apfel = direct object). Perfect use of cases!",
            correctVersion: nil
        ),

        // Incorrect sentences
        SwipeSentence(
            sentence: "Ich habe ein Hund.",
            translation: "I have a dog.",
            isCorrect: false,
            explanation: "'Hund' is masculine! After 'haben', we need accusative case. Masculine 'ein' becomes 'einen' in accusative.",
            correctVersion: "Ich habe einen Hund."
        ),
        SwipeSentence(
            sentence: "Die Mann ist groß.",
            translation: "The man is tall.",
            isCorrect: false,
            explanation: "'Mann' is masculine, so it needs 'der', not 'die'. Article must match noun gender!",
            correctVersion: "Der Mann ist groß."
        ),
        SwipeSentence(
            sentence: "Ich geht nach Hause.",
            translation: "I go home.",
            isCorrect: false,
            explanation: "Verb conjugation error! 'Gehen' with 'ich' becomes 'gehe', not 'geht'. 'Geht' is for er/sie/es.",
            correctVersion: "Ich gehe nach Hause."
        ),
        SwipeSentence(
            sentence: "Er haben zwei Kinder.",
            translation: "He has two children.",
            isCorrect: false,
            explanation: "Verb conjugation error! 'Haben' with 'er' becomes 'hat'. 'Haben' is the infinitive or wir/sie/Sie form.",
            correctVersion: "Er hat zwei Kinder."
        ),
        SwipeSentence(
            sentence: "Ich bin kommen gestern.",
            translation: "I came yesterday.",
            isCorrect: false,
            explanation: "Word order and tense error! Perfekt needs: auxiliary + ... + participle at end. Also 'kommen' uses 'sein' and becomes 'gekommen'.",
            correctVersion: "Ich bin gestern gekommen."
        ),
        SwipeSentence(
            sentence: "Das Buch ist auf der Tisch.",
            translation: "The book is on the table.",
            isCorrect: false,
            explanation: "'Auf' + location (no movement) = dative case. 'Tisch' is masculine, so 'der' becomes 'dem' in dative.",
            correctVersion: "Das Buch ist auf dem Tisch."
        ),
        SwipeSentence(
            sentence: "Sie nicht arbeitet heute.",
            translation: "She doesn't work today.",
            isCorrect: false,
            explanation: "Word order error! 'Nicht' goes after the conjugated verb in simple sentences, and the verb must be in position 2.",
            correctVersion: "Sie arbeitet heute nicht."
        ),
        SwipeSentence(
            sentence: "Ich möchte ein Kaffee.",
            translation: "I would like a coffee.",
            isCorrect: false,
            explanation: "'Kaffee' is masculine! In accusative after 'möchten', masculine 'ein' becomes 'einen'.",
            correctVersion: "Ich möchte einen Kaffee."
        ),
        SwipeSentence(
            sentence: "Wir fahren nach die Stadt.",
            translation: "We drive to the city.",
            isCorrect: false,
            explanation: "'Nach' is used for cities/countries without articles, or means 'after'. For 'to the city', use 'in die Stadt' (accusative for movement).",
            correctVersion: "Wir fahren in die Stadt."
        ),
        SwipeSentence(
            sentence: "Ich stehe auf um 7 Uhr.",
            translation: "I get up at 7 o'clock.",
            isCorrect: false,
            explanation: "Word order with separable verbs! Time expressions go BEFORE the separable prefix at the end.",
            correctVersion: "Ich stehe um 7 Uhr auf."
        ),
        SwipeSentence(
            sentence: "Das Kind spielt in den Garten.",
            translation: "The child plays in the garden.",
            isCorrect: false,
            explanation: "'In' + location (no movement) = dative case. 'Garten' is masculine, so we need 'dem' not 'den' for dative.",
            correctVersion: "Das Kind spielt in dem/im Garten."
        ),
        SwipeSentence(
            sentence: "Ich habe gestern mein Freund gesehen.",
            translation: "I saw my friend yesterday.",
            isCorrect: false,
            explanation: "'Freund' is masculine, needs accusative after 'sehen'. 'Mein' becomes 'meinen' in masculine accusative.",
            correctVersion: "Ich habe gestern meinen Freund gesehen."
        ),
        SwipeSentence(
            sentence: "Er kann nicht zu schwimmen.",
            translation: "He cannot swim.",
            isCorrect: false,
            explanation: "Modal verbs take infinitive WITHOUT 'zu'! The 'zu' is not needed before the infinitive after modal verbs.",
            correctVersion: "Er kann nicht schwimmen."
        ),
        SwipeSentence(
            sentence: "Die Kinder sind in das Schule.",
            translation: "The children are at school.",
            isCorrect: false,
            explanation: "Two errors: 1) 'Schule' is feminine (die, not das), 2) Location uses dative: 'in der Schule'.",
            correctVersion: "Die Kinder sind in der Schule."
        ),
        SwipeSentence(
            sentence: "Mir gefällt die Musik.",
            translation: "I like the music.",
            isCorrect: true,
            explanation: "Correct! 'Gefallen' takes dative for the person who likes something. 'Mir' is dative of 'ich'.",
            correctVersion: nil
        ),
        SwipeSentence(
            sentence: "Ich gefalle die Musik.",
            translation: "I like the music.",
            isCorrect: false,
            explanation: "'Gefallen' is used differently! The thing that is liked is the subject. Person who likes is in dative case.",
            correctVersion: "Mir gefällt die Musik."
        ),
    ]

    // MARK: - Helper Methods

    static func flashcards(for category: Category) -> [Flashcard] {
        flashcards.filter { $0.category == category }
    }

    static func flashcards(for difficulty: DifficultyLevel) -> [Flashcard] {
        flashcards.filter { $0.difficulty == difficulty }
    }

    static func generateQuizQuestion(from flashcard: Flashcard, allFlashcards: [Flashcard]) -> QuizQuestion {
        let questionTypes: [QuizQuestion.QuestionType] = [.germanToEnglish, .englishToGerman]
        let questionType = questionTypes.randomElement()!

        let correctAnswer: String
        let question: String

        switch questionType {
        case .germanToEnglish:
            correctAnswer = flashcard.english
            let wrongOptions = allFlashcards
                .filter { $0.id != flashcard.id }
                .shuffled()
                .prefix(3)
                .map { $0.english }
            var options = Array(wrongOptions) + [correctAnswer]
            options.shuffle()
            return QuizQuestion(flashcard: flashcard, questionType: questionType, options: options, correctAnswer: correctAnswer)

        case .englishToGerman:
            correctAnswer = flashcard.german
            let wrongOptions = allFlashcards
                .filter { $0.id != flashcard.id }
                .shuffled()
                .prefix(3)
                .map { $0.german }
            var options = Array(wrongOptions) + [correctAnswer]
            options.shuffle()
            return QuizQuestion(flashcard: flashcard, questionType: questionType, options: options, correctAnswer: correctAnswer)

        default:
            correctAnswer = flashcard.english
            let wrongOptions = allFlashcards
                .filter { $0.id != flashcard.id }
                .shuffled()
                .prefix(3)
                .map { $0.english }
            var options = Array(wrongOptions) + [correctAnswer]
            options.shuffle()
            return QuizQuestion(flashcard: flashcard, questionType: questionType, options: options, correctAnswer: correctAnswer)
        }
    }
}
