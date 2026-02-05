import Foundation
import SwiftUI

class ProgressManager: ObservableObject {
    @Published var progress: UserProgress {
        didSet {
            saveProgress()
        }
    }

    private let progressKey = "userProgressV2"

    init() {
        if let data = UserDefaults.standard.data(forKey: progressKey),
           let savedProgress = try? JSONDecoder().decode(UserProgress.self, from: data) {
            self.progress = savedProgress
        } else {
            self.progress = UserProgress()
        }
    }

    func saveProgress() {
        if let data = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(data, forKey: progressKey)
        }
    }

    // MARK: - Answer Recording

    func recordAnswer(correct: Bool, card: Flashcard) {
        // Update overall stats
        progress.totalAnswers += 1
        if correct {
            progress.correctAnswers += 1
            progress.totalPoints += card.points
        }

        // Update card performance (spaced repetition)
        var cardPerf = progress.cardPerformances[card.id] ?? CardPerformance(cardId: card.id)
        cardPerf.recordAnswer(correct: correct)
        progress.cardPerformances[card.id] = cardPerf

        // Update level progress
        updateLevelProgress(card: card, correct: correct)

        // Update grammar topic progress
        for topic in card.grammarTopics {
            updateGrammarProgress(topic: topic, correct: correct)
        }

        // Update daily stats
        updateDailyStats(correct: correct, points: correct ? card.points : 0)
    }

    func recordSwipeAnswer(correct: Bool, sentence: SwipeSentence) {
        progress.totalAnswers += 1
        if correct {
            progress.correctAnswers += 1
            progress.totalPoints += sentence.points
        }

        // Update grammar topic progress for swipe sentences
        for topic in sentence.grammarTopics {
            updateGrammarProgress(topic: topic, correct: correct)
        }

        // Update level progress
        var levelProg = progress.levelProgress[sentence.level.rawValue] ?? LevelProgress()
        levelProg.cardsStudied += 1
        if correct {
            levelProg.cardsMastered += 1
        }
        progress.levelProgress[sentence.level.rawValue] = levelProg

        updateDailyStats(correct: correct, points: correct ? sentence.points : 0)
    }

    // MARK: - Progress Updates

    private func updateLevelProgress(card: Flashcard, correct: Bool) {
        var levelProg = progress.levelProgress[card.level.rawValue] ?? LevelProgress()
        levelProg.cardsStudied += 1
        levelProg.totalCards = GermanContent.flashcards.filter { $0.level == card.level }.count

        if let cardPerf = progress.cardPerformances[card.id],
           cardPerf.masteryLevel == .mastered {
            levelProg.cardsMastered += 1
        }

        // Update average accuracy
        let levelCards = progress.cardPerformances.values.filter { perf in
            GermanContent.flashcards.first { $0.id == perf.id }?.level == card.level
        }
        if !levelCards.isEmpty {
            levelProg.averageAccuracy = levelCards.reduce(0) { $0 + $1.accuracy } / Double(levelCards.count) * 100
        }

        progress.levelProgress[card.level.rawValue] = levelProg
    }

    private func updateGrammarProgress(topic: GrammarTopic, correct: Bool) {
        var topicProg = progress.grammarProgress[topic.rawValue] ?? TopicProgress()
        topicProg.totalAnswers += 1
        if correct {
            topicProg.correctAnswers += 1
        }
        topicProg.cardsStudied += 1
        topicProg.lastStudied = Date()
        topicProg.totalCards = GermanContent.flashcards.filter { $0.grammarTopics.contains(topic) }.count

        progress.grammarProgress[topic.rawValue] = topicProg
    }

    private func updateDailyStats(correct: Bool, points: Int) {
        let dateKey = DateFormatter.dayKey.string(from: Date())
        var daily = progress.dailyStats[dateKey] ?? DailyStats()
        daily.cardsStudied += 1
        daily.totalAnswers += 1
        if correct {
            daily.correctAnswers += 1
        }
        daily.pointsEarned += points
        progress.dailyStats[dateKey] = daily
    }

    // MARK: - Queries

    func getCardPerformance(_ cardId: UUID) -> CardPerformance? {
        return progress.cardPerformances[cardId]
    }

    func getLevelProgress(_ level: CEFRLevel) -> LevelProgress {
        return progress.levelProgress[level.rawValue] ?? LevelProgress()
    }

    func getGrammarProgress(_ topic: GrammarTopic) -> TopicProgress {
        return progress.grammarProgress[topic.rawValue] ?? TopicProgress()
    }

    func getTodayStats() -> DailyStats {
        let dateKey = DateFormatter.dayKey.string(from: Date())
        return progress.dailyStats[dateKey] ?? DailyStats()
    }

    func getWeeklyStats() -> [DailyStats] {
        let calendar = Calendar.current
        var stats: [DailyStats] = []

        for dayOffset in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: -dayOffset, to: Date()) {
                let dateKey = DateFormatter.dayKey.string(from: date)
                stats.append(progress.dailyStats[dateKey] ?? DailyStats())
            }
        }

        return stats.reversed()
    }

    // MARK: - Level Management

    func getCurrentLevel() -> CEFRLevel {
        return progress.currentLevel
    }

    func getProgressToNextLevel() -> Double {
        return progress.progressToNextLevel
    }

    func getPointsToNextLevel() -> Int {
        let current = progress.currentLevel
        guard let nextIndex = CEFRLevel.allCases.firstIndex(of: current),
              nextIndex + 1 < CEFRLevel.allCases.count else {
            return 0
        }
        let next = CEFRLevel.allCases[nextIndex + 1]
        return next.pointsRequired - progress.totalPoints
    }

    // MARK: - Mastery

    func getMasteredCardsCount() -> Int {
        return progress.cardPerformances.values.filter { $0.masteryLevel == .mastered }.count
    }

    func getLearningCardsCount() -> Int {
        return progress.cardPerformances.values.filter {
            $0.masteryLevel == .learning || $0.masteryLevel == .familiar
        }.count
    }

    func getCardsForReview() -> [UUID] {
        let now = Date()
        return progress.cardPerformances.compactMap { (id, perf) in
            perf.nextReviewDate <= now && perf.masteryLevel != .mastered ? id : nil
        }
    }

    // MARK: - Streaks

    func getCurrentStreak() -> Int {
        return progress.currentStreak
    }

    func getLongestStreak() -> Int {
        return progress.longestStreak
    }

    // MARK: - Reset

    func resetProgress() {
        progress = UserProgress()
    }

    func resetGrammarProgress(for topic: GrammarTopic) {
        progress.grammarProgress[topic.rawValue] = TopicProgress()
    }

    func resetLevelProgress(for level: CEFRLevel) {
        progress.levelProgress[level.rawValue] = LevelProgress()
    }
}

// MARK: - Date Formatter Extension

extension DateFormatter {
    static let dayKey: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

// MARK: - Stats Summary

struct StatsSummary {
    let totalCards: Int
    let masteredCards: Int
    let learningCards: Int
    let newCards: Int
    let accuracy: Double
    let currentLevel: CEFRLevel
    let totalPoints: Int
    let streak: Int

    var masteryPercentage: Double {
        guard totalCards > 0 else { return 0 }
        return Double(masteredCards) / Double(totalCards) * 100
    }
}

extension ProgressManager {
    func getStatsSummary() -> StatsSummary {
        let totalCards = GermanContent.flashcards.count
        let masteredCards = getMasteredCardsCount()
        let learningCards = getLearningCardsCount()
        let newCards = totalCards - masteredCards - learningCards

        return StatsSummary(
            totalCards: totalCards,
            masteredCards: masteredCards,
            learningCards: learningCards,
            newCards: newCards,
            accuracy: progress.accuracy,
            currentLevel: progress.currentLevel,
            totalPoints: progress.totalPoints,
            streak: progress.currentStreak
        )
    }
}
