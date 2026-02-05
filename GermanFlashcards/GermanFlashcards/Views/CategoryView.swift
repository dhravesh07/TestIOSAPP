import SwiftUI

struct CategoryDetailView: View {
    let category: Category
    @EnvironmentObject var progressManager: ProgressManager
    @State private var selectedMode: LearningMode = .flashcards

    enum LearningMode: String, CaseIterable {
        case flashcards = "Flashcards"
        case quiz = "Quiz"
        case swipe = "Swipe"
    }

    private var categoryFlashcards: [Flashcard] {
        GermanVocabulary.flashcards(for: category)
    }

    private var categorySentences: [SwipeSentence] {
        GermanVocabulary.swipeSentences.shuffled()
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Category Header
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
        .navigationTitle(category.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(spacing: 16) {
            Image(systemName: category.icon)
                .font(.system(size: 60))
                .foregroundColor(colorFromString(category.color))

            Text(category.rawValue)
                .font(.title2)
                .fontWeight(.bold)

            Text("\(categoryFlashcards.count) flashcards available")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    // MARK: - Progress Section

    private var progressSection: some View {
        let progress = progressManager.getCategoryProgress(for: category)

        return VStack(spacing: 12) {
            Text("Your Progress")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 20) {
                ProgressStatItem(
                    value: "\(progress.completed)",
                    label: "Completed",
                    icon: "checkmark.circle.fill",
                    color: .green
                )

                ProgressStatItem(
                    value: "\(progress.mastered)",
                    label: "Mastered",
                    icon: "star.fill",
                    color: .yellow
                )

                ProgressStatItem(
                    value: String(format: "%.0f%%", progress.percentage),
                    label: "Progress",
                    icon: "chart.bar.fill",
                    color: .blue
                )
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
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                HStack {
                    Image(systemName: modeIcon)
                        .font(.title2)
                        .foregroundColor(modeColor)
                        .frame(width: 40)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(mode.rawValue)
                            .font(.headline)
                            .foregroundColor(.primary)

                        Text(modeDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(isSelected ? .blue : .gray)
                }
                .padding()
                .background(isSelected ? Color.blue.opacity(0.1) : Color(.secondarySystemBackground))
                .cornerRadius(12)
            }
            .buttonStyle(.plain)
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
            case .swipe: return "Swipe right or wrong"
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
            .background(colorFromString(category.color))
            .cornerRadius(12)
        }
    }

    @ViewBuilder
    private var destinationView: some View {
        switch selectedMode {
        case .flashcards:
            FlashcardView(flashcards: categoryFlashcards.shuffled())
        case .quiz:
            QuizView(flashcards: categoryFlashcards.shuffled())
        case .swipe:
            SwipeCardView(sentences: categorySentences)
        }
    }

    // MARK: - Helper

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

#Preview {
    NavigationStack {
        CategoryDetailView(category: .greetings)
            .environmentObject(ProgressManager())
    }
}
