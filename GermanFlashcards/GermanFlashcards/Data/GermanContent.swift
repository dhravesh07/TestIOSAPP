import Foundation

/// Central German learning content database
/// Organized by grammar topics with CEFR level progression
struct GermanContent {

    // MARK: - All Flashcards

    static let flashcards: [Flashcard] = {
        var cards: [Flashcard] = []
        cards.append(contentsOf: articlesCards)
        cards.append(contentsOf: nounsCards)
        cards.append(contentsOf: pronounsCards)
        cards.append(contentsOf: verbsCards)
        cards.append(contentsOf: modalVerbsCards)
        cards.append(contentsOf: separableVerbsCards)
        cards.append(contentsOf: casesCards)
        cards.append(contentsOf: prepositionsCards)
        cards.append(contentsOf: connectorsCards)
        cards.append(contentsOf: negationCards)
        cards.append(contentsOf: questionsCards)
        cards.append(contentsOf: tenseCards)
        cards.append(contentsOf: vocabularyCards)
        cards.append(contentsOf: greetingsCards)
        cards.append(contentsOf: numbersCards)
        cards.append(contentsOf: timeCards)
        cards.append(contentsOf: b1GrammarCards)
        cards.append(contentsOf: b2GrammarCards)
        cards.append(contentsOf: expandedVocabularyCards)
        return cards
    }()

    // MARK: - Articles (der/die/das)

    static let articlesCards: [Flashcard] = [
        Flashcard(
            german: "der Mann",
            english: "the man",
            explanation: "Masculine nouns use 'der'. Most nouns ending in -er, -en, -el referring to male persons are masculine.",
            example: "Der Mann liest eine Zeitung.",
            exampleTranslation: "The man reads a newspaper.",
            grammarTopics: [.articles, .nouns, .nominative],
            thematicCategory: .family,
            level: .a1,
            cardType: .vocabulary,
            grammarTip: "der = masculine, die = feminine, das = neuter"
        ),
        Flashcard(
            german: "die Frau",
            english: "the woman",
            explanation: "Feminine nouns use 'die'. Most nouns ending in -ung, -heit, -keit, -schaft, -ion are feminine.",
            example: "Die Frau arbeitet im Büro.",
            exampleTranslation: "The woman works in the office.",
            grammarTopics: [.articles, .nouns, .nominative],
            thematicCategory: .family,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Kind",
            english: "the child",
            explanation: "Neuter nouns use 'das'. Diminutives (-chen, -lein) and most nouns starting with Ge- are neuter.",
            example: "Das Kind spielt im Garten.",
            exampleTranslation: "The child plays in the garden.",
            grammarTopics: [.articles, .nouns, .nominative],
            thematicCategory: .family,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Tisch",
            english: "the table",
            explanation: "Masculine noun. Objects don't have logical genders - you must memorize them!",
            example: "Der Tisch ist aus Holz.",
            exampleTranslation: "The table is made of wood.",
            grammarTopics: [.articles, .nouns],
            thematicCategory: .home,
            level: .a1,
            cardType: .vocabulary,
            memoryTip: "Think: 'The TABLE is where the MAN sits' (both masculine)"
        ),
        Flashcard(
            german: "die Lampe",
            english: "the lamp",
            explanation: "Feminine noun. Most nouns ending in -e are feminine.",
            example: "Die Lampe ist sehr hell.",
            exampleTranslation: "The lamp is very bright.",
            grammarTopics: [.articles, .nouns],
            thematicCategory: .home,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "das Buch",
            english: "the book",
            explanation: "Neuter noun. Plural: die Bücher (umlaut added).",
            example: "Das Buch ist interessant.",
            exampleTranslation: "The book is interesting.",
            grammarTopics: [.articles, .nouns],
            thematicCategory: .hobbies,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "ein/eine/ein",
            english: "a/an (indefinite articles)",
            explanation: "Indefinite articles: ein (m/n), eine (f). No plural form - just omit the article.",
            example: "Ich habe ein Buch und eine Zeitung.",
            exampleTranslation: "I have a book and a newspaper.",
            grammarTopics: [.articles],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .grammar,
            grammarTip: "ein Mann, eine Frau, ein Kind - masculine and neuter share 'ein'"
        ),
    ]

    // MARK: - Nouns & Gender Patterns

    static let nounsCards: [Flashcard] = [
        Flashcard(
            german: "-ung (die Zeitung, die Übung)",
            english: "Nouns ending in -ung are feminine",
            explanation: "All German nouns ending in -ung are feminine (die).",
            example: "Die Zeitung ist von heute. Die Übung ist schwer.",
            exampleTranslation: "The newspaper is from today. The exercise is difficult.",
            grammarTopics: [.nouns, .articles],
            thematicCategory: .work,
            level: .a1,
            cardType: .grammar,
            grammarTip: "-ung = always die (feminine)"
        ),
        Flashcard(
            german: "-heit / -keit (die Freiheit, die Möglichkeit)",
            english: "Nouns ending in -heit/-keit are feminine",
            explanation: "Abstract nouns ending in -heit or -keit are always feminine.",
            example: "Die Freiheit ist wichtig. Die Möglichkeit besteht.",
            exampleTranslation: "Freedom is important. The possibility exists.",
            grammarTopics: [.nouns, .articles],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .grammar
        ),
        Flashcard(
            german: "-chen / -lein (das Mädchen, das Brötchen)",
            english: "Diminutives (-chen/-lein) are neuter",
            explanation: "All diminutive endings make nouns neuter, even if the base word is feminine or masculine.",
            example: "Das Mädchen isst ein Brötchen.",
            exampleTranslation: "The girl eats a bread roll.",
            grammarTopics: [.nouns, .articles],
            thematicCategory: .food,
            level: .a1,
            cardType: .grammar,
            grammarTip: "das Mädchen (girl) is neuter because of -chen, not because of the person!"
        ),
        Flashcard(
            german: "Ge- (das Gebäude, das Geschäft)",
            english: "Many Ge- nouns are neuter",
            explanation: "Many collective nouns starting with Ge- are neuter.",
            example: "Das Gebäude ist groß. Das Geschäft ist geschlossen.",
            exampleTranslation: "The building is big. The shop is closed.",
            grammarTopics: [.nouns, .articles],
            thematicCategory: .directions,
            level: .a2,
            cardType: .grammar
        ),
    ]

    // MARK: - Pronouns

    static let pronounsCards: [Flashcard] = [
        Flashcard(
            german: "ich, du, er, sie, es",
            english: "I, you, he, she, it",
            explanation: "Personal pronouns (singular). 'Sie' (capitalized) = formal 'you'.",
            example: "Ich bin müde. Du bist nett. Er/Sie ist hier.",
            exampleTranslation: "I am tired. You are nice. He/She is here.",
            grammarTopics: [.pronouns, .nominative],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .grammar
        ),
        Flashcard(
            german: "wir, ihr, sie, Sie",
            english: "we, you (plural), they, you (formal)",
            explanation: "Personal pronouns (plural + formal). 'Sie' (formal) uses same conjugation as 'sie' (they).",
            example: "Wir gehen ins Kino. Sie kommen auch.",
            exampleTranslation: "We're going to the cinema. They're coming too.",
            grammarTopics: [.pronouns, .nominative],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .grammar
        ),
        Flashcard(
            german: "mein, dein, sein, ihr",
            english: "my, your, his, her",
            explanation: "Possessive pronouns take endings like 'ein': mein Vater, meine Mutter, mein Kind.",
            example: "Das ist mein Buch. Wo ist dein Handy?",
            exampleTranslation: "That is my book. Where is your phone?",
            grammarTopics: [.pronouns, .articles],
            thematicCategory: .family,
            level: .a1,
            cardType: .grammar,
            grammarTip: "Possessives follow ein-word endings: mein (m/n), meine (f/pl)"
        ),
        Flashcard(
            german: "mich, dich, ihn, sie, es",
            english: "me, you, him, her, it (accusative)",
            explanation: "Accusative personal pronouns - used for direct objects.",
            example: "Er sieht mich. Ich liebe dich. Sie kennt ihn.",
            exampleTranslation: "He sees me. I love you. She knows him.",
            grammarTopics: [.pronouns, .accusative],
            thematicCategory: .family,
            level: .a1,
            cardType: .grammar
        ),
        Flashcard(
            german: "mir, dir, ihm, ihr",
            english: "to me, to you, to him, to her (dative)",
            explanation: "Dative personal pronouns - used for indirect objects.",
            example: "Er gibt mir das Buch. Ich helfe dir.",
            exampleTranslation: "He gives me the book. I help you.",
            grammarTopics: [.pronouns, .dative],
            thematicCategory: .family,
            level: .a2,
            cardType: .grammar
        ),
    ]

    // MARK: - Verbs & Conjugation

