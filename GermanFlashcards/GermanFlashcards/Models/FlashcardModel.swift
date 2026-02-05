import Foundation

/// MARK: - Grammar Topics (Linguistic Categories)

enum GrammarTopic: String, Codable, CaseIterable, Identifiable {
    // Core Grammar
    case articles = "Articles (der/die/das)"
    case nouns = "Nouns & Gender"
    case pronouns = "Pronouns"
    case verbs = "Verbs & Conjugation"
    case modalVerbs = "Modal Verbs"
    case separableVerbs = "Separable Verbs"
    case reflexiveVerbs = "Reflexive Verbs"

    // Cases
    case nominative = "Nominative Case"
    case accusative = "Accusative Case"
    case dative = "Dative Case"
    case genitive = "Genitive Case"

    // Sentence Structure
    case wordOrder = "Word Order"
    case negation = "Negation (nicht/kein)"
    case questions = "Questions"
    case connectors = "Connectors (und, aber, weil...)"
    case subordinateClauses = "Subordinate Clauses"
    case relativeClauses = "Relative Clauses"

    // Tenses
    case presentTense = "Present Tense"
    case perfectTense = "Perfect Tense (Perfekt)"
    case pastTense = "Simple Past (Präteritum)"
    case futureTense = "Future Tense"

    // Advanced
    case passive = "Passive Voice"
    case subjunctive = "Subjunctive (Konjunktiv)"
    case idioms = "Idiomatic Expressions"

    // Other
    case prepositions = "Prepositions"
    case adjectives = "Adjective Endings"
    case comparatives = "Comparatives & Superlatives"
    case numbers = "Numbers & Counting"
    case time = "Time & Dates"
    case greetings = "Greetings & Phrases"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .articles: return "textformat.abc"
        case .nouns: return "character.book.closed"
        case .pronouns: return "person.fill.questionmark"
        case .verbs: return "bolt.fill"
        case .modalVerbs: return "dial.high.fill"
        case .separableVerbs: return "arrow.left.arrow.right"
        case .reflexiveVerbs: return "arrow.uturn.backward"
        case .nominative: return "1.circle.fill"
        case .accusative: return "2.circle.fill"
        case .dative: return "3.circle.fill"
        case .genitive: return "4.circle.fill"
        case .wordOrder: return "text.alignleft"
        case .negation: return "xmark.circle.fill"
        case .questions: return "questionmark.circle.fill"
        case .connectors: return "link"
        case .subordinateClauses: return "text.insert"
        case .relativeClauses: return "arrow.triangle.branch"
        case .presentTense: return "clock.fill"
        case .perfectTense: return "checkmark.circle.fill"
        case .pastTense: return "clock.arrow.circlepath"
        case .futureTense: return "arrow.right.circle.fill"
        case .passive: return "arrow.uturn.left.circle"
        case .subjunctive: return "cloud.fill"
        case .idioms: return "quote.bubble.fill"
        case .prepositions: return "arrow.up.left.and.arrow.down.right"
        case .adjectives: return "paintpalette.fill"
        case .comparatives: return "chart.bar.fill"
        case .numbers: return "number.circle.fill"
        case .time: return "calendar"
        case .greetings: return "hand.wave.fill"
        }
    }

    var color: String {
        switch self {
        case .articles, .nouns, .pronouns: return "blue"
        case .verbs, .modalVerbs, .separableVerbs, .reflexiveVerbs: return "green"
        case .nominative, .accusative, .dative, .genitive: return "purple"
        case .wordOrder, .negation, .questions, .connectors, .subordinateClauses, .relativeClauses: return "orange"
        case .presentTense, .perfectTense, .pastTense, .futureTense: return "red"
        case .passive, .subjunctive: return "indigo"
        case .idioms: return "pink"
        case .prepositions, .adjectives, .comparatives, .numbers, .time: return "cyan"
        case .greetings: return "yellow"
        }
    }

    var cefrLevel: CEFRLevel {
        switch self {
        case .articles, .nouns, .pronouns, .verbs, .nominative, .accusative, .presentTense, .negation, .questions, .numbers, .time, .greetings:
            return .a1
        case .modalVerbs, .dative, .perfectTense, .prepositions, .wordOrder, .connectors, .separableVerbs:
            return .a2
        case .reflexiveVerbs, .pastTense, .subordinateClauses, .adjectives, .comparatives, .futureTense, .relativeClauses:
            return .b1
        case .genitive, .passive, .subjunctive, .idioms:
            return .b2
        }
    }

    var description: String {
        switch self {
        case .articles: return "Learn der, die, das and when to use each"
        case .nouns: return "Noun genders and plural forms"
        case .pronouns: return "Personal, possessive, and other pronouns"
        case .verbs: return "Regular and irregular verb conjugations"
        case .modalVerbs: return "können, müssen, wollen, dürfen, sollen, mögen"
        case .separableVerbs: return "Verbs with separable prefixes (aufstehen, anfangen...)"
        case .reflexiveVerbs: return "Verbs used with reflexive pronouns"
        case .nominative: return "Subject case - who/what does the action"
        case .accusative: return "Direct object case - whom/what receives action"
        case .dative: return "Indirect object case - to whom/for whom"
        case .genitive: return "Possessive case - whose/of what"
        case .wordOrder: return "German sentence structure rules"
        case .negation: return "How to make sentences negative"
        case .questions: return "Forming questions in German"
        case .connectors: return "Coordinating and subordinating conjunctions"
        case .subordinateClauses: return "Dependent clauses and word order changes"
        case .relativeClauses: return "Clauses that describe nouns (der Mann, der...)"
        case .presentTense: return "Current actions and general truths"
        case .perfectTense: return "Conversational past tense"
        case .pastTense: return "Written/narrative past tense"
        case .futureTense: return "Future actions with werden"
        case .passive: return "Actions done to the subject (wird gemacht)"
        case .subjunctive: return "Wishes, hypotheticals, polite requests"
        case .idioms: return "Common German expressions and sayings"
        case .prepositions: return "Prepositions with accusative, dative, or two-way"
        case .adjectives: return "Adjective declension based on case and article"
        case .comparatives: return "Comparing things (größer, am größten)"
        case .numbers: return "Cardinal and ordinal numbers"
        case .time: return "Time expressions and dates"
        case .greetings: return "Common greetings and everyday phrases"
        }
    }
}

