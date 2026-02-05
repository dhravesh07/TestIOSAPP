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
            conjugation: VerbConjugation(
                infinitive: "gehen",
                meaning: "to go",
                isRegular: true,
                present: .init(ich: "gehe", du: "gehst", erSieEs: "geht", wir: "gehen", ihr: "geht", sieSie: "gehen"),
                perfect: .init(auxiliary: "sein", pastParticiple: "gegangen"),
                isModal: false,
                isSeparable: false,
                separablePrefix: nil
            ),
            grammarTip: "Movement verbs use 'sein' in Perfekt: Ich bin gegangen."
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
            conjugation: VerbConjugation(
                infinitive: "sprechen",
                meaning: "to speak",
                isRegular: false,
                present: .init(ich: "spreche", du: "sprichst", erSieEs: "spricht", wir: "sprechen", ihr: "sprecht", sieSie: "sprechen"),
                perfect: .init(auxiliary: "haben", pastParticiple: "gesprochen"),
                isModal: false,
                isSeparable: false,
                separablePrefix: nil
            ),
            grammarTip: "e→i verbs: sprechen, helfen, nehmen, geben, essen, sehen"
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
            conjugation: VerbConjugation(
                infinitive: "fahren",
                meaning: "to drive/travel",
                isRegular: false,
                present: .init(ich: "fahre", du: "fährst", erSieEs: "fährt", wir: "fahren", ihr: "fahrt", sieSie: "fahren"),
                perfect: .init(auxiliary: "sein", pastParticiple: "gefahren"),
                isModal: false,
                isSeparable: false,
                separablePrefix: nil
            ),
            grammarTip: "a→ä verbs: fahren, schlafen, tragen, waschen, laufen"
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
            conjugation: VerbConjugation(
                infinitive: "können",
                meaning: "can, to be able to",
                isRegular: false,
                present: .init(ich: "kann", du: "kannst", erSieEs: "kann", wir: "können", ihr: "könnt", sieSie: "können"),
                perfect: nil,
                isModal: true,
                isSeparable: false,
                separablePrefix: nil
            ),
            grammarTip: "Modal + infinitive at END: Ich kann gut schwimmen."
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
            conjugation: VerbConjugation(
                infinitive: "aufstehen",
                meaning: "to get up, to stand up",
                isRegular: false,
                present: .init(ich: "stehe...auf", du: "stehst...auf", erSieEs: "steht...auf", wir: "stehen...auf", ihr: "steht...auf", sieSie: "stehen...auf"),
                perfect: .init(auxiliary: "sein", pastParticiple: "aufgestanden"),
                isModal: false,
                isSeparable: true,
                separablePrefix: "auf"
            ),
            grammarTip: "In Perfekt, ge- goes between prefix and stem: aufGEstanden"
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
            caseBreakdown: CaseBreakdown(
                originalSentence: "Die Frau sieht den Mann.",
                translation: "The woman sees the man.",
                components: [
                    .init(word: "Die Frau", grammaticalCase: .nominative, role: "subject", explanation: "Who sees? The woman"),
                    .init(word: "den Mann", grammaticalCase: .accusative, role: "direct object", explanation: "Whom does she see? The man (accusative: der→den)")
                ]
            ),
            grammarTip: "Only MASCULINE changes in accusative: der→den, ein→einen"
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
            caseBreakdown: CaseBreakdown(
                originalSentence: "Er gibt dem Kind einen Ball.",
                translation: "He gives the child a ball.",
                components: [
                    .init(word: "Er", grammaticalCase: .nominative, role: "subject", explanation: "Who gives? He"),
                    .init(word: "dem Kind", grammaticalCase: .dative, role: "indirect object", explanation: "To whom? The child (das→dem)"),
                    .init(word: "einen Ball", grammaticalCase: .accusative, role: "direct object", explanation: "What? A ball (ein→einen)")
                ]
            ),
            grammarTip: "Dative articles: dem (m/n), der (f), den + n (plural)"
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