    static let verbsCards: [Flashcard] = [
        Flashcard(
            german: "sein (to be)",
            english: "ich bin, du bist, er/sie/es ist, wir sind, ihr seid, sie/Sie sind",
            explanation: "The most important irregular verb. Essential for descriptions and locations.",
            example: "Ich bin Student. Wir sind in Berlin.",
            exampleTranslation: "I am a student. We are in Berlin.",
            grammarTopics: [.verbs, .presentTense],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .conjugation,
            conjugation: VerbConjugation(
                infinitive: "sein",
                meaning: "to be",
                isRegular: false,
                present: .init(ich: "bin", du: "bist", erSieEs: "ist", wir: "sind", ihr: "seid", sieSie: "sind"),
                perfect: .init(auxiliary: "sein", pastParticiple: "gewesen"),
                isModal: false,
                isSeparable: false,
                separablePrefix: nil
            )
        ),
        Flashcard(
            german: "haben (to have)",
            english: "ich habe, du hast, er/sie/es hat, wir haben, ihr habt, sie/Sie haben",
            explanation: "Second most important verb. Used for possession and as auxiliary in Perfekt.",
            example: "Ich habe Zeit. Sie hat ein Auto.",
            exampleTranslation: "I have time. She has a car.",
            grammarTopics: [.verbs, .presentTense],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .conjugation,
            conjugation: VerbConjugation(
                infinitive: "haben",
                meaning: "to have",
                isRegular: false,
                present: .init(ich: "habe", du: "hast", erSieEs: "hat", wir: "haben", ihr: "habt", sieSie: "haben"),
                perfect: .init(auxiliary: "haben", pastParticiple: "gehabt"),
                isModal: false,
                isSeparable: false,
                separablePrefix: nil
            )
        ),
        Flashcard(
            german: "Regular verb pattern: -e, -st, -t, -en, -t, -en",
            english: "machen: ich mache, du machst, er macht, wir machen, ihr macht, sie machen",
            explanation: "Most German verbs follow this regular pattern. Remove -en from infinitive, add endings.",
            example: "Ich mache Hausaufgaben. Was machst du?",
            exampleTranslation: "I do homework. What are you doing?",
            grammarTopics: [.verbs, .presentTense],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .grammar,
            grammarTip: "Stem + ending: mach + e = mache, mach + st = machst"
        ),
        Flashcard(
            german: "gehen (to go)",
            english: "ich gehe, du gehst, er/sie/es geht...",
            explanation: "Regular verb. Uses 'sein' in Perfekt because it shows movement.",
            example: "Ich gehe in die Schule. Wohin gehst du?",
            exampleTranslation: "I go to school. Where are you going?",
            grammarTopics: [.verbs, .presentTense],
            thematicCategory: .travel,
            level: .a1,
            cardType: .conjugation,
            grammarTip: "Movement verbs use 'sein' in Perfekt: Ich bin gegangen.",
            conjugation: VerbConjugation(
                infinitive: "gehen",
                meaning: "to go",
                isRegular: true,
                present: .init(ich: "gehe", du: "gehst", erSieEs: "geht", wir: "gehen", ihr: "geht", sieSie: "gehen"),
                perfect: .init(auxiliary: "sein", pastParticiple: "gegangen"),
                isModal: false,
                isSeparable: false,
                separablePrefix: nil
            )
        ),
        Flashcard(
            german: "sprechen (to speak) - stem change e→i",
            english: "ich spreche, du sprichst, er/sie/es spricht...",
            explanation: "Some verbs change their stem vowel in du/er/sie/es forms.",
            example: "Ich spreche Deutsch. Er spricht auch Englisch.",
            exampleTranslation: "I speak German. He also speaks English.",
            grammarTopics: [.verbs, .presentTense],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .conjugation,
            grammarTip: "e→i verbs: sprechen, helfen, nehmen, geben, essen, sehen",
            conjugation: VerbConjugation(
                infinitive: "sprechen",
                meaning: "to speak",
                isRegular: false,
                present: .init(ich: "spreche", du: "sprichst", erSieEs: "spricht", wir: "sprechen", ihr: "sprecht", sieSie: "sprechen"),
                perfect: .init(auxiliary: "haben", pastParticiple: "gesprochen"),
                isModal: false,
                isSeparable: false,
                separablePrefix: nil
            )
        ),
        Flashcard(
            german: "fahren (to drive/go) - stem change a→ä",
            english: "ich fahre, du fährst, er/sie/es fährt...",
            explanation: "Some verbs add an umlaut in du/er/sie/es forms.",
            example: "Ich fahre mit dem Auto. Er fährt Fahrrad.",
            exampleTranslation: "I drive by car. He rides a bicycle.",
            grammarTopics: [.verbs, .presentTense],
            thematicCategory: .travel,
            level: .a1,
            cardType: .conjugation,
            grammarTip: "a→ä verbs: fahren, schlafen, tragen, waschen, laufen",
            conjugation: VerbConjugation(
                infinitive: "fahren",
                meaning: "to drive/travel",
                isRegular: false,
                present: .init(ich: "fahre", du: "fährst", erSieEs: "fährt", wir: "fahren", ihr: "fahrt", sieSie: "fahren"),
                perfect: .init(auxiliary: "sein", pastParticiple: "gefahren"),
                isModal: false,
                isSeparable: false,
                separablePrefix: nil
            )
        ),
    ]

    // MARK: - Modal Verbs

    static let modalVerbsCards: [Flashcard] = [
        Flashcard(
            german: "können (can/to be able to)",
            english: "ich kann, du kannst, er kann, wir können, ihr könnt, sie können",
            explanation: "Modal verbs have irregular ich/er forms (no endings). Main verb goes to end as infinitive.",
            example: "Ich kann schwimmen. Kannst du mir helfen?",
            exampleTranslation: "I can swim. Can you help me?",
            grammarTopics: [.modalVerbs, .verbs],
            thematicCategory: .hobbies,
            level: .a2,
            cardType: .conjugation,
            grammarTip: "Modal + infinitive at END: Ich kann gut schwimmen.",
            conjugation: VerbConjugation(
                infinitive: "können",
                meaning: "can, to be able to",
                isRegular: false,
                present: .init(ich: "kann", du: "kannst", erSieEs: "kann", wir: "können", ihr: "könnt", sieSie: "können"),
                perfect: nil,
                isModal: true,
                isSeparable: false,
                separablePrefix: nil
            )
        ),
        Flashcard(
            german: "müssen (must/have to)",
            english: "ich muss, du musst, er muss, wir müssen, ihr müsst, sie müssen",
            explanation: "Expresses necessity or obligation. Note: 'nicht müssen' = don't have to (not 'must not').",
            example: "Ich muss arbeiten. Du musst nicht kommen.",
            exampleTranslation: "I have to work. You don't have to come.",
            grammarTopics: [.modalVerbs, .verbs],
            thematicCategory: .work,
            level: .a2,
            cardType: .conjugation,
            grammarTip: "nicht müssen = don't have to. 'must not' = dürfen nicht"
        ),
        Flashcard(
            german: "wollen (to want)",
            english: "ich will, du willst, er will, wir wollen, ihr wollt, sie wollen",
            explanation: "Expresses desire or intention. More direct than 'möchten'.",
            example: "Ich will nach Hause gehen. Was willst du essen?",
            exampleTranslation: "I want to go home. What do you want to eat?",
            grammarTopics: [.modalVerbs, .verbs],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .conjugation
        ),
        Flashcard(
            german: "dürfen (may/to be allowed to)",
            english: "ich darf, du darfst, er darf, wir dürfen, ihr dürft, sie dürfen",
            explanation: "Expresses permission. 'dürfen nicht' = must not/not allowed to.",
            example: "Hier darf man nicht rauchen. Darf ich fragen?",
            exampleTranslation: "You're not allowed to smoke here. May I ask?",
            grammarTopics: [.modalVerbs, .verbs],
            thematicCategory: .travel,
            level: .a2,
            cardType: .conjugation,
            grammarTip: "dürfen nicht = must not (prohibition)"
        ),
        Flashcard(
            german: "sollen (should/supposed to)",
            english: "ich soll, du sollst, er soll, wir sollen, ihr sollt, sie sollen",
            explanation: "Expresses obligation, duty, or what someone else wants you to do.",
            example: "Du sollst mehr schlafen. Was soll ich machen?",
            exampleTranslation: "You should sleep more. What should I do?",
            grammarTopics: [.modalVerbs, .verbs],
            thematicCategory: .health,
            level: .a2,
            cardType: .conjugation
        ),
        Flashcard(
            german: "möchten (would like)",
            english: "ich möchte, du möchtest, er möchte, wir möchten, ihr möchtet, sie möchten",
            explanation: "Polite form of 'wollen'. Very common for requests and wishes.",
            example: "Ich möchte einen Kaffee, bitte. Möchten Sie bestellen?",
            exampleTranslation: "I would like a coffee, please. Would you like to order?",
            grammarTopics: [.modalVerbs, .verbs],
            thematicCategory: .food,
            level: .a1,
            cardType: .conjugation,
            grammarTip: "möchten is more polite than wollen for requests"
        ),
    ]

    // MARK: - Separable Verbs

    static let separableVerbsCards: [Flashcard] = [
        Flashcard(
            german: "aufstehen (to get up)",
            english: "Ich stehe um 7 Uhr auf.",
            explanation: "Separable verbs split: prefix goes to the END in main clauses.",
            example: "Wann stehst du auf? - Ich stehe früh auf.",
            exampleTranslation: "When do you get up? - I get up early.",
            grammarTopics: [.separableVerbs, .verbs, .wordOrder],
            thematicCategory: .dailyRoutine,
            level: .a2,
            cardType: .vocabulary,
            grammarTip: "In Perfekt, ge- goes between prefix and stem: aufGEstanden",
            conjugation: VerbConjugation(
                infinitive: "aufstehen",
                meaning: "to get up, to stand up",
                isRegular: false,
                present: .init(ich: "stehe...auf", du: "stehst...auf", erSieEs: "steht...auf", wir: "stehen...auf", ihr: "steht...auf", sieSie: "stehen...auf"),
                perfect: .init(auxiliary: "sein", pastParticiple: "aufgestanden"),
                isModal: false,
                isSeparable: true,
                separablePrefix: "auf"
            )
        ),
        Flashcard(
            german: "anfangen (to begin)",
            english: "Der Film fängt um 8 Uhr an.",
            explanation: "Common separable verb. Note stem change a→ä.",
            example: "Wann fängt die Arbeit an?",
            exampleTranslation: "When does work begin?",
            grammarTopics: [.separableVerbs, .verbs],
            thematicCategory: .work,
            level: .a2,
            cardType: .vocabulary,
            conjugation: VerbConjugation(
                infinitive: "anfangen",
                meaning: "to begin, to start",
                isRegular: false,
                present: .init(ich: "fange...an", du: "fängst...an", erSieEs: "fängt...an", wir: "fangen...an", ihr: "fangt...an", sieSie: "fangen...an"),
                perfect: .init(auxiliary: "haben", pastParticiple: "angefangen"),
                isModal: false,
                isSeparable: true,
                separablePrefix: "an"
            )
        ),
        Flashcard(
            german: "einkaufen (to shop)",
            english: "Ich kaufe im Supermarkt ein.",
            explanation: "Separable verb for shopping. 'Ein' goes to the end.",
            example: "Wo kaufst du normalerweise ein?",
            exampleTranslation: "Where do you usually shop?",
            grammarTopics: [.separableVerbs, .verbs],
            thematicCategory: .shopping,
            level: .a2,
            cardType: .vocabulary,
            conjugation: VerbConjugation(
                infinitive: "einkaufen",
                meaning: "to shop, to buy",
                isRegular: true,
                present: .init(ich: "kaufe...ein", du: "kaufst...ein", erSieEs: "kauft...ein", wir: "kaufen...ein", ihr: "kauft...ein", sieSie: "kaufen...ein"),
                perfect: .init(auxiliary: "haben", pastParticiple: "eingekauft"),
                isModal: false,
                isSeparable: true,
                separablePrefix: "ein"
            )
        ),
        Flashcard(
            german: "Common separable prefixes",
            english: "ab-, an-, auf-, aus-, ein-, mit-, vor-, zu-, zurück-",
            explanation: "These prefixes typically separate. They're usually stressed in pronunciation.",
            example: "ANrufen, AUFmachen, ZUrückkommen",
            exampleTranslation: "to call, to open, to come back",
            grammarTopics: [.separableVerbs],
            thematicCategory: .greetings,
            level: .a2,
            cardType: .grammar,
            grammarTip: "If the prefix is stressed, it's probably separable!"
        ),
    ]

    // MARK: - Cases (Nominative, Accusative, Dative)

