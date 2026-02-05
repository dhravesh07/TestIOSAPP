import Foundation

// MARK: - User Settings

class UserSettings: ObservableObject {
    static let shared = UserSettings()

    private let defaults = UserDefaults.standard

    // MARK: - Keys
    private enum Keys {
        static let hasCompletedOnboarding = "hasCompletedOnboarding"
        static let learningReason = "learningReason"
        static let currentLevel = "currentLevel"
        static let dailyGoalMinutes = "dailyGoalMinutes"
        static let targetLevel = "targetLevel"
        static let lastLessonDate = "lastLessonDate"
        static let currentStreak = "currentStreak"
        static let longestStreak = "longestStreak"
        static let totalXP = "totalXP"
        static let currentUnit = "currentUnit"
        static let currentLesson = "currentLesson"
        static let completedLessons = "completedLessons"
    }

    // MARK: - Published Properties

    @Published var hasCompletedOnboarding: Bool {
        didSet { defaults.set(hasCompletedOnboarding, forKey: Keys.hasCompletedOnboarding) }
    }

    @Published var learningReason: LearningReason {
        didSet { defaults.set(learningReason.rawValue, forKey: Keys.learningReason) }
    }

    @Published var currentLevel: CEFRLevel {
        didSet { defaults.set(currentLevel.rawValue, forKey: Keys.currentLevel) }
    }

    @Published var dailyGoalMinutes: Int {
        didSet { defaults.set(dailyGoalMinutes, forKey: Keys.dailyGoalMinutes) }
    }

    @Published var targetLevel: CEFRLevel {
        didSet { defaults.set(targetLevel.rawValue, forKey: Keys.targetLevel) }
    }

    @Published var currentStreak: Int {
        didSet { defaults.set(currentStreak, forKey: Keys.currentStreak) }
    }

    @Published var longestStreak: Int {
        didSet { defaults.set(longestStreak, forKey: Keys.longestStreak) }
    }

    @Published var totalXP: Int {
        didSet { defaults.set(totalXP, forKey: Keys.totalXP) }
    }

    @Published var currentUnit: Int {
        didSet { defaults.set(currentUnit, forKey: Keys.currentUnit) }
    }

    @Published var currentLesson: Int {
        didSet { defaults.set(currentLesson, forKey: Keys.currentLesson) }
    }

    @Published var completedLessons: Set<String> {
        didSet {
            defaults.set(Array(completedLessons), forKey: Keys.completedLessons)
        }
    }

    private var lastLessonDate: Date? {
        get { defaults.object(forKey: Keys.lastLessonDate) as? Date }
        set { defaults.set(newValue, forKey: Keys.lastLessonDate) }
    }

    // MARK: - Initialization

    private init() {
        self.hasCompletedOnboarding = defaults.bool(forKey: Keys.hasCompletedOnboarding)

        if let reasonRaw = defaults.string(forKey: Keys.learningReason),
           let reason = LearningReason(rawValue: reasonRaw) {
            self.learningReason = reason
        } else {
            self.learningReason = .general
        }

        if let levelRaw = defaults.string(forKey: Keys.currentLevel),
           let level = CEFRLevel(rawValue: levelRaw) {
            self.currentLevel = level
        } else {
            self.currentLevel = .a1
        }

        if let targetRaw = defaults.string(forKey: Keys.targetLevel),
           let target = CEFRLevel(rawValue: targetRaw) {
            self.targetLevel = target
        } else {
            self.targetLevel = .b1
        }

        self.dailyGoalMinutes = defaults.integer(forKey: Keys.dailyGoalMinutes)
        if self.dailyGoalMinutes == 0 { self.dailyGoalMinutes = 10 }

        self.currentStreak = defaults.integer(forKey: Keys.currentStreak)
        self.longestStreak = defaults.integer(forKey: Keys.longestStreak)
        self.totalXP = defaults.integer(forKey: Keys.totalXP)
        self.currentUnit = defaults.integer(forKey: Keys.currentUnit)
        if self.currentUnit == 0 { self.currentUnit = 1 }
        self.currentLesson = defaults.integer(forKey: Keys.currentLesson)
        if self.currentLesson == 0 { self.currentLesson = 1 }

        if let savedLessons = defaults.array(forKey: Keys.completedLessons) as? [String] {
            self.completedLessons = Set(savedLessons)
        } else {
            self.completedLessons = []
        }

        // Check and update streak
        updateStreak()
    }

