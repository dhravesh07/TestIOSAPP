import Foundation
import SwiftUI

/// Adaptive Learning Engine
/// Handles intelligent card selection, difficulty progression, and spaced repetition
class AdaptiveLearningEngine: ObservableObject {
    @Published var currentLevel: CEFRLevel = .a1
    @Published var recommendedTopics: [GrammarTopic] = []
    @Published var weakAreas: [GrammarTopic] = []
    @Published var strongAreas: [GrammarTopic] = []

    private let progressManager: ProgressManager

    init(progressManager: ProgressManager) {
        self.progressManager = progressManager
        updateRecommendations()
    }

    // MARK: - Card Selection

    /// Get cards for a learning session based on user's current level and performance
    func getAdaptiveCards(
        count: Int = 10,
        from allCards: [Flashcard],
        mode: SelectionMode = .mixed
    ) -> [Flashcard] {
        let userLevel = progressManager.progress.currentLevel
        var selectedCards: [Flashcard] = []

        switch mode {
        case .newOnly:
            selectedCards = selectNewCards(count: count, from: allCards, userLevel: userLevel)
        case .reviewOnly:
            selectedCards = selectReviewCards(count: count, from: allCards)
        case .weakAreasOnly:
            selectedCards = selectWeakAreaCards(count: count, from: allCards)
        case .mixed:
            selectedCards = selectMixedCards(count: count, from: allCards, userLevel: userLevel)
        case .levelTest:
            selectedCards = selectLevelTestCards(count: count, from: allCards, level: userLevel)
        case .grammarFocused(let topic):
            selectedCards = selectGrammarTopicCards(count: count, from: allCards, topic: topic)
        }

        return selectedCards.shuffled()
    }

    enum SelectionMode {
        case newOnly
        case reviewOnly
        case weakAreasOnly
        case mixed
        case levelTest
        case grammarFocused(GrammarTopic)
    }

    // MARK: - Selection Strategies

    private func selectNewCards(count: Int, from allCards: [Flashcard], userLevel: CEFRLevel) -> [Flashcard] {
        let performances = progressManager.progress.cardPerformances

        // Cards never seen or seen less than 2 times
        let newCards = allCards.filter { card in
            let perf = performances[card.id]
            return perf == nil || perf!.timesShown < 2
        }

        // Filter by appropriate level (current level and one below)
        let appropriateCards = newCards.filter { card in
            card.level <= userLevel || (card.level == nextLevel(after: userLevel) && progressManager.progress.progressToNextLevel > 0.7)
        }

        // Sort by level (easier first for new learners)
        let sorted = appropriateCards.sorted { $0.level < $1.level }

        return Array(sorted.prefix(count))
    }

    private func selectReviewCards(count: Int, from allCards: [Flashcard]) -> [Flashcard] {
        let performances = progressManager.progress.cardPerformances
        let now = Date()

        // Cards due for review
        var dueCards = allCards.filter { card in
            guard let perf = performances[card.id] else { return false }
            return perf.nextReviewDate <= now && perf.masteryLevel != .mastered
        }

        // Sort by urgency (most overdue first)
        dueCards.sort { card1, card2 in
            let perf1 = performances[card1.id]!
            let perf2 = performances[card2.id]!
            return perf1.nextReviewDate < perf2.nextReviewDate
        }

        return Array(dueCards.prefix(count))
    }

    private func selectWeakAreaCards(count: Int, from allCards: [Flashcard]) -> [Flashcard] {
        let performances = progressManager.progress.cardPerformances

        // Cards with low accuracy
        var weakCards = allCards.filter { card in
            guard let perf = performances[card.id], perf.timesShown >= 2 else { return false }
            return perf.accuracy < 0.6
        }

        // Sort by accuracy (lowest first)
        weakCards.sort { card1, card2 in
            let perf1 = performances[card1.id]!
            let perf2 = performances[card2.id]!
            return perf1.accuracy < perf2.accuracy
        }

        return Array(weakCards.prefix(count))
    }

    private func selectMixedCards(count: Int, from allCards: [Flashcard], userLevel: CEFRLevel) -> [Flashcard] {
        var selected: [Flashcard] = []

        // 40% review cards (due for review)
        let reviewCards = selectReviewCards(count: Int(Double(count) * 0.4), from: allCards)
        selected.append(contentsOf: reviewCards)

        // 30% weak area cards
        let weakCards = selectWeakAreaCards(count: Int(Double(count) * 0.3), from: allCards)
            .filter { !selected.contains($0) }
        selected.append(contentsOf: weakCards)

        // 30% new cards
        let remaining = count - selected.count
        let newCards = selectNewCards(count: remaining, from: allCards, userLevel: userLevel)
            .filter { !selected.contains($0) }
        selected.append(contentsOf: newCards)

        // If still not enough, add random appropriate-level cards
        if selected.count < count {
            let remaining = count - selected.count
            let additionalCards = allCards
                .filter { $0.level <= userLevel && !selected.contains($0) }
                .shuffled()
                .prefix(remaining)
            selected.append(contentsOf: additionalCards)
        }

        return selected
    }