    static let casesCards: [Flashcard] = [
        Flashcard(
            german: "Nominative = Subject",
            english: "Der Mann liest. / Die Frau singt. / Das Kind spielt.",
            explanation: "Nominative is used for the SUBJECT - who/what does the action.",
            example: "Der Hund schläft. Die Katze isst.",
            exampleTranslation: "The dog sleeps. The cat eats.",
            grammarTopics: [.nominative, .articles],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .caseExample,
            caseBreakdown: CaseBreakdown(
                originalSentence: "Der Mann liest ein Buch.",
                translation: "The man reads a book.",
                components: [
                    .init(word: "Der Mann", grammaticalCase: .nominative, role: "subject", explanation: "Who reads? The man (nominative)")
                ]
            )
        ),
        Flashcard(
            german: "Accusative = Direct Object",
            english: "Ich sehe den Mann. / Ich sehe die Frau. / Ich sehe das Kind.",
            explanation: "Accusative is for DIRECT OBJECTS. Only masculine articles change: der→den, ein→einen.",
            example: "Ich kaufe einen Apfel. Ich lese eine Zeitung.",
            exampleTranslation: "I buy an apple. I read a newspaper.",
            grammarTopics: [.accusative, .articles],
            thematicCategory: .shopping,
            level: .a1,
            cardType: .caseExample,
            grammarTip: "Only MASCULINE changes in accusative: der→den, ein→einen",
            caseBreakdown: CaseBreakdown(
                originalSentence: "Die Frau sieht den Mann.",
                translation: "The woman sees the man.",
                components: [
                    .init(word: "Die Frau", grammaticalCase: .nominative, role: "subject", explanation: "Who sees? The woman"),
                    .init(word: "den Mann", grammaticalCase: .accusative, role: "direct object", explanation: "Whom does she see? The man (accusative: der→den)")
                ]
            )
        ),
        Flashcard(
            german: "Dative = Indirect Object",
            english: "Ich gebe dem Mann... / der Frau... / dem Kind...",
            explanation: "Dative is for INDIRECT OBJECTS (to whom/for whom). All articles change!",
            example: "Ich helfe dem Kind. Sie gibt der Frau ein Geschenk.",
            exampleTranslation: "I help the child. She gives the woman a gift.",
            grammarTopics: [.dative, .articles],
            thematicCategory: .family,
            level: .a2,
            cardType: .caseExample,
            grammarTip: "Dative articles: dem (m/n), der (f), den + n (plural)",
            caseBreakdown: CaseBreakdown(
                originalSentence: "Er gibt dem Kind einen Ball.",
                translation: "He gives the child a ball.",
                components: [
                    .init(word: "Er", grammaticalCase: .nominative, role: "subject", explanation: "Who gives? He"),
                    .init(word: "dem Kind", grammaticalCase: .dative, role: "indirect object", explanation: "To whom? The child (das→dem)"),
                    .init(word: "einen Ball", grammaticalCase: .accusative, role: "direct object", explanation: "What? A ball (ein→einen)")
                ]
            )
        ),
        Flashcard(
            german: "Dative verbs: helfen, danken, gefallen",
            english: "Verbs that always take dative objects",
            explanation: "Some verbs ALWAYS require dative, even though they seem like they'd take accusative.",
            example: "Ich helfe dir. Das gefällt mir. Ich danke Ihnen.",
            exampleTranslation: "I help you. I like that. I thank you.",
            grammarTopics: [.dative, .verbs],
            thematicCategory: .greetings,
            level: .a2,
            cardType: .grammar,
            grammarTip: "Common dative verbs: helfen, danken, gefallen, gehören, schmecken, passen"
        ),
        Flashcard(
            german: "Article changes summary",
            english: "m: der→den→dem | f: die→die→der | n: das→das→dem",
            explanation: "Complete article change pattern for Nominative → Accusative → Dative.",
            example: "Nom: der Mann, Akk: den Mann, Dat: dem Mann",
            exampleTranslation: "Nominative: the man, Accusative: the man, Dative: to the man",
            grammarTopics: [.nominative, .accusative, .dative, .articles],
            thematicCategory: .greetings,
            level: .a2,
            cardType: .grammar
        ),
    ]

    // MARK: - Prepositions

    static let prepositionsCards: [Flashcard] = [
        Flashcard(
            german: "Accusative prepositions: durch, für, gegen, ohne, um",
            english: "through, for, against, without, around",
            explanation: "These prepositions ALWAYS take accusative case.",
            example: "Das ist für dich. Ich laufe durch den Park.",
            exampleTranslation: "This is for you. I run through the park.",
            grammarTopics: [.prepositions, .accusative],
            thematicCategory: .travel,
            level: .a2,
            cardType: .grammar,
            grammarTip: "Memory trick: 'DOGFU' - durch, ohne, gegen, für, um"
        ),
        Flashcard(
            german: "Dative prepositions: aus, bei, mit, nach, seit, von, zu",
            english: "from, at/near, with, after/to, since, from/of, to",
            explanation: "These prepositions ALWAYS take dative case.",
            example: "Ich komme aus der Schweiz. Ich gehe zu dem (zum) Arzt.",
            exampleTranslation: "I come from Switzerland. I go to the doctor.",
            grammarTopics: [.prepositions, .dative],
            thematicCategory: .travel,
            level: .a2,
            cardType: .grammar,
            grammarTip: "Memory trick: 'Aus bei mit nach seit von zu - stay with dative, that is true!'"
        ),
        Flashcard(
            german: "Two-way prepositions: in, an, auf, über, unter, vor, hinter, neben, zwischen",
            english: "in, on/at, on top, over, under, in front, behind, next to, between",
            explanation: "These take ACCUSATIVE (movement to) or DATIVE (location at).",
            example: "Ich gehe in den Park. (Akk) Ich bin in dem Park. (Dat)",
            exampleTranslation: "I go into the park. (movement) I am in the park. (location)",
            grammarTopics: [.prepositions, .accusative, .dative],
            thematicCategory: .directions,
            level: .a2,
            cardType: .grammar,
            grammarTip: "Wohin? (where to) = Accusative. Wo? (where at) = Dative."
        ),
        Flashcard(
            german: "in + das = ins, in + dem = im",
            english: "Preposition contractions",
            explanation: "Common preposition + article contractions.",
            example: "Ich gehe ins Kino. Er ist im Büro.",
            exampleTranslation: "I go to the cinema. He is in the office.",
            grammarTopics: [.prepositions, .articles],
            thematicCategory: .travel,
            level: .a2,
            cardType: .grammar,
            grammarTip: "Common: ins, im, ans, am, zum, zur, vom, beim"
        ),
    ]

    // MARK: - Connectors

    static let connectorsCards: [Flashcard] = [
        Flashcard(
            german: "und, oder, aber, denn",
            english: "and, or, but, because",
            explanation: "Coordinating conjunctions - word order stays the same after these.",
            example: "Ich lerne Deutsch und er lernt Englisch.",
            exampleTranslation: "I learn German and he learns English.",
            grammarTopics: [.connectors, .wordOrder],
            thematicCategory: .opinions,
            level: .a1,
            cardType: .grammar,
            grammarTip: "After und, oder, aber, denn: normal word order (verb in position 2)"
        ),
        Flashcard(
            german: "weil, dass, wenn, obwohl",
            english: "because, that, if/when, although",
            explanation: "Subordinating conjunctions - verb goes to the END of the clause!",
            example: "Ich lerne Deutsch, weil ich in Berlin wohne.",
            exampleTranslation: "I learn German because I live in Berlin.",
            grammarTopics: [.connectors, .subordinateClauses, .wordOrder],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .grammar,
            grammarTip: "After weil, dass, wenn, etc.: verb goes to the END!"
        ),
        Flashcard(
            german: "deshalb, trotzdem, dann, danach",
            english: "therefore, nevertheless, then, after that",
            explanation: "Adverbial connectors - they take position 1, so verb stays in position 2.",
            example: "Ich war müde. Deshalb bin ich nach Hause gegangen.",
            exampleTranslation: "I was tired. Therefore I went home.",
            grammarTopics: [.connectors, .wordOrder],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .grammar,
            grammarTip: "These take position 1: Deshalb gehe ICH..."
        ),
    ]

    // MARK: - Negation

    static let negationCards: [Flashcard] = [
        Flashcard(
            german: "nicht (not)",
            english: "Negates verbs, adjectives, adverbs",
            explanation: "'Nicht' usually comes after the verb but before adjectives and at the end of sentences.",
            example: "Ich verstehe nicht. Das ist nicht richtig.",
            exampleTranslation: "I don't understand. That is not correct.",
            grammarTopics: [.negation, .wordOrder],
            thematicCategory: .opinions,
            level: .a1,
            cardType: .grammar,
            grammarTip: "nicht goes: after verb, before predicative adjectives, at the end"
        ),
        Flashcard(
            german: "kein/keine (no, not a)",
            english: "Negates nouns with ein/eine or no article",
            explanation: "Use 'kein' instead of 'nicht ein'. It follows ein-word endings.",
            example: "Ich habe kein Auto. Es gibt keine Probleme.",
            exampleTranslation: "I don't have a car. There are no problems.",
            grammarTopics: [.negation, .articles],
            thematicCategory: .opinions,
            level: .a1,
            cardType: .grammar,
            grammarTip: "kein replaces ein: 'nicht ein Auto' → 'kein Auto'"
        ),
    ]

    // MARK: - Questions

    static let questionsCards: [Flashcard] = [
        Flashcard(
            german: "W-Fragen: wer, was, wo, wann, warum, wie",
            english: "who, what, where, when, why, how",
            explanation: "Question words start the sentence, verb comes second.",
            example: "Wer bist du? Was machst du? Wo wohnst du?",
            exampleTranslation: "Who are you? What do you do? Where do you live?",
            grammarTopics: [.questions, .wordOrder],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .grammar
        ),
        Flashcard(
            german: "Ja/Nein-Fragen",
            english: "Yes/No questions - verb first",
            explanation: "For yes/no questions, start with the verb.",
            example: "Sprichst du Deutsch? Hast du Zeit?",
            exampleTranslation: "Do you speak German? Do you have time?",
            grammarTopics: [.questions, .wordOrder],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .grammar,
            grammarTip: "No question word? Start with verb: Kommst du?"
        ),
        Flashcard(
            german: "woher, wohin, wofür",
            english: "from where, to where, for what",
            explanation: "Compound question words for direction and purpose.",
            example: "Woher kommst du? Wohin gehst du?",
            exampleTranslation: "Where do you come from? Where are you going?",
            grammarTopics: [.questions, .prepositions],
            thematicCategory: .travel,
            level: .a1,
            cardType: .grammar
        ),
    ]

    // MARK: - Tenses