    // MARK: - Streak Management

    func updateStreak() {
        guard let lastDate = lastLessonDate else { return }

        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let lastDay = calendar.startOfDay(for: lastDate)

        let daysDifference = calendar.dateComponents([.day], from: lastDay, to: today).day ?? 0

        if daysDifference > 1 {
            // Streak broken
            currentStreak = 0
        }
    }

    func recordLessonCompleted(xpEarned: Int) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        if let lastDate = lastLessonDate {
            let lastDay = calendar.startOfDay(for: lastDate)
            let daysDifference = calendar.dateComponents([.day], from: lastDay, to: today).day ?? 0

            if daysDifference == 1 {
                // Consecutive day
                currentStreak += 1
            } else if daysDifference > 1 {
                // Streak broken, start new
                currentStreak = 1
            }
            // If same day, don't change streak
        } else {
            // First lesson ever
            currentStreak = 1
        }

        if currentStreak > longestStreak {
            longestStreak = currentStreak
        }

        totalXP += xpEarned
        lastLessonDate = Date()
    }

    func completeLesson(unit: Int, lesson: Int) {
        let lessonId = "\(unit)-\(lesson)"
        completedLessons.insert(lessonId)

        // Advance to next lesson
        if lesson >= LessonManager.lessonsPerUnit {
            currentUnit = unit + 1
            currentLesson = 1
        } else {
            currentLesson = lesson + 1
        }
    }

    func isLessonCompleted(unit: Int, lesson: Int) -> Bool {
        completedLessons.contains("\(unit)-\(lesson)")
    }

    func isLessonUnlocked(unit: Int, lesson: Int) -> Bool {
        if unit == 1 && lesson == 1 { return true }

        // Previous lesson must be completed
        if lesson > 1 {
            return isLessonCompleted(unit: unit, lesson: lesson - 1)
        } else {
            // First lesson of new unit - last lesson of previous unit must be complete
            return isLessonCompleted(unit: unit - 1, lesson: LessonManager.lessonsPerUnit)
        }
    }

    // MARK: - Reset

    func resetProgress() {
        hasCompletedOnboarding = false
        currentStreak = 0
        totalXP = 0
        currentUnit = 1
        currentLesson = 1
        completedLessons = []
        lastLessonDate = nil
    }
}

// MARK: - Supporting Types

enum LearningReason: String, CaseIterable, Identifiable {
    case travel = "Travel"
    case work = "Work"
    case study = "Studies"
    case family = "Family/Friends"
    case culture = "Culture"
    case general = "General Interest"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .travel: return "airplane"
        case .work: return "briefcase.fill"
        case .study: return "graduationcap.fill"
        case .family: return "heart.fill"
        case .culture: return "theatermasks.fill"
        case .general: return "star.fill"
        }
    }
}

enum DailyGoal: Int, CaseIterable, Identifiable {
    case casual = 5
    case regular = 10
    case serious = 15
    case intense = 20

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .casual: return "Casual"
        case .regular: return "Regular"
        case .serious: return "Serious"
        case .intense: return "Intense"
        }
    }

    var description: String {
        switch self {
        case .casual: return "5 min/day"
        case .regular: return "10 min/day"
        case .serious: return "15 min/day"
        case .intense: return "20 min/day"
        }
    }
}

enum StartingLevel: String, CaseIterable, Identifiable {
    case beginner = "Complete Beginner"
    case basics = "Know Some Basics"
    case elementary = "Can Have Simple Conversations"

    var id: String { rawValue }

    var cefrLevel: CEFRLevel {
        switch self {
        case .beginner: return .a1
        case .basics: return .a1
        case .elementary: return .a2
        }
    }

    var startUnit: Int {
        switch self {
        case .beginner: return 1
        case .basics: return 3
        case .elementary: return 6
        }
    }
}