/// MARK: - CEFR Levels

enum CEFRLevel: String, Codable, CaseIterable, Comparable {
    case a1 = "A1"
    case a2 = "A2"
    case b1 = "B1"
    case b2 = "B2"
    case c1 = "C1"
    case c2 = "C2"

    var name: String {
        switch self {
        case .a1: return "Beginner"
        case .a2: return "Elementary"
        case .b1: return "Intermediate"
        case .b2: return "Upper Intermediate"
        case .c1: return "Advanced"
        case .c2: return "Mastery"
        }
    }

    var description: String {
        switch self {
        case .a1: return "Can understand and use basic phrases"
        case .a2: return "Can communicate in simple routine tasks"
        case .b1: return "Can deal with most travel situations"
        case .b2: return "Can interact with fluency and spontaneity"
        case .c1: return "Can express ideas fluently and spontaneously"
        case .c2: return "Can understand virtually everything heard or read"
        }
    }

    var pointsRequired: Int {
        switch self {
        case .a1: return 0
        case .a2: return 500
        case .b1: return 1500
        case .b2: return 3500
        case .c1: return 6500
        case .c2: return 10000
        }
    }

    var color: String {
        switch self {
        case .a1: return "green"
        case .a2: return "blue"
        case .b1: return "purple"
        case .b2: return "orange"
        case .c1: return "red"
        case .c2: return "yellow"
        }
    }

    static func < (lhs: CEFRLevel, rhs: CEFRLevel) -> Bool {
        let order: [CEFRLevel] = [.a1, .a2, .b1, .b2, .c1, .c2]
        return order.firstIndex(of: lhs)! < order.firstIndex(of: rhs)!
    }
}

/// MARK: - Card Type (Enhanced)

enum CardType: String, Codable, CaseIterable {
    case vocabulary = "Vocabulary"
    case sentence = "Sentence"
    case grammar = "Grammar Rule"
    case conjugation = "Conjugation"
    case caseExample = "Case Example"
    case translation = "Translation"
}

/// MARK: - Thematic Category (Topics)