    static let tenseCards: [Flashcard] = [
        Flashcard(
            german: "Präsens (Present Tense)",
            english: "Used for: now, habits, future with time expression",
            explanation: "German present tense covers more uses than English present.",
            example: "Ich lerne Deutsch. Morgen gehe ich ins Kino.",
            exampleTranslation: "I learn/am learning German. Tomorrow I go to the cinema.",
            grammarTopics: [.presentTense, .verbs],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .grammar,
            grammarTip: "German uses present for scheduled future: 'Morgen fliege ich.'"
        ),
        Flashcard(
            german: "Perfekt (Conversational Past)",
            english: "haben/sein + past participle",
            explanation: "Used in spoken German for past events. Auxiliary + ge-___-t (regular) or ge-___-en (irregular).",
            example: "Ich habe gegessen. Ich bin gegangen.",
            exampleTranslation: "I ate/have eaten. I went/have gone.",
            grammarTopics: [.perfectTense, .verbs],
            thematicCategory: .dailyRoutine,
            level: .a2,
            cardType: .grammar,
            grammarTip: "haben = most verbs. sein = movement (gehen) + change of state (werden)"
        ),
        Flashcard(
            german: "Regular past participles: ge-___-t",
            english: "machen → gemacht, lernen → gelernt",
            explanation: "Regular verbs: ge- + stem + -t. Verbs with prefixes: different rules apply.",
            example: "Ich habe Deutsch gelernt. Sie hat viel gearbeitet.",
            exampleTranslation: "I learned German. She worked a lot.",
            grammarTopics: [.perfectTense, .verbs],
            thematicCategory: .work,
            level: .a2,
            cardType: .grammar,
            grammarTip: "Verbs ending in -ieren: no ge-! studiert, telefoniert"
        ),
        Flashcard(
            german: "Irregular past participles: ge-___-en",
            english: "gehen → gegangen, sehen → gesehen, schreiben → geschrieben",
            explanation: "Strong (irregular) verbs often change their stem vowel and end in -en.",
            example: "Ich bin nach Hause gegangen. Er hat einen Brief geschrieben.",
            exampleTranslation: "I went home. He wrote a letter.",
            grammarTopics: [.perfectTense, .verbs],
            thematicCategory: .dailyRoutine,
            level: .a2,
            cardType: .grammar,
            grammarTip: "Must memorize! essen→gegessen, trinken→getrunken, sprechen→gesprochen"
        ),
        Flashcard(
            german: "Separable verbs in Perfekt",
            english: "aufstehen → aufgestanden, einkaufen → eingekauft",
            explanation: "ge- goes BETWEEN the prefix and stem for separable verbs.",
            example: "Ich bin um 7 Uhr aufgestanden. Sie hat im Supermarkt eingekauft.",
            exampleTranslation: "I got up at 7. She shopped at the supermarket.",
            grammarTopics: [.perfectTense, .separableVerbs],
            thematicCategory: .dailyRoutine,
            level: .a2,
            cardType: .grammar,
            grammarTip: "auf + ge + standen = aufgestanden"
        ),
    ]

    // MARK: - Vocabulary by Theme

    static let vocabularyCards: [Flashcard] = [
        // Greetings
        Flashcard(
            german: "Guten Morgen / Guten Tag / Guten Abend",
            english: "Good morning / Good day / Good evening",
            explanation: "Formal greetings for different times of day.",
            example: "Guten Morgen! Wie geht es Ihnen?",
            exampleTranslation: "Good morning! How are you?",
            grammarTopics: [.nouns],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Wie geht es dir? / Wie geht es Ihnen?",
            english: "How are you? (informal / formal)",
            explanation: "'Dir' is informal, 'Ihnen' is formal. Both require dative case.",
            example: "Hallo! Wie geht es dir? - Mir geht es gut, danke!",
            exampleTranslation: "Hello! How are you? - I'm fine, thanks!",
            grammarTopics: [.pronouns, .dative],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .sentence,
            grammarTip: "'Es geht mir gut' uses dative (mir) not accusative (mich)"
        ),
        Flashcard(
            german: "Ich heiße... / Mein Name ist...",
            english: "My name is... / I am called...",
            explanation: "Two ways to introduce yourself. Both are equally common.",
            example: "Ich heiße Anna. Mein Name ist Müller.",
            exampleTranslation: "I'm called Anna. My name is Müller.",
            grammarTopics: [.verbs],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .sentence
        ),

        // Family
        Flashcard(
            german: "die Mutter, der Vater, die Eltern",
            english: "mother, father, parents",
            explanation: "Family vocabulary. Note: Eltern (parents) is always plural.",
            example: "Meine Mutter ist Lehrerin. Meine Eltern wohnen in München.",
            exampleTranslation: "My mother is a teacher. My parents live in Munich.",
            grammarTopics: [.nouns, .articles],
            thematicCategory: .family,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Bruder, die Schwester, die Geschwister",
            english: "brother, sister, siblings",
            explanation: "Sibling vocabulary. Geschwister is always plural.",
            example: "Ich habe einen Bruder und zwei Schwestern.",
            exampleTranslation: "I have one brother and two sisters.",
            grammarTopics: [.nouns, .accusative],
            thematicCategory: .family,
            level: .a1,
            cardType: .vocabulary
        ),

        // Food & Drinks
        Flashcard(
            german: "Ich möchte bestellen.",
            english: "I would like to order.",
            explanation: "Essential restaurant phrase. 'Möchten' is very polite.",
            example: "Entschuldigung, ich möchte bestellen. Ich hätte gern...",
            exampleTranslation: "Excuse me, I would like to order. I would like...",
            grammarTopics: [.modalVerbs],
            thematicCategory: .food,
            level: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "das Wasser, der Kaffee, der Tee, das Bier",
            english: "water, coffee, tea, beer",
            explanation: "Common drinks with their genders.",
            example: "Ein Wasser und einen Kaffee, bitte.",
            exampleTranslation: "A water and a coffee, please.",
            grammarTopics: [.nouns, .articles],
            thematicCategory: .food,
            level: .a1,
            cardType: .vocabulary,
            grammarTip: "Accusative after ordering: einen Kaffee (m), ein Wasser (n), eine Cola (f)"
        ),

        // Travel
        Flashcard(
            german: "der Bahnhof, der Flughafen, die Haltestelle",
            english: "train station, airport, bus/tram stop",
            explanation: "Transportation locations.",
            example: "Der Bahnhof ist in der Stadtmitte.",
            exampleTranslation: "The train station is in the city center.",
            grammarTopics: [.nouns, .articles],
            thematicCategory: .travel,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Wie komme ich zum/zur...?",
            english: "How do I get to the...?",
            explanation: "Asking for directions. zu + dem = zum (m/n), zu + der = zur (f).",
            example: "Entschuldigung, wie komme ich zum Bahnhof?",
            exampleTranslation: "Excuse me, how do I get to the train station?",
            grammarTopics: [.prepositions, .dative],
            thematicCategory: .directions,
            level: .a2,
            cardType: .sentence,
            grammarTip: "zu always takes dative: zum (zu + dem), zur (zu + der)"
        ),
    ]

    // MARK: - Greetings & Introductions (A1)

    static let greetingsCards: [Flashcard] = [
        Flashcard(
            german: "Hallo",
            english: "Hello",
            explanation: "Universal informal greeting, used any time of day.",
            example: "Hallo! Wie geht's?",
            exampleTranslation: "Hello! How are you?",
            grammarTopics: [.greetings],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Tschüss",
            english: "Bye",
            explanation: "Informal goodbye. Also spelled 'Tschüs'.",
            example: "Tschüss! Bis morgen!",
            exampleTranslation: "Bye! See you tomorrow!",
            grammarTopics: [.greetings],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Auf Wiedersehen",
            english: "Goodbye (formal)",
            explanation: "Formal goodbye, literally 'until we see again'.",
            example: "Auf Wiedersehen! Einen schönen Tag noch!",
            exampleTranslation: "Goodbye! Have a nice day!",
            grammarTopics: [.greetings],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Bitte / Danke",
            english: "Please / Thank you",
            explanation: "Essential polite expressions. 'Bitte' also means 'you're welcome'.",
            example: "Einen Kaffee, bitte. - Danke schön!",
            exampleTranslation: "A coffee, please. - Thank you very much!",
            grammarTopics: [.greetings],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Entschuldigung",
            english: "Excuse me / Sorry",
            explanation: "Used to get attention or apologize. Also 'Entschuldigen Sie'.",
            example: "Entschuldigung, wo ist der Bahnhof?",
            exampleTranslation: "Excuse me, where is the train station?",
            grammarTopics: [.greetings],
            thematicCategory: .greetings,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Freut mich",
            english: "Nice to meet you",
            explanation: "Short for 'Es freut mich, Sie kennenzulernen'.",
            example: "Ich bin Maria. - Freut mich, ich bin Thomas.",
            exampleTranslation: "I'm Maria. - Nice to meet you, I'm Thomas.",
            grammarTopics: [.greetings],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Woher kommen Sie? / Woher kommst du?",
            english: "Where are you from? (formal/informal)",
            explanation: "Asking about origin. 'Kommen aus' + country.",
            example: "Woher kommst du? - Ich komme aus Frankreich.",
            exampleTranslation: "Where are you from? - I come from France.",
            grammarTopics: [.questions, .greetings],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Ich wohne in...",
            english: "I live in...",
            explanation: "Describing where you live. 'In' + city/country.",
            example: "Ich wohne in Berlin. Und Sie?",
            exampleTranslation: "I live in Berlin. And you?",
            grammarTopics: [.prepositions, .greetings],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Was machen Sie beruflich?",
            english: "What do you do for work?",
            explanation: "Formal way to ask about someone's job.",
            example: "Was machen Sie beruflich? - Ich bin Ingenieur.",
            exampleTranslation: "What do you do for work? - I'm an engineer.",
            grammarTopics: [.questions, .greetings],
            thematicCategory: .work,
            level: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Sprechen Sie Englisch?",
            english: "Do you speak English?",
            explanation: "Asking about language ability. Formal 'Sie' form.",
            example: "Sprechen Sie Englisch? - Ja, ein bisschen.",
            exampleTranslation: "Do you speak English? - Yes, a little.",
            grammarTopics: [.questions, .verbs],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .sentence
        ),
    ]

    // MARK: - Numbers (A1)

    static let numbersCards: [Flashcard] = [
        Flashcard(
            german: "null, eins, zwei, drei, vier, fünf",
            english: "0, 1, 2, 3, 4, 5",
            explanation: "Numbers 0-5. Foundation for all German numbers.",
            example: "Ich habe drei Kinder.",
            exampleTranslation: "I have three children.",
            grammarTopics: [.numbers],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "sechs, sieben, acht, neun, zehn",
            english: "6, 7, 8, 9, 10",
            explanation: "Numbers 6-10. Note 'sieben' and 'neun' pronunciations.",
            example: "Das Buch hat zehn Kapitel.",
            exampleTranslation: "The book has ten chapters.",
            grammarTopics: [.numbers],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "elf, zwölf, dreizehn, vierzehn, fünfzehn",
            english: "11, 12, 13, 14, 15",
            explanation: "Numbers 11-15. 'Elf' and 'zwölf' are irregular.",
            example: "Sie ist fünfzehn Jahre alt.",
            exampleTranslation: "She is fifteen years old.",
            grammarTopics: [.numbers],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "zwanzig, dreißig, vierzig, fünfzig",
            english: "20, 30, 40, 50",
            explanation: "Tens. Note 'dreißig' (30) is irregular - ß not z.",
            example: "Mein Vater ist fünfzig Jahre alt.",
            exampleTranslation: "My father is fifty years old.",
            grammarTopics: [.numbers],
            thematicCategory: .family,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "einundzwanzig (21), zweiunddreißig (32)",
            english: "German numbers: ones BEFORE tens",
            explanation: "In German, you say 'one-and-twenty' not 'twenty-one'.",
            example: "Ich bin vierundzwanzig Jahre alt.",
            exampleTranslation: "I am twenty-four years old.",
            grammarTopics: [.numbers],
            thematicCategory: .introductions,
            level: .a1,
            cardType: .grammar,
            grammarTip: "45 = fünfundvierzig (five-and-forty)"
        ),
        Flashcard(
            german: "hundert, tausend, eine Million",
            english: "100, 1000, one million",
            explanation: "Larger numbers. 'Eine Million' uses feminine article.",
            example: "Die Stadt hat eine Million Einwohner.",
            exampleTranslation: "The city has one million inhabitants.",
            grammarTopics: [.numbers],
            thematicCategory: .travel,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "erst-, zweit-, dritt-, viert-",
            english: "first, second, third, fourth (ordinal)",
            explanation: "Ordinal numbers. Add '-te' (1-19) or '-ste' (20+).",
            example: "Das ist mein erstes Mal in Deutschland.",
            exampleTranslation: "This is my first time in Germany.",
            grammarTopics: [.numbers],
            thematicCategory: .travel,
            level: .a2,
            cardType: .grammar,
            grammarTip: "erst, zweit, dritt are irregular. Then: viert, fünft, sechst..."
        ),
    ]

