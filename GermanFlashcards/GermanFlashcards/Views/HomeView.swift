import SwiftUI

struct HomeView: View {
    @EnvironmentObject var progressManager: ProgressManager
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        headerSection

                        // Progress Card
                        progressCard

                        // Quick Actions
                        quickActionsSection

                        // Categories
                        categoriesSection
                    }
                    .padding()
                }
                .background(Color(.systemGroupedBackground))
                .navigationTitle("German A2")
            }
            .tabItem {
                Label("Learn", systemImage: "book.fill")
            }
            .tag(0)

            NavigationStack {
                CategoryListView()
            }
            .tabItem {
                Label("Categories", systemImage: "folder.fill")
            }
            .tag(1)

            NavigationStack {
                ProgressView()
            }
            .tabItem {
                Label("Progress", systemImage: "chart.bar.fill")
            }
            .tag(2)
        }
        .tint(.blue)
    }

    // MARK: - Header Section

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Willkommen!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Continue your German learning journey")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Progress Card

    private var progressCard: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Your Progress")
                        .font(.headline)

                    Text("\(progressManager.progress.masteredCards.count) cards mastered")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                CircularProgressView(progress: progressManager.progress.accuracy / 100)
            }

            HStack(spacing: 20) {
                StatItem(value: "\(progressManager.progress.totalAnswers)", label: "Answered")
                StatItem(value: "\(progressManager.progress.correctAnswers)", label: "Correct")
                StatItem(value: "\(progressManager.getStreak())", label: "Streak")
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
    }

    // MARK: - Quick Actions

    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Start")
                .font(.headline)

            HStack(spacing: 12) {
                NavigationLink {
                    SwipeCardView(sentences: GermanVocabulary.swipeSentences.shuffled())
                } label: {
                    QuickActionCard(
                        title: "Swipe Practice",
                        subtitle: "Right or wrong?",
                        icon: "hand.draw.fill",
                        color: .orange
                    )
                }

                NavigationLink {
                    QuizView(flashcards: GermanVocabulary.flashcards.shuffled())
                } label: {
                    QuickActionCard(
                        title: "Quiz Mode",
                        subtitle: "Test yourself",
                        icon: "questionmark.circle.fill",
                        color: .purple
                    )
                }
            }

            HStack(spacing: 12) {
                NavigationLink {
                    FlashcardView(flashcards: GermanVocabulary.flashcards.shuffled())
                } label: {
                    QuickActionCard(
                        title: "Flashcards",
                        subtitle: "Learn vocabulary",
                        icon: "rectangle.stack.fill",
                        color: .blue
                    )
                }

                NavigationLink {
                    FlashcardView(flashcards: GermanVocabulary.flashcards.filter { $0.cardType == .grammar })
                } label: {
                    QuickActionCard(
                        title: "Grammar",
                        subtitle: "Essential rules",
                        icon: "text.book.closed.fill",
                        color: .green
                    )
                }
            }
        }
    }

    // MARK: - Categories Section

    private var categoriesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Categories")
                    .font(.headline)

                Spacer()

                NavigationLink("See All") {
                    CategoryListView()
                }
                .font(.subheadline)
            }

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(Category.allCases.prefix(4)) { category in
                    NavigationLink {
                        CategoryDetailView(category: category)
                    } label: {
                        CategoryCard(category: category, progress: progressManager.getCategoryProgress(for: category))
                    }
                }
            }
        }
    }
}

// MARK: - Supporting Views

struct CircularProgressView: View {
    let progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 8)

            Circle()
                .trim(from: 0, to: min(progress, 1.0))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: progress)

            Text("\(Int(progress * 100))%")
                .font(.caption)
                .fontWeight(.bold)
        }
        .frame(width: 50, height: 50)
    }
}

struct StatItem: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title2)
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
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct CategoryCard: View {
    let category: Category
    let progress: CategoryProgress

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: category.icon)
                .font(.title2)
                .foregroundColor(colorFromString(category.color))

            Text(category.rawValue)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            if progress.total > 0 {
                ProgressView(value: progress.percentage, total: 100)
                    .tint(colorFromString(category.color))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
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

// MARK: - Category List View

struct CategoryListView: View {
    var body: some View {
        List(Category.allCases) { category in
            NavigationLink {
                CategoryDetailView(category: category)
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: category.icon)
                        .font(.title2)
                        .frame(width: 40)

                    VStack(alignment: .leading) {
                        Text(category.rawValue)
                            .font(.headline)

                        Text("\(GermanVocabulary.flashcards(for: category).count) cards")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Categories")
    }
}

// MARK: - Progress View

struct ProgressView: View {
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        List {
            Section("Overview") {
                HStack {
                    Text("Total Answered")
                    Spacer()
                    Text("\(progressManager.progress.totalAnswers)")
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Correct Answers")
                    Spacer()
                    Text("\(progressManager.progress.correctAnswers)")
                        .foregroundColor(.green)
                }

                HStack {
                    Text("Accuracy")
                    Spacer()
                    Text(String(format: "%.1f%%", progressManager.progress.accuracy))
                        .foregroundColor(.blue)
                }

                HStack {
                    Text("Cards Mastered")
                    Spacer()
                    Text("\(progressManager.progress.masteredCards.count)")
                        .foregroundColor(.purple)
                }
            }

            Section("Category Progress") {
                ForEach(Category.allCases) { category in
                    let categoryProgress = progressManager.getCategoryProgress(for: category)
                    HStack {
                        Image(systemName: category.icon)
                            .frame(width: 24)

                        Text(category.rawValue)

                        Spacer()

                        if categoryProgress.total > 0 {
                            Text("\(categoryProgress.mastered)/\(categoryProgress.total)")
                                .foregroundColor(.secondary)
                        } else {
                            Text("Not started")
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                }
            }

            Section {
                Button("Reset Progress", role: .destructive) {
                    progressManager.resetProgress()
                }
            }
        }
        .navigationTitle("Progress")
    }
}

#Preview {
    HomeView()
        .environmentObject(ProgressManager())
}
