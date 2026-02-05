import Foundation

enum CardType: String, Codable, CaseIterable {
    case vocabulary
    case sentence
    case grammar
}

enum DifficultyLevel: String, Codable, CaseIterable {
    case a1 = "A1"
    case a2 = "A2"
}

enum Category: String, Codable, CaseIterable, Identifiable {
    case greetings = "Greetings & Introductions"
    case numbers = "Numbers & Time"
    case family = "Family & Relationships"
    case food = "Food & Drinks"
    case travel = "Travel & Directions"
    case shopping = "Shopping & Money"
    case weather = "Weather & Seasons"
    case health = "Health & Body"
    case work = "Work & Education"
    case hobbies = "Hobbies & Free Time"
    case home = "Home & Living"
    case grammar = "Grammar Essentials"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .greetings: return "hand.wave.fill"
        case .numbers: return "number.circle.fill"
        case .family: return "person.3.fill"
        case .food: return "fork.knife"
        case .travel: return "airplane"
        case .shopping: return "cart.fill"
        case .weather: return "cloud.sun.fill"
        case .health: return "heart.fill"
        case .work: return "briefcase.fill"
        case .hobbies: return "gamecontroller.fill"
        case .home: return "house.fill"
        case .grammar: return "book.fill"
        }
    }

    var color: String {
        switch self {
        case .greetings: return "orange"
        case .numbers: return "blue"
        case .family: return "pink"
        case .food: return "green"
        case .travel: return "purple"
        case .shopping: return "yellow"
        case .weather: return "cyan"
        case .health: return "red"
        case .work: return "indigo"
        case .hobbies: return "mint"
        case .home: return "brown"
        case .grammar: return "gray"
        }
    }
}

struct Flashcard: Identifiable, Codable, Equatable {
    let id: UUID
    let german: String
    let english: String
    let explanation: String
    let example: String
    let exampleTranslation: String
    let category: Category
    let difficulty: DifficultyLevel
    let cardType: CardType
    let grammarTip: String?

    init(
        id: UUID = UUID(),
        german: String,
        english: String,
        explanation: String,
        example: String,
        exampleTranslation: String,
        category: Category,
        difficulty: DifficultyLevel,
        cardType: CardType,
        grammarTip: String? = nil
    ) {
        self.id = id
        self.german = german
        self.english = english
        self.explanation = explanation
        self.example = example
        self.exampleTranslation = exampleTranslation
        self.category = category
        self.difficulty = difficulty
        self.cardType = cardType
        self.grammarTip = grammarTip
    }
}

struct QuizQuestion: Identifiable {
    let id = UUID()
    let flashcard: Flashcard
    let questionType: QuestionType
    let options: [String]
    let correctAnswer: String

    enum QuestionType {
        case germanToEnglish
        case englishToGerman
        case fillInBlank
        case trueFalse
    }
}

struct SwipeSentence: Identifiable {
    let id = UUID()
    let sentence: String
    let translation: String
    let isCorrect: Bool
    let explanation: String
    let correctVersion: String?
}

struct UserProgress: Codable {
    var correctAnswers: Int = 0
    var totalAnswers: Int = 0
    var masteredCards: Set<UUID> = []
    var reviewCards: Set<UUID> = []
    var categoryProgress: [String: CategoryProgress] = [:]

    var accuracy: Double {
        guard totalAnswers > 0 else { return 0 }
        return Double(correctAnswers) / Double(totalAnswers) * 100
    }
}

struct CategoryProgress: Codable {
    var completed: Int = 0
    var total: Int = 0
    var mastered: Int = 0

    var percentage: Double {
        guard total > 0 else { return 0 }
        return Double(completed) / Double(total) * 100
    }
}