    // MARK: - Time (A1)

    static let timeCards: [Flashcard] = [
        Flashcard(
            german: "Wie spät ist es? / Wie viel Uhr ist es?",
            english: "What time is it?",
            explanation: "Two ways to ask the time. Both equally common.",
            example: "Entschuldigung, wie spät ist es? - Es ist drei Uhr.",
            exampleTranslation: "Excuse me, what time is it? - It's three o'clock.",
            grammarTopics: [.time, .questions],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Es ist halb drei.",
            english: "It's half past two (2:30).",
            explanation: "German 'half' refers to halfway TO the next hour!",
            example: "Wann kommst du? - Um halb drei.",
            exampleTranslation: "When are you coming? - At half past two.",
            grammarTopics: [.time],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary,
            grammarTip: "halb drei = 2:30 (half TO three), NOT 3:30!"
        ),
        Flashcard(
            german: "Viertel vor / Viertel nach",
            english: "Quarter to / Quarter past",
            explanation: "Quarter hours. 'Vor' = before, 'nach' = after.",
            example: "Es ist Viertel vor acht. (7:45)",
            exampleTranslation: "It's quarter to eight.",
            grammarTopics: [.time],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "morgens, mittags, abends, nachts",
            english: "in the morning, at noon, in the evening, at night",
            explanation: "Times of day as adverbs. Add -s to make adverbs.",
            example: "Ich arbeite morgens und abends lerne ich Deutsch.",
            exampleTranslation: "I work in the morning and learn German in the evening.",
            grammarTopics: [.time],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "heute, morgen, gestern, übermorgen",
            english: "today, tomorrow, yesterday, day after tomorrow",
            explanation: "Time expressions. German has a word for 'day after tomorrow'!",
            example: "Gestern war ich müde. Heute geht es mir besser.",
            exampleTranslation: "Yesterday I was tired. Today I feel better.",
            grammarTopics: [.time],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Montag, Dienstag, Mittwoch, Donnerstag, Freitag",
            english: "Monday, Tuesday, Wednesday, Thursday, Friday",
            explanation: "Weekdays. Always masculine (der Montag). Use 'am' for 'on'.",
            example: "Am Montag habe ich frei.",
            exampleTranslation: "On Monday I'm off.",
            grammarTopics: [.time, .nouns],
            thematicCategory: .work,
            level: .a1,
            cardType: .vocabulary,
            grammarTip: "am Montag = on Monday (an + dem = am)"
        ),
        Flashcard(
            german: "Samstag/Sonnabend, Sonntag",
            english: "Saturday, Sunday",
            explanation: "Weekend days. 'Sonnabend' is used in northern Germany.",
            example: "Am Wochenende schlafe ich lange.",
            exampleTranslation: "On the weekend I sleep late.",
            grammarTopics: [.time, .nouns],
            thematicCategory: .hobbies,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Januar, Februar, März, April, Mai, Juni",
            english: "January, February, March, April, May, June",
            explanation: "Months (first half). Always masculine. Use 'im' for 'in'.",
            example: "Im März beginnt der Frühling.",
            exampleTranslation: "In March, spring begins.",
            grammarTopics: [.time, .nouns],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary,
            grammarTip: "im Januar = in January (in + dem = im)"
        ),
        Flashcard(
            german: "Juli, August, September, Oktober, November, Dezember",
            english: "July, August, September, October, November, December",
            explanation: "Months (second half). German Dezember, not December.",
            example: "Im Dezember feiern wir Weihnachten.",
            exampleTranslation: "In December we celebrate Christmas.",
            grammarTopics: [.time, .nouns],
            thematicCategory: .culture,
            level: .a1,
            cardType: .vocabulary
        ),
    ]

    // MARK: - B1 Grammar (Intermediate)

    static let b1GrammarCards: [Flashcard] = [
        // Relative Clauses
        Flashcard(
            german: "der, die, das (relative pronouns)",
            english: "who, which, that (in relative clauses)",
            explanation: "Relative pronouns match the gender of the noun they refer to.",
            example: "Der Mann, der dort steht, ist mein Vater.",
            exampleTranslation: "The man who stands there is my father.",
            grammarTopics: [.relativeClauses, .pronouns],
            thematicCategory: .family,
            level: .b1,
            cardType: .grammar,
            grammarTip: "Relative pronoun matches noun gender: der Mann, DER...; die Frau, DIE..."
        ),
        Flashcard(
            german: "Das ist das Buch, das ich gelesen habe.",
            english: "That is the book that I read.",
            explanation: "Relative clause with neuter noun. Verb goes to end.",
            example: "Das Haus, das wir gekauft haben, ist sehr alt.",
            exampleTranslation: "The house that we bought is very old.",
            grammarTopics: [.relativeClauses, .wordOrder],
            thematicCategory: .home,
            level: .b1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Die Frau, deren Mann Arzt ist...",
            english: "The woman whose husband is a doctor...",
            explanation: "'Deren' = whose (for feminine/plural), 'dessen' = whose (for masculine/neuter).",
            example: "Der Student, dessen Arbeit gut war, hat bestanden.",
            exampleTranslation: "The student whose work was good passed.",
            grammarTopics: [.relativeClauses, .genitive],
            thematicCategory: .work,
            level: .b1,
            cardType: .grammar
        ),

        // Passive Voice
        Flashcard(
            german: "werden + past participle (Passive)",
            english: "Passive voice: is being done",
            explanation: "German passive uses 'werden' + past participle. Agent uses 'von'.",
            example: "Das Buch wird gelesen. / Das Buch wurde geschrieben.",
            exampleTranslation: "The book is being read. / The book was written.",
            grammarTopics: [.passive, .verbs],
            thematicCategory: .culture,
            level: .b1,
            cardType: .grammar,
            grammarTip: "Present passive: wird gemacht. Past passive: wurde gemacht."
        ),
        Flashcard(
            german: "Das Auto wird repariert.",
            english: "The car is being repaired.",
            explanation: "Present tense passive. Focus is on the action, not who does it.",
            example: "Hier wird Deutsch gesprochen.",
            exampleTranslation: "German is spoken here.",
            grammarTopics: [.passive, .presentTense],
            thematicCategory: .work,
            level: .b1,
            cardType: .sentence
        ),
        Flashcard(
            german: "von + dative (passive agent)",
            english: "by (someone) in passive sentences",
            explanation: "The 'doer' in passive sentences is introduced with 'von'.",
            example: "Das Buch wurde von Goethe geschrieben.",
            exampleTranslation: "The book was written by Goethe.",
            grammarTopics: [.passive, .dative, .prepositions],
            thematicCategory: .culture,
            level: .b1,
            cardType: .grammar
        ),

        // Subjunctive II
        Flashcard(
            german: "Konjunktiv II (would/could)",
            english: "Subjunctive for wishes, hypotheticals",
            explanation: "Used for unreal conditions, polite requests, wishes.",
            example: "Ich würde gern nach Japan reisen.",
            exampleTranslation: "I would like to travel to Japan.",
            grammarTopics: [.subjunctive, .verbs],
            thematicCategory: .travel,
            level: .b1,
            cardType: .grammar,
            grammarTip: "würde + infinitive is the most common form"
        ),
        Flashcard(
            german: "hätte, wäre, könnte, müsste",
            english: "would have, would be, could, would have to",
            explanation: "Common verbs have their own subjunctive forms (not würde +).",
            example: "Wenn ich Zeit hätte, würde ich mehr lesen.",
            exampleTranslation: "If I had time, I would read more.",
            grammarTopics: [.subjunctive, .verbs],
            thematicCategory: .hobbies,
            level: .b1,
            cardType: .vocabulary,
            grammarTip: "haben→hätte, sein→wäre, können→könnte, müssen→müsste"
        ),
        Flashcard(
            german: "Wenn ich reich wäre, würde ich...",
            english: "If I were rich, I would...",
            explanation: "Conditional sentences with subjunctive II.",
            example: "Wenn ich du wäre, würde ich das nicht tun.",
            exampleTranslation: "If I were you, I wouldn't do that.",
            grammarTopics: [.subjunctive, .connectors],
            thematicCategory: .opinions,
            level: .b1,
            cardType: .sentence
        ),

        // Advanced Connectors
        Flashcard(
            german: "obwohl, obgleich (although)",
            english: "although, even though",
            explanation: "Subordinating conjunctions - verb goes to end.",
            example: "Obwohl es regnet, gehe ich spazieren.",
            exampleTranslation: "Although it's raining, I'm going for a walk.",
            grammarTopics: [.connectors, .subordinateClauses],
            thematicCategory: .opinions,
            level: .b1,
            cardType: .grammar
        ),
        Flashcard(
            german: "bevor, nachdem, während",
            english: "before, after, while",
            explanation: "Temporal conjunctions for time relationships.",
            example: "Bevor ich esse, wasche ich mir die Hände.",
            exampleTranslation: "Before I eat, I wash my hands.",
            grammarTopics: [.connectors, .wordOrder],
            thematicCategory: .dailyRoutine,
            level: .b1,
            cardType: .grammar,
            grammarTip: "After nachdem, use one tense back: Nachdem ich gegessen HATTE, ging ich."
        ),
        Flashcard(
            german: "falls, sofern (if/in case)",
            english: "if, in case, provided that",
            explanation: "Conditional conjunctions, more formal than 'wenn'.",
            example: "Falls du Fragen hast, ruf mich an.",
            exampleTranslation: "If you have questions, call me.",
            grammarTopics: [.connectors, .subordinateClauses],
            thematicCategory: .work,
            level: .b1,
            cardType: .grammar
        ),
        Flashcard(
            german: "je... desto/umso",
            english: "the more... the more",
            explanation: "Comparative construction. 'Je' clause has verb at end.",
            example: "Je mehr ich lerne, desto besser verstehe ich.",
            exampleTranslation: "The more I learn, the better I understand.",
            grammarTopics: [.connectors, .wordOrder],
            thematicCategory: .opinions,
            level: .b1,
            cardType: .grammar
        ),

        // Two-way prepositions in depth
        Flashcard(
            german: "Wohin? → Akkusativ / Wo? → Dativ",
            english: "Motion → Accusative / Location → Dative",
            explanation: "Two-way prepositions change case based on movement vs location.",
            example: "Ich gehe in DEN Park. (motion) Ich bin in DEM Park. (location)",
            exampleTranslation: "I go into the park. / I am in the park.",
            grammarTopics: [.prepositions, .accusative, .dative],
            thematicCategory: .travel,
            level: .b1,
            cardType: .grammar,
            grammarTip: "Ask: Is there movement TO a place? → Accusative. Staying put? → Dative."
        ),
    ]