    private func selectLevelTestCards(count: Int, from allCards: [Flashcard], level: CEFRLevel) -> [Flashcard] {
        // Select cards specifically from this level
        let levelCards = allCards.filter { $0.level == level }
        return Array(levelCards.shuffled().prefix(count))
    }

    private func selectGrammarTopicCards(count: Int, from allCards: [Flashcard], topic: GrammarTopic) -> [Flashcard] {
        let topicCards = allCards.filter { $0.grammarTopics.contains(topic) }

        // Sort by mastery (less mastered first)
        let performances = progressManager.progress.cardPerformances
        let sorted = topicCards.sorted { card1, card2 in
            let perf1 = performances[card1.id]
            let perf2 = performances[card2.id]
            let mastery1 = perf1?.accuracy ?? 0
            let mastery2 = perf2?.accuracy ?? 0
            return mastery1 < mastery2
        }

        return Array(sorted.prefix(count))
    }

    // MARK: - Difficulty Adjustment

    /// Determines if user should level up based on performance
    func shouldLevelUp() -> Bool {
        let progress = progressManager.progress

        // Need at least 50 answers at current level
        guard progress.totalAnswers >= 50 else { return false }

        // Need 80%+ accuracy
        guard progress.accuracy >= 80 else { return false }

        // Need 70%+ progress to next level
        guard progress.progressToNextLevel >= 0.7 else { return false }

        return true
    }

    /// Get difficulty multiplier based on recent performance
    func getDifficultyMultiplier() -> Double {
        let recentAccuracy = getRecentAccuracy(lastN: 20)

        if recentAccuracy >= 0.9 {
            return 1.3  // Increase difficulty
        } else if recentAccuracy >= 0.7 {
            return 1.0  // Maintain difficulty
        } else if recentAccuracy >= 0.5 {
            return 0.8  // Slightly decrease difficulty
        } else {
            return 0.6  // Significantly decrease difficulty
        }
    }

    private func getRecentAccuracy(lastN: Int) -> Double {
        let performances = Array(progressManager.progress.cardPerformances.values)
            .filter { $0.lastShown != nil }
            .sorted { $0.lastShown! > $1.lastShown! }
            .prefix(lastN)

        guard !performances.isEmpty else { return 0.5 }

        let totalCorrect = performances.reduce(0) { $0 + $1.timesCorrect }
        let totalShown = performances.reduce(0) { $0 + $1.timesShown }

        guard totalShown > 0 else { return 0.5 }
        return Double(totalCorrect) / Double(totalShown)
    }

    // MARK: - Recommendations

    func updateRecommendations() {
        let progress = progressManager.progress

        // Find weak areas (grammar topics with low accuracy)
        weakAreas = GrammarTopic.allCases.filter { topic in
            let topicProgress = progress.grammarProgress[topic.rawValue]
            guard let tp = topicProgress, tp.totalAnswers >= 5 else { return false }
            return tp.accuracy < 60
        }

        // Find strong areas
        strongAreas = GrammarTopic.allCases.filter { topic in
            let topicProgress = progress.grammarProgress[topic.rawValue]
            guard let tp = topicProgress, tp.totalAnswers >= 5 else { return false }
            return tp.accuracy >= 80
        }

        // Recommend topics based on current level that haven't been studied much
        let currentLevel = progress.currentLevel
        recommendedTopics = GrammarTopic.allCases.filter { topic in
            topic.cefrLevel <= currentLevel
        }.filter { topic in
            let topicProgress = progress.grammarProgress[topic.rawValue]
            return topicProgress == nil || topicProgress!.cardsStudied < 10
        }.prefix(5).map { $0 }
    }

    // MARK: - Level Assessment

    /// Assess user's current German level based on performance
    func assessLevel(from testResults: [(card: Flashcard, correct: Bool)]) -> LevelAssessment {
        var levelScores: [CEFRLevel: (correct: Int, total: Int)] = [:]

        for result in testResults {
            let level = result.card.level
            var score = levelScores[level] ?? (correct: 0, total: 0)
            score.total += 1
            if result.correct {
                score.correct += 1
            }
            levelScores[level] = score
        }

        // Calculate accuracy per level
        var levelAccuracies: [CEFRLevel: Double] = [:]
        for (level, score) in levelScores {
            levelAccuracies[level] = score.total > 0 ? Double(score.correct) / Double(score.total) : 0
        }

        // Determine assessed level (highest level with 70%+ accuracy)
        var assessedLevel: CEFRLevel = .a1
        for level in CEFRLevel.allCases {
            if let accuracy = levelAccuracies[level], accuracy >= 0.7 {
                assessedLevel = level
            } else {
                break
            }
        }

        return LevelAssessment(
            assessedLevel: assessedLevel,
            levelAccuracies: levelAccuracies,
            overallAccuracy: Double(testResults.filter { $0.correct }.count) / Double(testResults.count),
            recommendations: generateLevelRecommendations(levelAccuracies: levelAccuracies)
        )
    }

