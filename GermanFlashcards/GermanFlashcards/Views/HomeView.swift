import SwiftUI

struct HomeView: View {
    @EnvironmentObject var progressManager: ProgressManager
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                MainLearningView()
            }
            .tabItem {
                Label("Learn", systemImage: "book.fill")
            }
            .tag(0)

            NavigationStack {
                GrammarTopicsListView()
            }
            .tabItem {
                Label("Grammar", systemImage: "text.book.closed.fill")
            }
            .tag(1)

            NavigationStack {
                LevelsView()
            }
            .tabItem {
                Label("Levels", systemImage: "chart.bar.fill")
            }
            .tag(2)

            NavigationStack {
                ProgressDetailView()
            }
            .tabItem {
                Label("Progress", systemImage: "chart.pie.fill")
            }
            .tag(3)
        }
        .tint(.blue)
    }
}

// MARK: - Main Learning View

struct MainLearningView: View {
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Level Progress Card
                levelProgressCard

                // Today's Stats
                todayStatsCard

                // Quick Actions
                quickActionsSection

                // Grammar Topics Preview
                grammarTopicsPreview

                // Level-based Learning Preview
                levelBasedPreview
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("German A1-A2")
    }

    // MARK: - Level Progress Card

    private var levelProgressCard: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Your Level")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text(progressManager.getCurrentLevel().rawValue)
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundColor(colorForLevel(progressManager.getCurrentLevel()))

                        Text(progressManager.getCurrentLevel().name)
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                }

                Spacer()

                // Points badge
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(progressManager.progress.totalPoints)")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.orange)
                    Text("points")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            // Progress to next level
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Progress to next level")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(progressManager.getPointsToNextLevel()) pts needed")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 8)

                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geometry.size.width * progressManager.getProgressToNextLevel(), height: 8)
                    }
                }
                .frame(height: 8)
            }

            // Streak
            HStack {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                Text("\(progressManager.getCurrentStreak()) day streak")
                    .font(.subheadline)
                    .fontWeight(.medium)

                Spacer()

                Text("Best: \(progressManager.getLongestStreak()) days")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 10)
    }

    // MARK: - Today's Stats

    private var todayStatsCard: some View {
        let stats = progressManager.getTodayStats()

        return VStack(alignment: .leading, spacing: 12) {
            Text("Today")
                .font(.headline)

            HStack(spacing: 20) {
                StatItem(
                    value: "\(stats.cardsStudied)",
                    label: "Cards",
                    icon: "rectangle.stack.fill",
                    color: .blue
                )

                StatItem(
                    value: stats.totalAnswers > 0 ? "\(Int(Double(stats.correctAnswers) / Double(stats.totalAnswers) * 100))%" : "-",
                    label: "Accuracy",
                    icon: "target",
                    color: .green
                )

                StatItem(
                    value: "+\(stats.pointsEarned)",
                    label: "Points",
                    icon: "star.fill",
                    color: .orange
                )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    // MARK: - Quick Actions

    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Start")
                .font(.headline)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                NavigationLink {
                    AdaptiveQuizView(mode: .mixed)
                        .environmentObject(progressManager)
                } label: {
                    QuickActionCard(
                        title: "Smart Practice",
                        subtitle: "Adaptive learning",
                        icon: "brain.head.profile",
                        color: .purple
                    )
                }

                NavigationLink {
                    AdaptiveQuizView(mode: .reviewOnly)
                        .environmentObject(progressManager)
                } label: {
                    QuickActionCard(
                        title: "Review",
                        subtitle: "\(progressManager.getCardsForReview().count) cards due",
                        icon: "arrow.clockwise",
                        color: .orange
                    )
                }

                NavigationLink {
                    SwipeCardView(sentences: GermanContent.swipeSentences(for: progressManager.getCurrentLevel()).shuffled())
                        .environmentObject(progressManager)
                } label: {
                    QuickActionCard(
                        title: "Swipe Practice",
                        subtitle: "Right or wrong?",
                        icon: "hand.draw.fill",
                        color: .green
                    )
                }

                NavigationLink {
                    LevelTestView(level: progressManager.getCurrentLevel())
                        .environmentObject(progressManager)
                } label: {
                    QuickActionCard(
                        title: "Level Test",
                        subtitle: "Check your level",
                        icon: "checkmark.seal.fill",
                        color: .blue
                    )
                }
            }
        }
    }

    // MARK: - Grammar Topics Preview

    private var grammarTopicsPreview: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Grammar Topics")
                    .font(.headline)
                Spacer()
                NavigationLink("See All") {
                    GrammarTopicsListView()
                        .environmentObject(progressManager)
                }
                .font(.subheadline)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(GrammarTopic.allCases.filter { $0.cefrLevel <= progressManager.getCurrentLevel() }.prefix(6)) { topic in
                        NavigationLink {
                            GrammarTopicDetailView(topic: topic)
                                .environmentObject(progressManager)
                        } label: {
                            GrammarTopicCard(topic: topic, progress: progressManager.getGrammarProgress(topic))
                        }
                    }
                }
            }
        }
    }

    // MARK: - Level-based Preview

    private var levelBasedPreview: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Learn by Level")
                .font(.headline)

            ForEach([CEFRLevel.a1, .a2], id: \.self) { level in
                NavigationLink {
                    LevelLearningView(level: level)
                        .environmentObject(progressManager)
                } label: {
                    LevelCard(
                        level: level,
                        progress: progressManager.getLevelProgress(level),
                        isCurrentLevel: level == progressManager.getCurrentLevel()
                    )
                }
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

// MARK: - Supporting Views

struct StatItem: View {
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

struct QuickActionCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)

            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            Text(subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}

struct GrammarTopicCard: View {
    let topic: GrammarTopic
    let progress: TopicProgress

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: topic.icon)
                .font(.title2)
                .foregroundColor(colorFromString(topic.color))

            Text(topic.rawValue)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            // Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 4)

                    RoundedRectangle(cornerRadius: 2)
                        .fill(colorFromString(topic.color))
                        .frame(width: geometry.size.width * min(progress.masteryPercentage / 100, 1.0), height: 4)
                }
            }
            .frame(height: 4)

            Text("\(Int(progress.accuracy))% accuracy")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(width: 120)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }

    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "orange": return .orange
        case "red": return .red
        case "cyan": return .cyan
        default: return .blue
        }
    }
}