    // MARK: - B2 Grammar (Upper Intermediate)

    static let b2GrammarCards: [Flashcard] = [
        // Genitive Case
        Flashcard(
            german: "Genitive case: des, der, des, der",
            english: "The genitive case shows possession",
            explanation: "Genitive: des (m/n), der (f/pl). Masculine/neuter nouns add -(e)s.",
            example: "Das ist das Auto meines Vaters.",
            exampleTranslation: "That is my father's car.",
            grammarTopics: [.genitive, .articles],
            thematicCategory: .family,
            level: .b2,
            cardType: .grammar,
            grammarTip: "Genitive: der Vater → des Vaters, die Mutter → der Mutter"
        ),
        Flashcard(
            german: "während, wegen, trotz, statt (+ Genitive)",
            english: "during, because of, despite, instead of",
            explanation: "These prepositions require genitive case.",
            example: "Wegen des Wetters bleiben wir zu Hause.",
            exampleTranslation: "Because of the weather, we stay at home.",
            grammarTopics: [.genitive, .prepositions],
            thematicCategory: .opinions,
            level: .b2,
            cardType: .grammar,
            grammarTip: "Colloquially, dative is often used instead of genitive."
        ),
        Flashcard(
            german: "innerhalb, außerhalb, oberhalb, unterhalb",
            english: "inside of, outside of, above, below",
            explanation: "Location prepositions that take genitive.",
            example: "Innerhalb der Stadt gibt es viele Parks.",
            exampleTranslation: "Inside the city there are many parks.",
            grammarTopics: [.genitive, .prepositions],
            thematicCategory: .directions,
            level: .b2,
            cardType: .vocabulary
        ),

        // Complex Sentences
        Flashcard(
            german: "Double infinitive with modals",
            english: "haben + infinitive + infinitive modal",
            explanation: "In Perfekt with modals, use double infinitive instead of past participle.",
            example: "Ich habe nicht kommen können.",
            exampleTranslation: "I couldn't come.",
            grammarTopics: [.modalVerbs, .perfectTense, .wordOrder],
            thematicCategory: .work,
            level: .b2,
            cardType: .grammar,
            grammarTip: "NOT 'gekonnt' but 'können' when another infinitive is present."
        ),
        Flashcard(
            german: "Partizip I (present participle)",
            english: "verb stem + -d + adjective endings",
            explanation: "Used as adjective: the singing bird = der singende Vogel.",
            example: "Das schlafende Kind liegt im Bett.",
            exampleTranslation: "The sleeping child lies in bed.",
            grammarTopics: [.verbs],
            thematicCategory: .family,
            level: .b2,
            cardType: .grammar,
            grammarTip: "singen → singend → der singende Vogel"
        ),
        Flashcard(
            german: "Extended participial phrases",
            english: "Long adjective phrases before nouns",
            explanation: "German can pack entire clauses into participial phrases.",
            example: "Der in Berlin lebende Student kommt aus Japan.",
            exampleTranslation: "The student living in Berlin comes from Japan.",
            grammarTopics: [.wordOrder],
            thematicCategory: .work,
            level: .b2,
            cardType: .grammar
        ),

        // Idioms
        Flashcard(
            german: "Daumen drücken",
            english: "To cross fingers / wish luck",
            explanation: "Literally 'press thumbs'. Germans press thumbs, not cross fingers!",
            example: "Ich drücke dir die Daumen für die Prüfung!",
            exampleTranslation: "I'll keep my fingers crossed for your exam!",
            grammarTopics: [.idioms],
            thematicCategory: .culture,
            level: .b2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Das ist nicht mein Bier.",
            english: "That's not my problem/business.",
            explanation: "Literally 'that's not my beer'. Common way to say 'not my concern'.",
            example: "Ob er kommt oder nicht, das ist nicht mein Bier.",
            exampleTranslation: "Whether he comes or not, that's not my problem.",
            grammarTopics: [.idioms],
            thematicCategory: .opinions,
            level: .b2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Schwein haben",
            english: "To be lucky",
            explanation: "Literally 'to have pig'. Pigs are lucky in German culture.",
            example: "Du hast Schwein gehabt! Du hast den letzten Platz bekommen.",
            exampleTranslation: "You were lucky! You got the last spot.",
            grammarTopics: [.idioms],
            thematicCategory: .culture,
            level: .b2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Da steppt der Bär.",
            english: "That's where the party is.",
            explanation: "Literally 'the bear dances there'. Means it's going to be lively.",
            example: "Auf der Party steppt der Bär!",
            exampleTranslation: "The party is going to be wild!",
            grammarTopics: [.idioms],
            thematicCategory: .hobbies,
            level: .b2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Tomaten auf den Augen haben",
            english: "To be oblivious / not see what's obvious",
            explanation: "Literally 'to have tomatoes on your eyes'.",
            example: "Hast du Tomaten auf den Augen? Das steht direkt vor dir!",
            exampleTranslation: "Are you blind? It's right in front of you!",
            grammarTopics: [.idioms],
            thematicCategory: .opinions,
            level: .b2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Ich verstehe nur Bahnhof.",
            english: "I don't understand anything.",
            explanation: "Literally 'I only understand train station'. Complete confusion.",
            example: "Kannst du das nochmal erklären? Ich verstehe nur Bahnhof.",
            exampleTranslation: "Can you explain that again? I don't understand anything.",
            grammarTopics: [.idioms],
            thematicCategory: .opinions,
            level: .b2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "Das ist mir Wurst.",
            english: "I don't care.",
            explanation: "Literally 'that's sausage to me'. Expressing indifference.",
            example: "Gehen wir ins Kino oder essen? - Das ist mir Wurst.",
            exampleTranslation: "Shall we go to cinema or eat? - I don't care.",
            grammarTopics: [.idioms],
            thematicCategory: .opinions,
            level: .b2,
            cardType: .vocabulary
        ),

        // Formal vs Informal
        Flashcard(
            german: "Sie vs du",
            english: "Formal vs informal 'you'",
            explanation: "Use 'Sie' with strangers, professionals, elders. 'Du' with friends, family, children.",
            example: "Können Sie mir helfen? (formal) / Kannst du mir helfen? (informal)",
            exampleTranslation: "Can you help me?",
            grammarTopics: [.pronouns, .greetings],
            thematicCategory: .work,
            level: .b2,
            cardType: .grammar,
            grammarTip: "When in doubt, use Sie. Wait for others to offer 'du'."
        ),
        Flashcard(
            german: "Könnten Sie... / Würden Sie...",
            english: "Could you... / Would you... (formal requests)",
            explanation: "Konjunktiv II for polite requests in formal situations.",
            example: "Könnten Sie das bitte wiederholen?",
            exampleTranslation: "Could you please repeat that?",
            grammarTopics: [.subjunctive, .greetings],
            thematicCategory: .work,
            level: .b2,
            cardType: .sentence
        ),
        Flashcard(
            german: "Ich hätte gern... (I would like...)",
            english: "Polite way to order/request",
            explanation: "More polite than 'Ich möchte', perfect for restaurants and shops.",
            example: "Ich hätte gern einen Kaffee mit Milch, bitte.",
            exampleTranslation: "I would like a coffee with milk, please.",
            grammarTopics: [.subjunctive, .greetings],
            thematicCategory: .food,
            level: .b2,
            cardType: .sentence
        ),
    ]

    // MARK: - Expanded Vocabulary

