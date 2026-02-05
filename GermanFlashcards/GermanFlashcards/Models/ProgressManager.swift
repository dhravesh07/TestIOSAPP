import Foundation
import SwiftUI

class ProgressManager: ObservableObject {
    @Published var progress: UserProgress {
        didSet {
            saveProgress()
        }
    }

    private let progressKey = "userProgress"

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

    func recordAnswer(correct: Bool, cardId: UUID, category: Category) {
        progress.totalAnswers += 1
        if correct {
            progress.correctAnswers += 1
        }

        var categoryProgress = progress.categoryProgress[category.rawValue] ?? CategoryProgress()
        categoryProgress.completed += 1
        categoryProgress.total = GermanVocabulary.flashcards.filter { $0.category == category }.count
        if correct {
            categoryProgress.mastered += 1
        }
        progress.categoryProgress[category.rawValue] = categoryProgress
    }

    func markCardMastered(_ cardId: UUID) {
        progress.masteredCards.insert(cardId)
        progress.reviewCards.remove(cardId)
    }

    func markCardForReview(_ cardId: UUID) {
        progress.reviewCards.insert(cardId)
        progress.masteredCards.remove(cardId)
    }

    func resetProgress() {
        progress = UserProgress()
    }

    func getStreak() -> Int {
        return progress.correctAnswers / 5
    }

    func getCategoryProgress(for category: Category) -> CategoryProgress {
        return progress.categoryProgress[category.rawValue] ?? CategoryProgress()
    }
}