enum ThematicCategory: String, Codable, CaseIterable, Identifiable {
    case greetings = "Greetings"
    case introductions = "Introductions"
    case family = "Family"
    case food = "Food & Drinks"
    case shopping = "Shopping"
    case travel = "Travel"
    case work = "Work"
    case health = "Health"
    case weather = "Weather"
    case home = "Home"
    case hobbies = "Hobbies"
    case dailyRoutine = "Daily Routine"
    case directions = "Directions"
    case time = "Time & Dates"
    case emotions = "Emotions"
    case opinions = "Opinions"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .greetings: return "hand.wave.fill"
        case .introductions: return "person.badge.plus"
        case .family: return "person.3.fill"
        case .food: return "fork.knife"
        case .shopping: return "cart.fill"
        case .travel: return "airplane"
        case .work: return "briefcase.fill"
        case .health: return "heart.fill"
        case .weather: return "cloud.sun.fill"
        case .home: return "house.fill"
        case .hobbies: return "gamecontroller.fill"
        case .dailyRoutine: return "sun.and.horizon.fill"
        case .directions: return "map.fill"
        case .time: return "clock.fill"
        case .emotions: return "face.smiling.fill"
        case .opinions: return "text.bubble.fill"
        }
    }
}

/// MARK: - Enhanced Flashcard

struct Flashcard: Identifiable, Codable, Equatable {
    let id: UUID
    let german: String
    let english: String
    let explanation: String
    let example: String
    let exampleTranslation: String
    let grammarTopics: [GrammarTopic]  // Can belong to multiple grammar topics
    let thematicCategory: ThematicCategory
    let level: CEFRLevel
    let cardType: CardType
    let grammarTip: String?
    let audioHint: String?  // Pronunciation guide
    let memoryTip: String?  // Mnemonic device

    // For verb cards
    let conjugation: VerbConjugation?

    // For case examples
    let caseBreakdown: CaseBreakdown?

    init(
        id: UUID = UUID(),
        german: String,
        english: String,
        explanation: String,
        example: String,
        exampleTranslation: String,
        grammarTopics: [GrammarTopic],
        thematicCategory: ThematicCategory,
        level: CEFRLevel,
        cardType: CardType,
        grammarTip: String? = nil,
        audioHint: String? = nil,
        memoryTip: String? = nil,
        conjugation: VerbConjugation? = nil,
        caseBreakdown: CaseBreakdown? = nil
    ) {
        self.id = id
        self.german = german
        self.english = english
        self.explanation = explanation
        self.example = example
        self.exampleTranslation = exampleTranslation
        self.grammarTopics = grammarTopics
        self.thematicCategory = thematicCategory
        self.level = level
        self.cardType = cardType
        self.grammarTip = grammarTip
        self.audioHint = audioHint
        self.memoryTip = memoryTip
        self.conjugation = conjugation
        self.caseBreakdown = caseBreakdown
    }

    // Points awarded for correct answer (based on difficulty)
    var points: Int {
        switch level {
        case .a1: return 10
        case .a2: return 15
        case .b1: return 25
        case .b2: return 40
        case .c1: return 60
        case .c2: return 100
        }
    }
}

/// MARK: - Verb Conjugation

struct VerbConjugation: Codable, Equatable {
    let infinitive: String
    let meaning: String
    let isRegular: Bool
    let present: ConjugationSet
    let perfect: PerfectTense?
    let isModal: Bool
    let isSeparable: Bool
    let separablePrefix: String?

    struct ConjugationSet: Codable, Equatable {
        let ich: String
        let du: String
        let erSieEs: String
        let wir: String
        let ihr: String
        let sieSie: String
    }

    struct PerfectTense: Codable, Equatable {
        let auxiliary: String  // haben or sein
        let pastParticiple: String
    }
}

/// MARK: - Case Breakdown

struct CaseBreakdown: Codable, Equatable {
    let originalSentence: String
    let translation: String
    let components: [CaseComponent]

    struct CaseComponent: Codable, Equatable {
        let word: String
        let grammaticalCase: GrammaticalCase
        let role: String  // e.g., "subject", "direct object", "indirect object"
        let explanation: String
    }

    enum GrammaticalCase: String, Codable {
        case nominative = "Nominative"
        case accusative = "Accusative"
        case dative = "Dative"
        case genitive = "Genitive"
    }
}

/// MARK: - Swipe Sentence (Enhanced)