    static let expandedVocabularyCards: [Flashcard] = [
        // Daily Routine
        Flashcard(
            german: "aufwachen",
            english: "to wake up",
            explanation: "Separable verb. Ich wache auf.",
            example: "Ich wache jeden Tag um 6 Uhr auf.",
            exampleTranslation: "I wake up at 6 o'clock every day.",
            grammarTopics: [.separableVerbs],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "sich duschen",
            english: "to shower (oneself)",
            explanation: "Reflexive verb. Ich dusche mich.",
            example: "Ich dusche mich morgens.",
            exampleTranslation: "I shower in the morning.",
            grammarTopics: [.verbs],
            thematicCategory: .dailyRoutine,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "frühstücken",
            english: "to have breakfast",
            explanation: "Regular verb, no separation.",
            example: "Was frühstückst du normalerweise?",
            exampleTranslation: "What do you usually have for breakfast?",
            grammarTopics: [.verbs],
            thematicCategory: .food,
            level: .a1,
            cardType: .vocabulary
        ),

        // Shopping
        Flashcard(
            german: "Wie viel kostet das?",
            english: "How much does that cost?",
            explanation: "Essential shopping question.",
            example: "Wie viel kostet das T-Shirt? - Es kostet 20 Euro.",
            exampleTranslation: "How much does the T-shirt cost? - It costs 20 euros.",
            grammarTopics: [.questions],
            thematicCategory: .shopping,
            level: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "billig / teuer",
            english: "cheap / expensive",
            explanation: "Price adjectives.",
            example: "Das ist zu teuer. Haben Sie etwas Billigeres?",
            exampleTranslation: "That's too expensive. Do you have something cheaper?",
            grammarTopics: [.nouns],
            thematicCategory: .shopping,
            level: .a1,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Laden, das Geschäft, der Supermarkt",
            english: "shop, store, supermarket",
            explanation: "Places to shop. All have different genders!",
            example: "Der Supermarkt ist um die Ecke.",
            exampleTranslation: "The supermarket is around the corner.",
            grammarTopics: [.nouns, .articles],
            thematicCategory: .shopping,
            level: .a1,
            cardType: .vocabulary
        ),

        // Health
        Flashcard(
            german: "Mir ist schlecht.",
            english: "I feel sick/nauseous.",
            explanation: "Dative construction for physical feeling.",
            example: "Mir ist schlecht. Ich muss zum Arzt.",
            exampleTranslation: "I feel sick. I need to go to the doctor.",
            grammarTopics: [.dative],
            thematicCategory: .health,
            level: .a2,
            cardType: .sentence
        ),
        Flashcard(
            german: "Ich habe Kopfschmerzen / Bauchschmerzen.",
            english: "I have a headache / stomach ache.",
            explanation: "Body part + Schmerzen (pains).",
            example: "Ich kann nicht arbeiten. Ich habe starke Kopfschmerzen.",
            exampleTranslation: "I can't work. I have a bad headache.",
            grammarTopics: [.nouns],
            thematicCategory: .health,
            level: .a1,
            cardType: .sentence
        ),

        // Work
        Flashcard(
            german: "die Besprechung, das Meeting",
            english: "meeting",
            explanation: "Both words are used. 'Meeting' is borrowed from English.",
            example: "Ich habe um 14 Uhr eine Besprechung.",
            exampleTranslation: "I have a meeting at 2 pm.",
            grammarTopics: [.nouns],
            thematicCategory: .work,
            level: .a2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "der Chef / die Chefin",
            english: "boss (male/female)",
            explanation: "Job titles often have feminine forms with -in.",
            example: "Meine Chefin ist sehr nett.",
            exampleTranslation: "My boss is very nice.",
            grammarTopics: [.nouns],
            thematicCategory: .work,
            level: .a2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "die E-Mail schreiben / beantworten",
            english: "to write / answer an email",
            explanation: "Email vocabulary for office work.",
            example: "Ich muss noch viele E-Mails beantworten.",
            exampleTranslation: "I still have to answer many emails.",
            grammarTopics: [.verbs],
            thematicCategory: .work,
            level: .a2,
            cardType: .vocabulary
        ),

        // Hobbies
        Flashcard(
            german: "Sport treiben / Sport machen",
            english: "to do sports",
            explanation: "Two ways to say 'do sports'. Both are common.",
            example: "Wie oft treibst du Sport? - Zweimal pro Woche.",
            exampleTranslation: "How often do you do sports? - Twice a week.",
            grammarTopics: [.verbs],
            thematicCategory: .hobbies,
            level: .a1,
            cardType: .sentence
        ),
        Flashcard(
            german: "fernsehen",
            english: "to watch TV",
            explanation: "Separable verb: Ich sehe fern.",
            example: "Abends sehe ich gern fern.",
            exampleTranslation: "In the evening I like to watch TV.",
            grammarTopics: [.separableVerbs],
            thematicCategory: .hobbies,
            level: .a2,
            cardType: .vocabulary
        ),
        Flashcard(
            german: "spazieren gehen",
            english: "to go for a walk",
            explanation: "Verb + gehen construction.",
            example: "Am Sonntag gehen wir im Park spazieren.",
            exampleTranslation: "On Sunday we go for a walk in the park.",
            grammarTopics: [.verbs],
            thematicCategory: .hobbies,
            level: .a1,
            cardType: .vocabulary
        ),

        // Opinions
        Flashcard(
            german: "Ich finde, dass...",
            english: "I think that...",
            explanation: "Expressing opinion. 'Dass' sends verb to end.",
            example: "Ich finde, dass Deutsch interessant ist.",
            exampleTranslation: "I think that German is interesting.",
            grammarTopics: [.connectors, .subordinateClauses],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .sentence
        ),
        Flashcard(
            german: "Meiner Meinung nach...",
            english: "In my opinion...",
            explanation: "Formal way to give opinion. Takes dative.",
            example: "Meiner Meinung nach ist das eine gute Idee.",
            exampleTranslation: "In my opinion, that's a good idea.",
            grammarTopics: [.dative],
            thematicCategory: .opinions,
            level: .b1,
            cardType: .sentence
        ),
        Flashcard(
            german: "Ich stimme (nicht) zu.",
            english: "I (don't) agree.",
            explanation: "Agreeing or disagreeing. 'Zustimmen' is separable.",
            example: "Da stimme ich dir voll zu!",
            exampleTranslation: "I completely agree with you on that!",
            grammarTopics: [.separableVerbs],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .sentence
        ),

        // Emotions
        Flashcard(
            german: "Ich freue mich auf + Akk.",
            english: "I'm looking forward to",
            explanation: "Reflexive verb + preposition 'auf' + accusative.",
            example: "Ich freue mich auf das Wochenende.",
            exampleTranslation: "I'm looking forward to the weekend.",
            grammarTopics: [.verbs, .prepositions],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .sentence,
            grammarTip: "auf + accusative for future events"
        ),
        Flashcard(
            german: "Ich freue mich über + Akk.",
            english: "I'm happy about",
            explanation: "Same verb, different preposition = different meaning!",
            example: "Ich freue mich über dein Geschenk.",
            exampleTranslation: "I'm happy about your gift.",
            grammarTopics: [.verbs, .prepositions],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .sentence,
            grammarTip: "über + accusative for something that already happened"
        ),
        Flashcard(
            german: "Ich habe Angst vor + Dat.",
            english: "I'm afraid of",
            explanation: "Fear construction: Angst haben vor + dative.",
            example: "Ich habe Angst vor Spinnen.",
            exampleTranslation: "I'm afraid of spiders.",
            grammarTopics: [.prepositions, .dative],
            thematicCategory: .opinions,
            level: .a2,
            cardType: .sentence
        ),
    ]

    // MARK: - Swipe Sentences