struct LevelCard: View {
    let level: CEFRLevel
    let progress: LevelProgress
    let isCurrentLevel: Bool

    var body: some View {
        HStack(spacing: 16) {
            // Level badge
            Text(level.rawValue)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(colorForLevel(level))
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(level.name)
                        .font(.headline)
                        .foregroundColor(.primary)

                    if isCurrentLevel {
                        Text("CURRENT")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.green)
                            .cornerRadius(4)
                    }
                }

                Text(level.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)

                // Progress
                HStack {
                    Text("\(progress.cardsMastered)/\(max(progress.totalCards, GermanContent.flashcards(for: level).count)) mastered")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text("\(Int(progress.averageAccuracy))% accuracy")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }

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

// MARK: - Adaptive Quiz View

struct AdaptiveQuizView: View {
    let mode: AdaptiveLearningEngine.SelectionMode
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        let engine = AdaptiveLearningEngine(progressManager: progressManager)
        let cards = engine.getAdaptiveCards(count: 10, from: GermanContent.flashcards, mode: mode)

        QuizView(flashcards: cards.isEmpty ? Array(GermanContent.flashcards.shuffled().prefix(10)) : cards)
            .environmentObject(progressManager)
    }
}

// MARK: - Level Test View

struct LevelTestView: View {
    let level: CEFRLevel
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        let cards = GermanContent.flashcards(for: level).shuffled().prefix(20)
        QuizView(flashcards: Array(cards.isEmpty ? GermanContent.flashcards.shuffled().prefix(10) : cards))
            .environmentObject(progressManager)
            .navigationTitle("\(level.rawValue) Level Test")
    }
}

// MARK: - Grammar Topics List View