    private func generateLevelRecommendations(levelAccuracies: [CEFRLevel: Double]) -> [String] {
        var recommendations: [String] = []

        for level in CEFRLevel.allCases {
            if let accuracy = levelAccuracies[level] {
                if accuracy < 0.5 {
                    recommendations.append("Focus on \(level.rawValue) fundamentals before advancing")
                } else if accuracy < 0.7 {
                    recommendations.append("Practice more \(level.rawValue) content to solidify knowledge")
                } else if accuracy >= 0.9 {
                    recommendations.append("Excellent \(level.rawValue) mastery! Ready for more challenges")
                }
            }
        }

        return recommendations
    }

    // MARK: - Streak Management

    func updateStreak() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        if let lastStudy = progressManager.progress.lastStudyDate {
            let lastStudyDay = calendar.startOfDay(for: lastStudy)
            let daysDiff = calendar.dateComponents([.day], from: lastStudyDay, to: today).day ?? 0

            if daysDiff == 1 {
                // Consecutive day - increase streak
                progressManager.progress.currentStreak += 1
                if progressManager.progress.currentStreak > progressManager.progress.longestStreak {
                    progressManager.progress.longestStreak = progressManager.progress.currentStreak
                }
            } else if daysDiff > 1 {
                // Missed a day - reset streak
                progressManager.progress.currentStreak = 1
            }
            // daysDiff == 0 means same day, don't change streak
        } else {
            // First time studying
            progressManager.progress.currentStreak = 1
        }

        progressManager.progress.lastStudyDate = Date()
    }

    // MARK: - Helpers

    private func nextLevel(after level: CEFRLevel) -> CEFRLevel {
        switch level {
        case .a1: return .a2
        case .a2: return .b1
        case .b1: return .b2
        case .b2: return .c1
        case .c1: return .c2
        case .c2: return .c2
        }
    }
}

// MARK: - Level Assessment Result

struct LevelAssessment {
    let assessedLevel: CEFRLevel
    let levelAccuracies: [CEFRLevel: Double]
    let overallAccuracy: Double
    let recommendations: [String]

    var summary: String {
        "Your German level: \(assessedLevel.rawValue) - \(assessedLevel.name)"
    }

    var detailedBreakdown: String {
        var breakdown = "Level Breakdown:\n"
        for level in CEFRLevel.allCases {
            if let accuracy = levelAccuracies[level] {
                let percentage = Int(accuracy * 100)
                let status = accuracy >= 0.7 ? "✓" : "✗"
                breakdown += "\(level.rawValue): \(percentage)% \(status)\n"
            }
        }
        return breakdown
    }
}

// MARK: - Study Recommendation

struct StudyRecommendation: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
    let color: Color
    let action: RecommendationAction

    enum RecommendationAction {
        case studyTopic(GrammarTopic)
        case reviewWeakCards
        case takeQuiz
        case levelTest
        case practiceSwipe
    }
}

extension AdaptiveLearningEngine {
    func getStudyRecommendations() -> [StudyRecommendation] {
        var recommendations: [StudyRecommendation] = []
        let progress = progressManager.progress

        // Check for due reviews
        let dueCount = getDueReviewCount()
        if dueCount > 0 {
            recommendations.append(StudyRecommendation(
                title: "Review Due Cards",
                description: "\(dueCount) cards are due for review",
                icon: "arrow.clockwise.circle.fill",
                color: .orange,
                action: .reviewWeakCards
            ))
        }

        // Recommend weak areas
        if let weakTopic = weakAreas.first {
            recommendations.append(StudyRecommendation(
                title: "Practice \(weakTopic.rawValue)",
                description: "This is one of your weak areas",
                icon: weakTopic.icon,
                color: .red,
                action: .studyTopic(weakTopic)
            ))
        }

        // Recommend new topic if doing well
        if let newTopic = recommendedTopics.first {
            recommendations.append(StudyRecommendation(
                title: "Learn \(newTopic.rawValue)",
                description: "Expand your knowledge",
                icon: newTopic.icon,
                color: .blue,
                action: .studyTopic(newTopic)
            ))
        }

        // Suggest level test if ready
        if progress.progressToNextLevel > 0.8 {
            recommendations.append(StudyRecommendation(
                title: "Take Level Test",
                description: "You might be ready to level up!",
                icon: "star.fill",
                color: .yellow,
                action: .levelTest
            ))
        }

        return recommendations
    }

    private func getDueReviewCount() -> Int {
        let now = Date()
        return progressManager.progress.cardPerformances.values.filter {
            $0.nextReviewDate <= now && $0.masteryLevel != .mastered
        }.count
    }
}
