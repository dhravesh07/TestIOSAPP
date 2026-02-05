import Foundation

// MARK: - Lesson Manager

class LessonManager {
    static let shared = LessonManager()
    static let lessonsPerUnit = 5

    private init() {}

    // MARK: - Unit Structure

    struct Unit: Identifiable {
        let id: Int
        let title: String
        let description: String
        let level: CEFRLevel
        let topics: [GrammarTopic]
        let thematicFocus: ThematicCategory

        var lessons: [Lesson] {
            (1...LessonManager.lessonsPerUnit).map { lessonNum in
                Lesson(
                    unitId: id,
                    lessonNumber: lessonNum,
                    title: lessonTitle(for: lessonNum),
                    exercises: generateExercises(for: lessonNum)
                )
            }
        }

        private func lessonTitle(for num: Int) -> String {
            switch num {
            case 1: return "Introduction"
            case 2: return "Practice"
            case 3: return "Building Skills"
            case 4: return "Challenge"
            case 5: return "Review & Master"
            default: return "Lesson \(num)"
            }
        }

        private func generateExercises(for lessonNum: Int) -> [Exercise] {
            // Mix of exercise types based on lesson number
            var exercises: [Exercise] = []

            // Get relevant flashcards for this unit
            let unitCards = ContentManager.shared.getFlashcards(for: level, topics: topics)
            let shuffledCards = unitCards.shuffled()

            // Lesson 1: More vocab intro, easier exercises
            // Lesson 5: More challenging, review-focused

            let cardCount = min(8, shuffledCards.count)
            let selectedCards = Array(shuffledCards.prefix(cardCount))

            switch lessonNum {
            case 1: // Introduction - focus on vocabulary
                for (index, card) in selectedCards.prefix(4).enumerated() {
                    exercises.append(.flashcard(card))
                    if index < 2 {
                        exercises.append(.multipleChoice(card))
                    }
                }
                exercises.append(.listening(selectedCards.randomElement() ?? selectedCards[0]))

            case 2: // Practice - mix of exercises
                for card in selectedCards.prefix(3) {
                    exercises.append(.flashcard(card))
                }
                for card in selectedCards.prefix(3) {
                    exercises.append(.multipleChoice(card))
                }
                exercises.append(.fillBlank(selectedCards.randomElement() ?? selectedCards[0]))
                exercises.append(.matching(Array(selectedCards.prefix(4))))

            case 3: // Building Skills - more production
                for card in selectedCards.prefix(2) {
                    exercises.append(.flashcard(card))
                }
                for card in selectedCards.prefix(3) {
                    exercises.append(.fillBlank(card))
                }
                exercises.append(.matching(Array(selectedCards.prefix(4))))
                exercises.append(.wordOrder(selectedCards.randomElement() ?? selectedCards[0]))

            case 4: // Challenge - harder exercises
                for card in selectedCards.prefix(2) {
                    exercises.append(.multipleChoice(card))
                }
                for card in selectedCards.prefix(3) {
                    exercises.append(.fillBlank(card))
                }
                exercises.append(.wordOrder(selectedCards.randomElement() ?? selectedCards[0]))
                exercises.append(.listening(selectedCards.randomElement() ?? selectedCards[0]))
                exercises.append(.matching(Array(selectedCards.prefix(5))))

            case 5: // Review & Master - comprehensive review
                exercises.append(.matching(Array(selectedCards.prefix(4))))
                for card in selectedCards.prefix(3) {
                    exercises.append(.multipleChoice(card))
                }
                for card in selectedCards.prefix(2) {
                    exercises.append(.fillBlank(card))
                }
                exercises.append(.wordOrder(selectedCards.randomElement() ?? selectedCards[0]))
                exercises.append(.listening(selectedCards.randomElement() ?? selectedCards[0]))

            default:
                for card in selectedCards.prefix(5) {
                    exercises.append(.flashcard(card))
                    exercises.append(.multipleChoice(card))
                }
            }

            return exercises
        }
    }

    struct Lesson: Identifiable {
        let unitId: Int
        let lessonNumber: Int
        let title: String
        let exercises: [Exercise]

        var id: String { "\(unitId)-\(lessonNumber)" }
        var xpReward: Int { 10 + (lessonNumber * 2) }
    }

    enum Exercise: Identifiable {
        case flashcard(Flashcard)
        case multipleChoice(Flashcard)
        case fillBlank(Flashcard)
        case matching([Flashcard])
        case listening(Flashcard)
        case wordOrder(Flashcard)
        case swipe(SwipeSentence)

        var id: String {
            switch self {
            case .flashcard(let card): return "flash-\(card.id)"
            case .multipleChoice(let card): return "mc-\(card.id)"
            case .fillBlank(let card): return "fill-\(card.id)"
            case .matching(let cards): return "match-\(cards.first?.id ?? UUID())"
            case .listening(let card): return "listen-\(card.id)"
            case .wordOrder(let card): return "order-\(card.id)"
            case .swipe(let sentence): return "swipe-\(sentence.id)"
            }
        }

        var xpValue: Int {
            switch self {
            case .flashcard: return 2
            case .multipleChoice: return 3
            case .fillBlank: return 4
            case .matching: return 5
            case .listening: return 4
            case .wordOrder: return 5
            case .swipe: return 3
            }
        }
    }

    // MARK: - Course Structure (A1 → B2)

