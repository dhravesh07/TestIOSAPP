import SwiftUI

struct GrammarTopicDetailView: View {
    let topic: GrammarTopic
    @EnvironmentObject var progressManager: ProgressManager
    @State private var selectedMode: LearningMode = .flashcards

    enum LearningMode: String, CaseIterable {
        case flashcards = "Flashcards"
        case quiz = "Quiz"
        case swipe = "Swipe"
    }

    private var topicFlashcards: [Flashcard] {
        GermanContent.flashcards(for: topic)
    }

    private var topicSentences: [SwipeSentence] {
        GermanContent.swipeSentences.filter { $0.grammarTopics.contains(topic) }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Topic Header
                headerSection

                // Progress
                progressSection

                // Learning Mode Picker
                modePickerSection

                // Start Button
                startSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(topic.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: topic.icon)
                .font(.system(size: 60))
                .foregroundColor(colorFromString(topic.color))

            Text(topic.rawValue)
                .font(.title2)
                .fontWeight(.bold)

            Text(topic.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            HStack(spacing: 16) {
                // Level badge
                Label(topic.cefrLevel.rawValue, systemImage: "chart.bar.fill")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(colorForLevel(topic.cefrLevel).opacity(0.2))
                    .foregroundColor(colorForLevel(topic.cefrLevel))
                    .cornerRadius(8)

                // Card count
                Text("\(topicFlashcards.count) cards")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    // MARK: - Progress Section

    private var progressSection: some View {
        let topicProgress = progressManager.getGrammarProgress(topic)

        return VStack(spacing: 12) {
            Text("Your Progress")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 20) {
                ProgressStatItem(
                    value: "\(topicProgress.cardsStudied)",
                    label: "Studied",
                    icon: "book.fill",
                    color: .blue
                )

                ProgressStatItem(
                    value: "\(topicProgress.cardsMastered)",
                    label: "Mastered",
                    icon: "star.fill",
                    color: .yellow
                )

                ProgressStatItem(
                    value: String(format: "%.0f%%", topicProgress.accuracy),
                    label: "Accuracy",
                    icon: "target",
                    color: topicProgress.accuracy >= 70 ? .green : .orange
                )
            }

            // Progress bar
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Mastery")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(String(format: "%.0f%%", topicProgress.masteryPercentage))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }

                ProgressView(value: topicProgress.masteryPercentage / 100)
                    .tint(.blue)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    struct ProgressStatItem: View {
        let value: String
        let label: String
        let icon: String
        let color: Color

        var body: some View {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)

                Text(value)
                    .font(.title3)
                    .fontWeight(.bold)

                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
        }
    }

    // MARK: - Mode Picker Section

    private var modePickerSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Learning Mode")
                .font(.headline)

            ForEach(LearningMode.allCases, id: \.self) { mode in
                ModeSelectionRow(
                    mode: mode,
                    isSelected: selectedMode == mode,
                    isEnabled: mode == .swipe ? !topicSentences.isEmpty : !topicFlashcards.isEmpty,
                    action: { selectedMode = mode }
                )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    struct ModeSelectionRow: View {
        let mode: LearningMode
        let isSelected: Bool
        let isEnabled: Bool
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                HStack {
                    Image(systemName: modeIcon)
                        .font(.title2)
                        .foregroundColor(isEnabled ? modeColor : .gray)
                        .frame(width: 40)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(mode.rawValue)
                            .font(.headline)
                            .foregroundColor(isEnabled ? .primary : .gray)

                        Text(modeDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    if !isEnabled {
                        Text("N/A")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    } else {
                        Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(isSelected ? .blue : .gray)
                    }
                }
                .padding()
                .background(isSelected && isEnabled ? Color.blue.opacity(0.1) : Color(.secondarySystemBackground))
                .cornerRadius(12)
            }
            .buttonStyle(.plain)
            .disabled(!isEnabled)
        }

        private var modeIcon: String {
            switch mode {
            case .flashcards: return "rectangle.stack.fill"
            case .quiz: return "questionmark.circle.fill"
            case .swipe: return "hand.draw.fill"
            }
        }

        private var modeColor: Color {
            switch mode {
            case .flashcards: return .blue
            case .quiz: return .purple
            case .swipe: return .orange
            }
        }

        private var modeDescription: String {
            switch mode {
            case .flashcards: return "Learn with flip cards"
            case .quiz: return "Test your knowledge"
            case .swipe: return "Identify correct sentences"
            }
        }
    }

    // MARK: - Start Section

    private var startSection: some View {
        NavigationLink {
            destinationView
        } label: {
            HStack {
                Image(systemName: "play.fill")
                Text("Start Learning")
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(colorFromString(topic.color))
            .cornerRadius(12)
        }
        .disabled(topicFlashcards.isEmpty)
    }

    @ViewBuilder
    private var destinationView: some View {
        switch selectedMode {
        case .flashcards:
            FlashcardView(flashcards: topicFlashcards.shuffled())
        case .quiz:
            QuizView(flashcards: topicFlashcards.shuffled())
        case .swipe:
            if topicSentences.isEmpty {
                SwipeCardView(sentences: GermanContent.swipeSentences.shuffled())
            } else {
                SwipeCardView(sentences: topicSentences.shuffled())
            }
        }
    }

    // MARK: - Helpers

    private func colorForLevel(_ level: CEFRLevel) -> Color {
        switch level {
        case .a1: return .green
        case .a2: return .blue
        case .b1: return .purple
        case .b2: return .orange
        case .c1: return .red
        case .c2: return .yellow
        }
    }

    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "orange": return .orange
        case "blue": return .blue
        case "pink": return .pink
        case "green": return .green
        case "purple": return .purple
        case "yellow": return .yellow
        case "cyan": return .cyan
        case "red": return .red
        case "indigo": return .indigo
        case "mint": return .mint
        case "brown": return .brown
        case "gray": return .gray
        default: return .blue
        }
    }
}

// MARK: - Level Detail View

struct LevelDetailView: View {
    let level: CEFRLevel
    @EnvironmentObject var progressManager: ProgressManager
    @State private var selectedMode: GrammarTopicDetailView.LearningMode = .flashcards

    private var levelFlashcards: [Flashcard] {
        GermanContent.flashcards.filter { $0.level == level }
    }

    private var levelSentences: [SwipeSentence] {
        GermanContent.swipeSentences.filter { $0.level == level }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Level Header
                headerSection

                // Progress
                progressSection

                // Learning Mode Picker
                modePickerSection

                // Start Button
                startSection
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("\(level.rawValue) - \(level.name)")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 16) {
            Text(level.rawValue)
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(colorForLevel(level))

            Text(level.name)
                .font(.title2)
                .fontWeight(.bold)

            Text(level.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            Text("\(levelFlashcards.count) cards available")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    // MARK: - Progress Section

    private var progressSection: some View {
        let levelProgress = progressManager.getLevelProgress(level)

        return VStack(spacing: 12) {
            Text("Your Progress")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 20) {
                GrammarTopicDetailView.ProgressStatItem(
                    value: "\(levelProgress.cardsStudied)",
                    label: "Studied",
                    icon: "book.fill",
                    color: .blue
                )

                GrammarTopicDetailView.ProgressStatItem(
                    value: "\(levelProgress.cardsMastered)",
                    label: "Mastered",
                    icon: "star.fill",
                    color: .yellow
                )

                GrammarTopicDetailView.ProgressStatItem(
                    value: String(format: "%.0f%%", levelProgress.averageAccuracy),
                    label: "Accuracy",
                    icon: "target",
                    color: levelProgress.averageAccuracy >= 70 ? .green : .orange
                )
            }

            // Progress bar
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Mastery")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(String(format: "%.0f%%", levelProgress.percentage))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }

                ProgressView(value: levelProgress.percentage / 100)
                    .tint(colorForLevel(level))
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    // MARK: - Mode Picker Section

    private var modePickerSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Learning Mode")
                .font(.headline)

            ForEach(GrammarTopicDetailView.LearningMode.allCases, id: \.self) { mode in
                GrammarTopicDetailView.ModeSelectionRow(
                    mode: mode,
                    isSelected: selectedMode == mode,
                    isEnabled: mode == .swipe ? !levelSentences.isEmpty : !levelFlashcards.isEmpty,
                    action: { selectedMode = mode }
                )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    // MARK: - Start Section

    private var startSection: some View {
        NavigationLink {
            destinationView
        } label: {
            HStack {
                Image(systemName: "play.fill")
                Text("Start Learning")
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(colorForLevel(level))
            .cornerRadius(12)
        }
        .disabled(levelFlashcards.isEmpty)
    }

    @ViewBuilder
    private var destinationView: some View {
        switch selectedMode {
        case .flashcards:
            FlashcardView(flashcards: levelFlashcards.shuffled())
        case .quiz:
            QuizView(flashcards: levelFlashcards.shuffled())
        case .swipe:
            if levelSentences.isEmpty {
                SwipeCardView(sentences: GermanContent.swipeSentences.shuffled())
            } else {
                SwipeCardView(sentences: levelSentences.shuffled())
            }
        }
    }

    // MARK: - Helpers

    private func colorForLevel(_ level: CEFRLevel) -> Color {
        switch level {
        case .a1: return .green
        case .a2: return .blue
        case .b1: return .purple
        case .b2: return .orange
        case .c1: return .red
        case .c2: return .yellow
        }
    }
}

#Preview("Grammar Topic") {
    NavigationStack {
        GrammarTopicDetailView(topic: .articles)
            .environmentObject(ProgressManager())
    }
}

#Preview("Level") {
    NavigationStack {
        LevelDetailView(level: .a1)
            .environmentObject(ProgressManager())
    }
}