struct SwipeSentence: Identifiable, Codable {
    let id: UUID
    let sentence: String
    let translation: String
    let isCorrect: Bool
    let explanation: String
    let correctVersion: String?
    let grammarTopics: [GrammarTopic]
    let level: CEFRLevel
    let errorType: GrammarErrorType?

    init(
        id: UUID = UUID(),
        sentence: String,
        translation: String,
        isCorrect: Bool,
        explanation: String,
        correctVersion: String? = nil,
        grammarTopics: [GrammarTopic] = [],
        level: CEFRLevel = .a1,
        errorType: GrammarErrorType? = nil
    ) {
        self.id = id
        self.sentence = sentence
        self.translation = translation
        self.isCorrect = isCorrect
        self.explanation = explanation
        self.correctVersion = correctVersion
        self.grammarTopics = grammarTopics
        self.level = level
        self.errorType = errorType
    }

    var points: Int {
        switch level {
        case .a1: return 10
        case .a2: return 15
        case .b1: return 25
        case .b2: return 40
        case .c1: return 60
        case .c2: return 100
        }
    }
}

enum GrammarErrorType: String, Codable {
    case articleGender = "Wrong Article Gender"
    case verbConjugation = "Verb Conjugation Error"
    case caseError = "Wrong Case"
    case wordOrder = "Word Order Error"
    case preposition = "Preposition Error"
    case negation = "Negation Error"
    case pluralForm = "Plural Form Error"
    case adjectiveEnding = "Adjective Ending Error"
    case separableVerb = "Separable Verb Error"
    case modalVerb = "Modal Verb Error"
    case tenseError = "Tense Error"
}

/// MARK: - Quiz Question (Enhanced)

struct QuizQuestion: Identifiable {
    let id: UUID
    let flashcard: Flashcard
    let questionType: QuestionType
    let options: [String]
    let correctAnswer: String
    let level: CEFRLevel

    init(
        id: UUID = UUID(),
        flashcard: Flashcard,
        questionType: QuestionType,
        options: [String],
        correctAnswer: String
    ) {
        self.id = id
        self.flashcard = flashcard
        self.questionType = questionType
        self.options = options
        self.correctAnswer = correctAnswer
        self.level = flashcard.level
    }

    enum QuestionType: String, CaseIterable {
        case germanToEnglish = "German → English"
        case englishToGerman = "English → German"
        case fillInBlank = "Fill in the Blank"
        case selectCorrectForm = "Select Correct Form"
        case conjugation = "Conjugate the Verb"
        case caseSelection = "Select the Case"
        case articleSelection = "Choose the Article"
    }
}

/// MARK: - Card Performance (for Spaced Repetition)

struct CardPerformance: Codable, Identifiable {
    let id: UUID  // Same as card ID
    var timesShown: Int = 0
    var timesCorrect: Int = 0
    var lastShown: Date?
    var nextReviewDate: Date
    var easeFactor: Double = 2.5  // SM-2 algorithm
    var interval: Int = 1  // Days until next review
    var consecutiveCorrect: Int = 0

    var accuracy: Double {
        guard timesShown > 0 else { return 0 }
        return Double(timesCorrect) / Double(timesShown)
    }

    var masteryLevel: MasteryLevel {
        if consecutiveCorrect >= 5 && accuracy >= 0.9 {
            return .mastered
        } else if consecutiveCorrect >= 3 && accuracy >= 0.7 {
            return .familiar
        } else if timesShown >= 2 && accuracy >= 0.5 {
            return .learning
        } else {
            return .new
        }
    }

    enum MasteryLevel: String, Codable {
        case new = "New"
        case learning = "Learning"
        case familiar = "Familiar"
        case mastered = "Mastered"

        var color: String {
            switch self {
            case .new: return "gray"
            case .learning: return "orange"
            case .familiar: return "blue"
            case .mastered: return "green"
            }
        }
    }

    init(cardId: UUID) {
        self.id = cardId
        self.nextReviewDate = Date()
    }