    lazy var allUnits: [Unit] = [
        // A1 Units (1-5)
        Unit(id: 1, title: "Hello & Basics", description: "Greetings and introductions",
             level: .a1, topics: [.greetings, .pronouns], thematicFocus: .greetings),
        Unit(id: 2, title: "Articles & Gender", description: "Der, die, das - the German genders",
             level: .a1, topics: [.articles, .nouns], thematicFocus: .dailyRoutine),
        Unit(id: 3, title: "Present Tense", description: "Regular verb conjugation",
             level: .a1, topics: [.verbs, .presentTense], thematicFocus: .dailyRoutine),
        Unit(id: 4, title: "Numbers & Time", description: "Counting and telling time",
             level: .a1, topics: [.numbers, .time], thematicFocus: .dailyRoutine),
        Unit(id: 5, title: "Family & People", description: "Talking about family",
             level: .a1, topics: [.pronouns, .nouns], thematicFocus: .family),

        // A2 Units (6-10)
        Unit(id: 6, title: "Accusative Case", description: "Direct objects in German",
             level: .a2, topics: [.accusative, .articles], thematicFocus: .shopping),
        Unit(id: 7, title: "Dative Case", description: "Indirect objects and prepositions",
             level: .a2, topics: [.dative, .prepositions], thematicFocus: .travel),
        Unit(id: 8, title: "Modal Verbs", description: "Can, must, want, may",
             level: .a2, topics: [.modalVerbs, .verbs], thematicFocus: .work),
        Unit(id: 9, title: "Separable Verbs", description: "Verbs that split apart",
             level: .a2, topics: [.separableVerbs, .wordOrder], thematicFocus: .dailyRoutine),
        Unit(id: 10, title: "Past Tense", description: "Perfekt - talking about the past",
              level: .a2, topics: [.perfectTense, .verbs], thematicFocus: .hobbies),

        // B1 Units (11-15)
        Unit(id: 11, title: "Connectors", description: "Because, although, when...",
             level: .b1, topics: [.connectors, .wordOrder], thematicFocus: .work),
        Unit(id: 12, title: "Relative Clauses", description: "The man who..., the book that...",
             level: .b1, topics: [.relativeClauses, .pronouns], thematicFocus: .culture),
        Unit(id: 13, title: "Passive Voice", description: "The book was written...",
             level: .b1, topics: [.passive, .verbs], thematicFocus: .work),
        Unit(id: 14, title: "Subjunctive II", description: "Would, could, wishes",
             level: .b1, topics: [.subjunctive, .verbs], thematicFocus: .travel),
        Unit(id: 15, title: "Advanced Prepositions", description: "Two-way prepositions",
             level: .b1, topics: [.prepositions, .accusative, .dative], thematicFocus: .travel),

        // B2 Units (16-20)
        Unit(id: 16, title: "Genitive Case", description: "Possession and formal German",
             level: .b2, topics: [.genitive, .articles], thematicFocus: .work),
        Unit(id: 17, title: "Complex Sentences", description: "Multi-clause structures",
             level: .b2, topics: [.wordOrder, .connectors], thematicFocus: .culture),
        Unit(id: 18, title: "Idiomatic Expressions", description: "Common German idioms",
             level: .b2, topics: [.idioms, .verbs], thematicFocus: .culture),
        Unit(id: 19, title: "Formal vs Informal", description: "Register and politeness",
             level: .b2, topics: [.pronouns, .greetings], thematicFocus: .work),
        Unit(id: 20, title: "Mastery Review", description: "Comprehensive B2 review",
             level: .b2, topics: [.verbs, .articles, .wordOrder], thematicFocus: .culture)
    ]

    // MARK: - Methods

    func getUnit(_ id: Int) -> Unit? {
        allUnits.first { $0.id == id }
    }

    func getLesson(unit: Int, lesson: Int) -> Lesson? {
        guard let unitObj = getUnit(unit) else { return nil }
        return unitObj.lessons.first { $0.lessonNumber == lesson }
    }

    func getUnitsForLevel(_ level: CEFRLevel) -> [Unit] {
        allUnits.filter { $0.level == level }
    }

    func getTodaysLesson() -> Lesson? {
        let settings = UserSettings.shared
        return getLesson(unit: settings.currentUnit, lesson: settings.currentLesson)
    }

    func getNextLesson(after lesson: Lesson) -> Lesson? {
        if lesson.lessonNumber < LessonManager.lessonsPerUnit {
            return getLesson(unit: lesson.unitId, lesson: lesson.lessonNumber + 1)
        } else {
            return getLesson(unit: lesson.unitId + 1, lesson: 1)
        }
    }
}

// MARK: - Content Manager (for sync-ready content)

class ContentManager {
    static let shared = ContentManager()

    private init() {}

    // This can later be replaced with Firebase/CloudKit sync
    func getFlashcards(for level: CEFRLevel, topics: [GrammarTopic]) -> [Flashcard] {
        let allCards = GermanContent.flashcards

        // Filter by level (include current and lower levels)
        let levelFiltered = allCards.filter { card in
            card.level.pointsRequired <= level.pointsRequired
        }

        // If specific topics requested, filter by those
        if !topics.isEmpty {
            return levelFiltered.filter { card in
                !Set(card.grammarTopics).isDisjoint(with: Set(topics))
            }
        }

        return levelFiltered
    }

    func getSentences(for level: CEFRLevel, topics: [GrammarTopic]) -> [SwipeSentence] {
        let allSentences = GermanContent.swipeSentences

        let levelFiltered = allSentences.filter { sentence in
            sentence.level.pointsRequired <= level.pointsRequired
        }

        if !topics.isEmpty {
            return levelFiltered.filter { sentence in
                !Set(sentence.grammarTopics).isDisjoint(with: Set(topics))
            }
        }

        return levelFiltered
    }

    // MARK: - Future: Sync Methods

    func syncContent(completion: @escaping (Bool) -> Void) {
        // TODO: Implement Firebase/CloudKit sync
        // For now, content is bundled with the app
        completion(true)
    }

    func checkForUpdates(completion: @escaping (Bool) -> Void) {
        // TODO: Check if new content is available
        completion(false)
    }
}