struct GrammarTopicsListView: View {
    @EnvironmentObject var progressManager: ProgressManager

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(GrammarTopic.allCases) { topic in
                    NavigationLink {
                        GrammarTopicDetailView(topic: topic)
                            .environmentObject(progressManager)
                    } label: {
                        GrammarTopicLargeCard(topic: topic, progress: progressManager.getGrammarProgress(topic))
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Grammar Topics")
        .background(Color(.systemGroupedBackground))
    }
}

struct GrammarTopicLargeCard: View {
    let topic: GrammarTopic
    let progress: TopicProgress

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: topic.icon)
                    .font(.title)
                    .foregroundColor(colorFromString(topic.color))

                Spacer()

                Text(topic.cefrLevel.rawValue)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(colorFromString(topic.cefrLevel.color))
                    .cornerRadius(8)
            }

            Text(topic.rawValue)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Text(topic.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)

            Spacer()

            // Progress
            VStack(alignment: .leading, spacing: 4) {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 4)

                        RoundedRectangle(cornerRadius: 2)
                            .fill(colorFromString(topic.color))
                            .frame(width: geometry.size.width * min(progress.masteryPercentage / 100, 1.0), height: 4)
                    }
                }
                .frame(height: 4)

                Text("\(progress.cardsStudied) studied | \(Int(progress.accuracy))% accuracy")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .frame(height: 160)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "orange": return .orange
        case "red": return .red
        case "cyan": return .cyan
        case "yellow": return .yellow
        default: return .blue
        }
    }
}

struct ActionButton: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title3)
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .foregroundColor(.white)
        .padding()
        .background(color)
        .cornerRadius(12)
    }
}

// MARK: - Levels View

struct LevelsView: View {
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach([CEFRLevel.a1, .a2], id: \.self) { level in
                    NavigationLink {
                        LevelLearningView(level: level)
                            .environmentObject(progressManager)
                    } label: {
                        LevelDetailCard(level: level, progress: progressManager.getLevelProgress(level), isCurrentLevel: level == progressManager.getCurrentLevel())
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Levels")
        .background(Color(.systemGroupedBackground))
    }
}

struct LevelDetailCard: View {
    let level: CEFRLevel
    let progress: LevelProgress
    let isCurrentLevel: Bool

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(level.rawValue)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(colorForLevel(level))

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(level.name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        if isCurrentLevel {
                            Text("CURRENT")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.green)
                                .cornerRadius(4)
                        }
                    }

                    Text(level.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }

            HStack(spacing: 20) {
                VStack {
                    Text("\(GermanContent.flashcards(for: level).count)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Cards")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                VStack {
                    Text("\(progress.cardsStudied)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Studied")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                VStack {
                    Text("\(progress.cardsMastered)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Mastered")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                VStack {
                    Text("\(Int(progress.averageAccuracy))%")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Accuracy")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

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

// MARK: - Level Learning View

struct LevelLearningView: View {
    let level: CEFRLevel
    @EnvironmentObject var progressManager: ProgressManager

    private var levelCards: [Flashcard] {
        GermanContent.flashcards(for: level)
    }

    private var levelTopics: [GrammarTopic] {
        GrammarTopic.allCases.filter { $0.cefrLevel == level }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Level info
                VStack(spacing: 12) {
                    Text(level.rawValue)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(colorForLevel(level))

                    Text(level.name)
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(level.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()

                // Progress
                let progress = progressManager.getLevelProgress(level)
                VStack(alignment: .leading, spacing: 12) {
                    Text("Your Progress")
                        .font(.headline)

                    HStack(spacing: 20) {
                        StatItem(value: "\(levelCards.count)", label: "Total Cards", icon: "rectangle.stack.fill", color: .blue)
                        StatItem(value: "\(progress.cardsStudied)", label: "Studied", icon: "eye.fill", color: .green)
                        StatItem(value: "\(progress.cardsMastered)", label: "Mastered", icon: "star.fill", color: .yellow)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)

                // Quick actions
                VStack(spacing: 12) {
                    NavigationLink {
                        FlashcardView(flashcards: levelCards.shuffled())
                            .environmentObject(progressManager)
                    } label: {
                        ActionButton(title: "Study All \(level.rawValue) Cards", icon: "rectangle.stack.fill", color: colorForLevel(level))
                    }

                    NavigationLink {
                        QuizView(flashcards: levelCards.shuffled())
                            .environmentObject(progressManager)
                    } label: {
                        ActionButton(title: "Quiz All \(level.rawValue)", icon: "questionmark.circle.fill", color: .purple)
                    }
                }

                // Grammar topics at this level
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(level.rawValue) Grammar Topics")
                        .font(.headline)

                    ForEach(levelTopics) { topic in
                        NavigationLink {
                            GrammarTopicDetailView(topic: topic)
                                .environmentObject(progressManager)
                        } label: {
                            HStack {
                                Image(systemName: topic.icon)
                                    .font(.title3)
                                    .foregroundColor(colorFromString(topic.color))
                                    .frame(width: 40)

                                VStack(alignment: .leading, spacing: 2) {
                                    Text(topic.rawValue)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .foregroundColor(.primary)

                                    Text("\(GermanContent.flashcards(for: topic).count) cards")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()

                                let topicProgress = progressManager.getGrammarProgress(topic)
                                Text("\(Int(topicProgress.accuracy))%")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(12)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("\(level.rawValue) - \(level.name)")
        .background(Color(.systemGroupedBackground))
    }

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
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "orange": return .orange
        case "red": return .red
        case "cyan": return .cyan
        default: return .blue
        }
    }
}

// MARK: - Progress Detail View

struct ProgressDetailView: View {
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        List {
            Section("Overview") {
                HStack {
                    Label("Current Level", systemImage: "star.fill")
                    Spacer()
                    Text(progressManager.getCurrentLevel().rawValue)
                        .fontWeight(.bold)
                        .foregroundColor(colorForLevel(progressManager.getCurrentLevel()))
                }

                HStack {
                    Label("Total Points", systemImage: "flame.fill")
                    Spacer()
                    Text("\(progressManager.progress.totalPoints)")
                        .foregroundColor(.orange)
                }

                HStack {
                    Label("Total Answered", systemImage: "checkmark.circle.fill")
                    Spacer()
                    Text("\(progressManager.progress.totalAnswers)")
                        .foregroundColor(.secondary)
                }

                HStack {
                    Label("Accuracy", systemImage: "target")
                    Spacer()
                    Text(String(format: "%.1f%%", progressManager.progress.accuracy))
                        .foregroundColor(.green)
                }

                HStack {
                    Label("Current Streak", systemImage: "flame")
                    Spacer()
                    Text("\(progressManager.getCurrentStreak()) days")
                        .foregroundColor(.orange)
                }
            }

            Section("Level Progress") {
                ForEach([CEFRLevel.a1, .a2], id: \.self) { level in
                    let progress = progressManager.getLevelProgress(level)
                    HStack {
                        Text(level.rawValue)
                            .fontWeight(.bold)
                            .foregroundColor(colorForLevel(level))
                            .frame(width: 30)

                        Text(level.name)

                        Spacer()

                        Text("\(progress.cardsMastered)/\(GermanContent.flashcards(for: level).count)")
                            .foregroundColor(.secondary)
                    }
                }
            }

            Section("Grammar Progress") {
                ForEach(GrammarTopic.allCases.prefix(10)) { topic in
                    let progress = progressManager.getGrammarProgress(topic)
                    HStack {
                        Image(systemName: topic.icon)
                            .foregroundColor(colorFromString(topic.color))
                            .frame(width: 24)

                        Text(topic.rawValue)
                            .lineLimit(1)

                        Spacer()

                        Text("\(Int(progress.accuracy))%")
                            .foregroundColor(.secondary)
                    }
                }
            }

            Section {
                Button("Reset All Progress", role: .destructive) {
                    progressManager.resetProgress()
                }
            }
        }
        .navigationTitle("Progress")
    }

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
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "orange": return .orange
        case "red": return .red
        case "cyan": return .cyan
        default: return .blue
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ProgressManager())
}