    // SM-2 Spaced Repetition Algorithm
    mutating func recordAnswer(correct: Bool) {
        timesShown += 1
        lastShown = Date()

        if correct {
            timesCorrect += 1
            consecutiveCorrect += 1

            // Calculate new interval
            if consecutiveCorrect == 1 {
                interval = 1
            } else if consecutiveCorrect == 2 {
                interval = 6
            } else {
                interval = Int(Double(interval) * easeFactor)
            }

            // Adjust ease factor (increase for correct)
            easeFactor = max(1.3, easeFactor + 0.1)
        } else {
            consecutiveCorrect = 0
            interval = 1  // Reset to 1 day

            // Adjust ease factor (decrease for incorrect)
            easeFactor = max(1.3, easeFactor - 0.2)
        }

        // Set next review date
        nextReviewDate = Calendar.current.date(byAdding: .day, value: interval, to: Date()) ?? Date()
    }
}

/// MARK: - User Progress (Enhanced)

struct UserProgress: Codable {
    var totalPoints: Int = 0
    var correctAnswers: Int = 0
    var totalAnswers: Int = 0
    var currentStreak: Int = 0
    var longestStreak: Int = 0
    var lastStudyDate: Date?

    // Card performance tracking
    var cardPerformances: [UUID: CardPerformance] = [:]

    // Level progress
    var levelProgress: [String: LevelProgress] = [:]

    // Grammar topic progress
    var grammarProgress: [String: TopicProgress] = [:]

    // Daily stats
    var dailyStats: [String: DailyStats] = [:]  // Key is date string

    var currentLevel: CEFRLevel {
        for level in CEFRLevel.allCases.reversed() {
            if totalPoints >= level.pointsRequired {
                return level
            }
        }
        return .a1
    }

    var progressToNextLevel: Double {
        let current = currentLevel
        guard let nextIndex = CEFRLevel.allCases.firstIndex(of: current),
              nextIndex + 1 < CEFRLevel.allCases.count else {
            return 1.0  // Max level
        }
        let next = CEFRLevel.allCases[nextIndex + 1]
        let pointsInLevel = totalPoints - current.pointsRequired
        let pointsNeeded = next.pointsRequired - current.pointsRequired
        return min(1.0, Double(pointsInLevel) / Double(pointsNeeded))
    }

    var accuracy: Double {
        guard totalAnswers > 0 else { return 0 }
        return Double(correctAnswers) / Double(totalAnswers) * 100
    }
}

struct LevelProgress: Codable {
    var cardsStudied: Int = 0
    var cardsMastered: Int = 0
    var totalCards: Int = 0
    var averageAccuracy: Double = 0

    var percentage: Double {
        guard totalCards > 0 else { return 0 }
        return Double(cardsMastered) / Double(totalCards) * 100
    }
}

struct TopicProgress: Codable {
    var cardsStudied: Int = 0
    var cardsMastered: Int = 0
    var totalCards: Int = 0
    var correctAnswers: Int = 0
    var totalAnswers: Int = 0
    var lastStudied: Date?

    var accuracy: Double {
        guard totalAnswers > 0 else { return 0 }
        return Double(correctAnswers) / Double(totalAnswers) * 100
    }

    var masteryPercentage: Double {
        guard totalCards > 0 else { return 0 }
        return Double(cardsMastered) / Double(totalCards) * 100
    }
}

struct DailyStats: Codable {
    var cardsStudied: Int = 0
    var correctAnswers: Int = 0
    var totalAnswers: Int = 0
    var pointsEarned: Int = 0
    var timeSpentMinutes: Int = 0
}

/// MARK: - Learning Session

struct LearningSession: Identifiable {
    let id = UUID()
    let mode: LearningMode
    let level: CEFRLevel?
    let grammarTopics: [GrammarTopic]?
    let thematicCategory: ThematicCategory?
    var cards: [Flashcard]
    var currentIndex: Int = 0
    var correctCount: Int = 0
    var incorrectCount: Int = 0
    var startTime: Date = Date()
    var answers: [(cardId: UUID, correct: Bool, timeSpent: TimeInterval)] = []

    enum LearningMode: String {
        case flashcards = "Flashcards"
        case quiz = "Quiz"
        case swipe = "Swipe Practice"
        case review = "Review Weak Cards"
        case newCards = "Learn New Cards"
        case levelTest = "Level Test"
    }

    var isComplete: Bool {
        currentIndex >= cards.count
    }

    var progress: Double {
        guard !cards.isEmpty else { return 0 }
        return Double(currentIndex) / Double(cards.count)
    }

    var accuracy: Double {
        let total = correctCount + incorrectCount
        guard total > 0 else { return 0 }
        return Double(correctCount) / Double(total) * 100
    }
}