    static let swipeSentences: [SwipeSentence] = [
        // A1 Level - Correct sentences
        SwipeSentence(
            sentence: "Ich habe einen Hund.",
            translation: "I have a dog.",
            isCorrect: true,
            explanation: "Correct! 'Hund' is masculine, so 'ein' becomes 'einen' in accusative after 'haben'.",
            grammarTopics: [.accusative, .articles],
            level: .a1
        ),
        SwipeSentence(
            sentence: "Der Mann ist groß.",
            translation: "The man is tall.",
            isCorrect: true,
            explanation: "Correct! Subject (der Mann) is in nominative. Adjective after 'sein' needs no ending.",
            grammarTopics: [.nominative, .articles],
            level: .a1
        ),
        SwipeSentence(
            sentence: "Ich spreche Deutsch.",
            translation: "I speak German.",
            isCorrect: true,
            explanation: "Correct conjugation! 'Sprechen' with 'ich' = 'spreche'.",
            grammarTopics: [.verbs, .presentTense],
            level: .a1
        ),

        // A1 Level - Incorrect sentences
        SwipeSentence(
            sentence: "Ich habe ein Hund.",
            translation: "I have a dog.",
            isCorrect: false,
            explanation: "'Hund' is masculine! After 'haben' we need accusative case. 'Ein' becomes 'einen' for masculine nouns.",
            correctVersion: "Ich habe einen Hund.",
            grammarTopics: [.accusative, .articles],
            level: .a1,
            errorType: .caseError
        ),
        SwipeSentence(
            sentence: "Die Mann ist groß.",
            translation: "The man is tall.",
            isCorrect: false,
            explanation: "'Mann' is masculine! It needs 'der', not 'die'. Articles must match noun gender.",
            correctVersion: "Der Mann ist groß.",
            grammarTopics: [.articles, .nouns],
            level: .a1,
            errorType: .articleGender
        ),
        SwipeSentence(
            sentence: "Ich gehst nach Hause.",
            translation: "I go home.",
            isCorrect: false,
            explanation: "Wrong conjugation! 'Gehen' with 'ich' = 'gehe', not 'gehst'. '-st' ending is for 'du'.",
            correctVersion: "Ich gehe nach Hause.",
            grammarTopics: [.verbs, .presentTense],
            level: .a1,
            errorType: .verbConjugation
        ),
        SwipeSentence(
            sentence: "Er haben zwei Kinder.",
            translation: "He has two children.",
            isCorrect: false,
            explanation: "Wrong conjugation! 'Haben' with 'er' = 'hat'. 'Haben' is for wir/sie/Sie.",
            correctVersion: "Er hat zwei Kinder.",
            grammarTopics: [.verbs, .presentTense],
            level: .a1,
            errorType: .verbConjugation
        ),

        // A2 Level - Correct sentences
        SwipeSentence(
            sentence: "Ich gebe dem Kind einen Ball.",
            translation: "I give the child a ball.",
            isCorrect: true,
            explanation: "Perfect case usage! Dative (dem Kind = to whom) + Accusative (einen Ball = what).",
            grammarTopics: [.dative, .accusative],
            level: .a2
        ),
        SwipeSentence(
            sentence: "Er muss morgen arbeiten.",
            translation: "He has to work tomorrow.",
            isCorrect: true,
            explanation: "Correct modal verb structure! Modal (muss) is conjugated, infinitive (arbeiten) at the end.",
            grammarTopics: [.modalVerbs, .wordOrder],
            level: .a2
        ),
        SwipeSentence(
            sentence: "Ich stehe um 7 Uhr auf.",
            translation: "I get up at 7 o'clock.",
            isCorrect: true,
            explanation: "Perfect separable verb! 'Aufstehen' separates: 'stehe' + time expression + 'auf' at end.",
            grammarTopics: [.separableVerbs, .wordOrder],
            level: .a2
        ),
        SwipeSentence(
            sentence: "Ich bin gestern ins Kino gegangen.",
            translation: "I went to the cinema yesterday.",
            isCorrect: true,
            explanation: "Correct Perfekt! 'Gehen' uses 'sein' as auxiliary. 'Gegangen' at the end.",
            grammarTopics: [.perfectTense, .verbs],
            level: .a2
        ),

        // A2 Level - Incorrect sentences
        SwipeSentence(
            sentence: "Das Buch ist auf der Tisch.",
            translation: "The book is on the table.",
            isCorrect: false,
            explanation: "'Auf' + location (no movement) = dative. 'Tisch' is masculine, so 'der' becomes 'dem'.",
            correctVersion: "Das Buch ist auf dem Tisch.",
            grammarTopics: [.prepositions, .dative],
            level: .a2,
            errorType: .caseError
        ),
        SwipeSentence(
            sentence: "Ich kann nicht zu schwimmen.",
            translation: "I cannot swim.",
            isCorrect: false,
            explanation: "Modal verbs take infinitive WITHOUT 'zu'! Remove the 'zu' before the infinitive.",
            correctVersion: "Ich kann nicht schwimmen.",
            grammarTopics: [.modalVerbs],
            level: .a2,
            errorType: .modalVerb
        ),
        SwipeSentence(
            sentence: "Ich stehe auf um 7 Uhr.",
            translation: "I get up at 7 o'clock.",
            isCorrect: false,
            explanation: "Word order error! Time expressions go BEFORE the separable prefix at the end.",
            correctVersion: "Ich stehe um 7 Uhr auf.",
            grammarTopics: [.separableVerbs, .wordOrder],
            level: .a2,
            errorType: .separableVerb
        ),
        SwipeSentence(
            sentence: "Ich habe gestern ins Kino gegangen.",
            translation: "I went to the cinema yesterday.",
            isCorrect: false,
            explanation: "'Gehen' is a movement verb! It uses 'sein' (not 'haben') as auxiliary in Perfekt.",
            correctVersion: "Ich bin gestern ins Kino gegangen.",
            grammarTopics: [.perfectTense, .verbs],
            level: .a2,
            errorType: .tenseError
        ),
        SwipeSentence(
            sentence: "Ich lerne Deutsch, weil ich will in Deutschland arbeiten.",
            translation: "I learn German because I want to work in Germany.",
            isCorrect: false,
            explanation: "After 'weil', the conjugated verb goes to the END! Word order changes in subordinate clauses.",
            correctVersion: "Ich lerne Deutsch, weil ich in Deutschland arbeiten will.",
            grammarTopics: [.connectors, .subordinateClauses, .wordOrder],
            level: .a2,
            errorType: .wordOrder
        ),
        SwipeSentence(
            sentence: "Sie nicht arbeitet heute.",
            translation: "She doesn't work today.",
            isCorrect: false,
            explanation: "Word order! Verb must be in position 2. 'Nicht' goes after the verb.",
            correctVersion: "Sie arbeitet heute nicht.",
            grammarTopics: [.negation, .wordOrder],
            level: .a2,
            errorType: .wordOrder
        ),

        // More variety
        SwipeSentence(
            sentence: "Mir gefällt die Musik.",
            translation: "I like the music.",
            isCorrect: true,
            explanation: "Correct! 'Gefallen' requires dative. The thing liked (die Musik) is the subject!",
            grammarTopics: [.dative, .verbs],
            level: .a2
        ),
        SwipeSentence(
            sentence: "Ich gefalle die Musik.",
            translation: "I like the music.",
            isCorrect: false,
            explanation: "'Gefallen' works backwards! The thing liked is subject, person who likes is dative.",
            correctVersion: "Mir gefällt die Musik.",
            grammarTopics: [.dative, .verbs],
            level: .a2,
            errorType: .caseError
        ),

        // B1 Level - Correct sentences
        SwipeSentence(
            sentence: "Der Mann, der dort steht, ist mein Vater.",
            translation: "The man who stands there is my father.",
            isCorrect: true,
            explanation: "Correct relative clause! 'Der' matches masculine 'Mann', verb 'steht' at end of clause.",
            grammarTopics: [.relativeClauses, .wordOrder],
            level: .b1
        ),
        SwipeSentence(
            sentence: "Das Buch wird von vielen Menschen gelesen.",
            translation: "The book is read by many people.",
            isCorrect: true,
            explanation: "Perfect passive construction! 'Wird' + past participle, 'von' + dative for agent.",
            grammarTopics: [.passive, .verbs],
            level: .b1
        ),
        SwipeSentence(
            sentence: "Wenn ich mehr Zeit hätte, würde ich mehr lesen.",
            translation: "If I had more time, I would read more.",
            isCorrect: true,
            explanation: "Correct Konjunktiv II! 'Hätte' for 'haben', 'würde' + infinitive for the result.",
            grammarTopics: [.subjunctive],
            level: .b1
        ),
        SwipeSentence(
            sentence: "Bevor ich das Haus verlasse, mache ich das Licht aus.",
            translation: "Before I leave the house, I turn off the light.",
            isCorrect: true,
            explanation: "Correct use of 'bevor'! Verb goes to end in the subordinate clause.",
            grammarTopics: [.connectors, .subordinateClauses],
            level: .b1
        ),
        SwipeSentence(
            sentence: "Je mehr ich übe, desto besser werde ich.",
            translation: "The more I practice, the better I get.",
            isCorrect: true,
            explanation: "Perfect 'je...desto' construction! 'Je' clause has verb at end, 'desto' has verb in position 2.",
            grammarTopics: [.connectors, .wordOrder],
            level: .b1
        ),

        // B1 Level - Incorrect sentences
        SwipeSentence(
            sentence: "Der Mann, der steht dort, ist mein Vater.",
            translation: "The man who stands there is my father.",
            isCorrect: false,
            explanation: "In relative clauses, the verb must go to the END! 'Der dort steht' not 'der steht dort'.",
            correctVersion: "Der Mann, der dort steht, ist mein Vater.",
            grammarTopics: [.relativeClauses, .wordOrder],
            level: .b1,
            errorType: .wordOrder
        ),
        SwipeSentence(
            sentence: "Das Buch ist gelesen von vielen Menschen.",
            translation: "The book is read by many people.",
            isCorrect: false,
            explanation: "Passive needs 'werden' not 'sein'! 'Sein' + participle describes a state, not an action.",
            correctVersion: "Das Buch wird von vielen Menschen gelesen.",
            grammarTopics: [.passive, .verbs],
            level: .b1,
            errorType: .verbConjugation
        ),
        SwipeSentence(
            sentence: "Wenn ich hätte mehr Zeit, ich würde mehr lesen.",
            translation: "If I had more time, I would read more.",
            isCorrect: false,
            explanation: "Word order error! After 'wenn', verb goes to end. In the main clause, verb is position 2.",
            correctVersion: "Wenn ich mehr Zeit hätte, würde ich mehr lesen.",
            grammarTopics: [.subjunctive, .wordOrder],
            level: .b1,
            errorType: .wordOrder
        ),
        SwipeSentence(
            sentence: "Obwohl es regnet, aber ich gehe spazieren.",
            translation: "Although it's raining, I go for a walk.",
            isCorrect: false,
            explanation: "'Obwohl' and 'aber' are redundant! Use one or the other, not both.",
            correctVersion: "Obwohl es regnet, gehe ich spazieren.",
            grammarTopics: [.connectors],
            level: .b1,
            errorType: .wordOrder
        ),
        SwipeSentence(
            sentence: "Der Film, den ich gesehen habe, war es gut.",
            translation: "The film that I saw was good.",
            isCorrect: false,
            explanation: "Remove 'es'! The subject 'der Film' is already stated. 'War gut' is sufficient.",
            correctVersion: "Der Film, den ich gesehen habe, war gut.",
            grammarTopics: [.relativeClauses],
            level: .b1,
            errorType: .wordOrder
        ),

        // B2 Level - Correct sentences
        SwipeSentence(
            sentence: "Wegen des schlechten Wetters sind wir zu Hause geblieben.",
            translation: "Because of the bad weather, we stayed home.",
            isCorrect: true,
            explanation: "Perfect genitive! 'Wegen' + genitive (des schlechten Wetters).",
            grammarTopics: [.genitive, .prepositions],
            level: .b2
        ),
        SwipeSentence(
            sentence: "Das ist das Buch, dessen Autor sehr bekannt ist.",
            translation: "That is the book whose author is very famous.",
            isCorrect: true,
            explanation: "Correct 'dessen'! Genitive relative pronoun for masculine/neuter.",
            grammarTopics: [.relativeClauses, .genitive],
            level: .b2
        ),
        SwipeSentence(
            sentence: "Ich hätte gern einen Kaffee, wenn es Ihnen nichts ausmacht.",
            translation: "I would like a coffee, if you don't mind.",
            isCorrect: true,
            explanation: "Perfect polite request! 'Hätte gern' + subjunctive in the condition.",
            grammarTopics: [.subjunctive, .greetings],
            level: .b2
        ),
        SwipeSentence(
            sentence: "Er muss gestern nicht haben arbeiten können.",
            translation: "He must not have been able to work yesterday.",
            isCorrect: true,
            explanation: "Complex modal structure! Double infinitive at end: 'arbeiten können'.",
            grammarTopics: [.modalVerbs, .perfectTense],
            level: .b2
        ),

        // B2 Level - Incorrect sentences
        SwipeSentence(
            sentence: "Wegen dem schlechten Wetter sind wir zu Hause geblieben.",
            translation: "Because of the bad weather, we stayed home.",
            isCorrect: false,
            explanation: "'Wegen' requires genitive! 'dem Wetter' is dative. Should be 'des Wetters'.",
            correctVersion: "Wegen des schlechten Wetters sind wir zu Hause geblieben.",
            grammarTopics: [.genitive, .prepositions],
            level: .b2,
            errorType: .caseError
        ),
        SwipeSentence(
            sentence: "Das ist die Frau, dessen Mann Arzt ist.",
            translation: "That is the woman whose husband is a doctor.",
            isCorrect: false,
            explanation: "'Dessen' is for masculine/neuter. For feminine nouns, use 'deren'!",
            correctVersion: "Das ist die Frau, deren Mann Arzt ist.",
            grammarTopics: [.relativeClauses, .genitive],
            level: .b2,
            errorType: .caseError
        ),
        SwipeSentence(
            sentence: "Innerhalb das Gebäude ist Rauchen verboten.",
            translation: "Inside the building, smoking is prohibited.",
            isCorrect: false,
            explanation: "'Innerhalb' requires genitive! 'Das Gebäude' → 'des Gebäudes'.",
            correctVersion: "Innerhalb des Gebäudes ist Rauchen verboten.",
            grammarTopics: [.genitive, .prepositions],
            level: .b2,
            errorType: .caseError
        ),
        SwipeSentence(
            sentence: "Ich habe das nicht machen gekonnt.",
            translation: "I couldn't do that.",
            isCorrect: false,
            explanation: "With modals in Perfekt + another infinitive, use infinitive not participle!",
            correctVersion: "Ich habe das nicht machen können.",
            grammarTopics: [.modalVerbs, .perfectTense],
            level: .b2,
            errorType: .verbConjugation
        ),

        // More A1 sentences for variety
        SwipeSentence(
            sentence: "Ich komme aus Deutschland.",
            translation: "I come from Germany.",
            isCorrect: true,
            explanation: "Correct! 'Kommen aus' + country without article.",
            grammarTopics: [.verbs, .prepositions],
            level: .a1
        ),
        SwipeSentence(
            sentence: "Ich komme von Deutschland.",
            translation: "I come from Germany.",
            isCorrect: false,
            explanation: "'Kommen AUS' (not 'von') for origin/country!",
            correctVersion: "Ich komme aus Deutschland.",
            grammarTopics: [.prepositions],
            level: .a1,
            errorType: .preposition
        ),
        SwipeSentence(
            sentence: "Meine Schwester ist älter als ich.",
            translation: "My sister is older than me.",
            isCorrect: true,
            explanation: "Correct comparative! 'Älter' (with umlaut) + 'als' for comparison.",
            grammarTopics: [.nouns],
            level: .a2
        ),
        SwipeSentence(
            sentence: "Meine Schwester ist älter wie ich.",
            translation: "My sister is older than me.",
            isCorrect: false,
            explanation: "Use 'ALS' (not 'wie') for comparisons! 'Wie' is for equality.",
            correctVersion: "Meine Schwester ist älter als ich.",
            grammarTopics: [.nouns],
            level: .a2,
            errorType: .wordOrder
        ),
        SwipeSentence(
            sentence: "Gestern bin ich ins Kino gegangen.",
            translation: "Yesterday I went to the cinema.",
            isCorrect: true,
            explanation: "Perfect tense! Movement verb 'gehen' uses 'sein'. Time expression first is fine.",
            grammarTopics: [.perfectTense, .wordOrder],
            level: .a2
        ),
        SwipeSentence(
            sentence: "Ich bin seit drei Jahren Deutsch lernend.",
            translation: "I have been learning German for three years.",
            isCorrect: false,
            explanation: "German uses present tense with 'seit' for ongoing actions!",
            correctVersion: "Ich lerne seit drei Jahren Deutsch.",
            grammarTopics: [.presentTense, .prepositions],
            level: .a2,
            errorType: .tenseError
        ),
    ]

    // MARK: - Helper Methods

    static func flashcards(for level: CEFRLevel) -> [Flashcard] {
        flashcards.filter { $0.level == level }
    }

    static func flashcards(for topic: GrammarTopic) -> [Flashcard] {
        flashcards.filter { $0.grammarTopics.contains(topic) }
    }

    static func flashcards(for category: ThematicCategory) -> [Flashcard] {
        flashcards.filter { $0.thematicCategory == category }
    }

    static func swipeSentences(for level: CEFRLevel) -> [SwipeSentence] {
        swipeSentences.filter { $0.level == level }
    }

    static func swipeSentences(for topic: GrammarTopic) -> [SwipeSentence] {
        swipeSentences.filter { $0.grammarTopics.contains(topic) }
    }
}
