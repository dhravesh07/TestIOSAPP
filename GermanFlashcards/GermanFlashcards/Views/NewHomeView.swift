import SwiftUI

struct NewHomeView: View {
    @ObservedObject var userSettings = UserSettings.shared
    @EnvironmentObject var progressManager: ProgressManager
    @State private var showLesson = false
    @State private var showAllUnits = false

    private var currentUnit: LessonManager.Unit? {
        LessonManager.shared.getUnit(userSettings.currentUnit)
    }

    private var currentLesson: LessonManager.Lesson? {
        LessonManager.shared.getTodaysLesson()
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header with streak
                    headerSection

                    // Today's lesson (primary CTA)
                    todaysLessonCard

                    // Quick stats
                    statsSection

                    // Current unit progress
                    unitProgressSection

                    // Continue learning path
                    if showAllUnits {
                        learningPathSection
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Learn German")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .fullScreenCover(isPresented: $showLesson) {
                if let lesson = currentLesson {
                    LessonView(lesson: lesson)
                        .environmentObject(progressManager)
                }
            }
        }
    }

    // MARK: - Header Section

    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(greetingText)
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Keep your streak going!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            // Streak badge
            VStack(spacing: 2) {
                HStack(spacing: 4) {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.orange)
                    Text("\(userSettings.currentStreak)")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Text("day streak")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.orange.opacity(0.1))
            .cornerRadius(16)
        }
    }

    private var greetingText: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good morning!"
        case 12..<17: return "Good afternoon!"
        case 17..<22: return "Good evening!"
        default: return "Hello!"
        }
    }

    // MARK: - Today's Lesson Card

    private var todaysLessonCard: some View {
        Button {
            showLesson = true
        } label: {
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("TODAY'S LESSON")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.blue.opacity(0.8))

                        if let unit = currentUnit, let lesson = currentLesson {
                            Text("Unit \(unit.id): \(unit.title)")
                                .font(.headline)
                                .foregroundColor(.primary)

                            Text("Lesson \(lesson.lessonNumber): \(lesson.title)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }

                    Spacer()

                    // XP reward
                    VStack {
                        Text("+\(currentLesson?.xpReward ?? 15)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        Text("XP")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                // Progress in current unit
                if let unit = currentUnit, let lesson = currentLesson {
                    VStack(spacing: 4) {
                        HStack {
                            Text("Progress")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("\(lesson.lessonNumber - 1)/\(LessonManager.lessonsPerUnit) lessons")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        ProgressView(value: Double(lesson.lessonNumber - 1), total: Double(LessonManager.lessonsPerUnit))
                            .tint(.blue)
                    }
                }

                // Start button
                HStack {
                    Image(systemName: "play.fill")
                    Text("Start Lesson")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(
                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(12)
            }
            .padding(20)
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Stats Section

    private var statsSection: some View {
        HStack(spacing: 12) {
            StatCard(
                icon: "star.fill",
                value: "\(userSettings.totalXP)",
                label: "Total XP",
                color: .yellow
            )

            StatCard(
                icon: "chart.bar.fill",
                value: userSettings.currentLevel.rawValue,
                label: "Level",
                color: .green
            )

            StatCard(
                icon: "flag.fill",
                value: userSettings.targetLevel.rawValue,
                label: "Target",
                color: .purple
            )
        }
    }

    struct StatCard: View {
        let icon: String
        let value: String
        let label: String
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
            .padding(.vertical, 16)
            .background(Color(.systemBackground))
            .cornerRadius(16)
        }
    }

    // MARK: - Unit Progress Section

    private var unitProgressSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Your Progress")
                    .font(.headline)

                Spacer()

                Button {
                    withAnimation { showAllUnits.toggle() }
                } label: {
                    HStack(spacing: 4) {
                        Text(showAllUnits ? "Show Less" : "View All")
                            .font(.subheadline)
                        Image(systemName: showAllUnits ? "chevron.up" : "chevron.down")
                            .font(.caption)
                    }
                    .foregroundColor(.blue)
                }
            }

            // Current and next units
            if let currentUnit = currentUnit {
                UnitCard(unit: currentUnit, isCurrent: true, userSettings: userSettings)

                if let nextUnit = LessonManager.shared.getUnit(currentUnit.id + 1) {
                    UnitCard(unit: nextUnit, isCurrent: false, userSettings: userSettings)
                        .opacity(0.6)
                }
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    struct UnitCard: View {
        let unit: LessonManager.Unit
        let isCurrent: Bool
        let userSettings: UserSettings

        private var completedLessons: Int {
            if isCurrent {
                return userSettings.currentLesson - 1
            }
            return userSettings.isLessonCompleted(unit: unit.id, lesson: LessonManager.lessonsPerUnit) ? LessonManager.lessonsPerUnit : 0
        }

        var body: some View {
            HStack(spacing: 12) {
                // Unit number badge
                ZStack {
                    Circle()
                        .fill(isCurrent ? Color.blue : Color.gray.opacity(0.3))
                        .frame(width: 44, height: 44)

                    Text("\(unit.id)")
                        .font(.headline)
                        .foregroundColor(isCurrent ? .white : .gray)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(unit.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    HStack {
                        Text(unit.level.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(4)

                        Text("\(completedLessons)/\(LessonManager.lessonsPerUnit) lessons")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                Spacer()

                // Progress indicator
                if completedLessons == LessonManager.lessonsPerUnit {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                } else if isCurrent {
                    CircularProgressView(progress: Double(completedLessons) / Double(LessonManager.lessonsPerUnit))
                        .frame(width: 36, height: 36)
                } else {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding(12)
            .background(isCurrent ? Color.blue.opacity(0.05) : Color(.secondarySystemBackground))
            .cornerRadius(12)
        }
    }

    struct CircularProgressView: View {
        let progress: Double

        var body: some View {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 4)

                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .rotationEffect(.degrees(-90))

                Text("\(Int(progress * 100))%")
                    .font(.system(size: 10, weight: .bold))
            }
        }
    }

    // MARK: - Learning Path Section

    private var learningPathSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Full Learning Path")
                .font(.headline)

            ForEach([CEFRLevel.a1, .a2, .b1, .b2], id: \.self) { level in
                LevelSection(level: level, userSettings: userSettings)
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }

    struct LevelSection: View {
        let level: CEFRLevel
        let userSettings: UserSettings

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(level.rawValue)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(colorForLevel(level))
                        .cornerRadius(6)

                    Text(level.name)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                let units = LessonManager.shared.getUnitsForLevel(level)
                ForEach(units) { unit in
                    MiniUnitRow(unit: unit, userSettings: userSettings)
                }
            }
        }

        private func colorForLevel(_ level: CEFRLevel) -> Color {
            switch level {
            case .a1: return .green
            case .a2: return .blue
            case .b1: return .purple
            case .b2: return .orange
            case .c1: return .red
            case .c2: return .pink
            }
        }
    }

    struct MiniUnitRow: View {
        let unit: LessonManager.Unit
        let userSettings: UserSettings

        private var isUnlocked: Bool {
            unit.id <= userSettings.currentUnit
        }

        private var isComplete: Bool {
            userSettings.isLessonCompleted(unit: unit.id, lesson: LessonManager.lessonsPerUnit)
        }

        var body: some View {
            HStack {
                Text("Unit \(unit.id)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(width: 50, alignment: .leading)

                Text(unit.title)
                    .font(.caption)
                    .foregroundColor(isUnlocked ? .primary : .secondary)

                Spacer()

                if isComplete {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.caption)
                        .foregroundColor(.green)
                } else if !isUnlocked {
                    Image(systemName: "lock.fill")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 4)
            .opacity(isUnlocked ? 1 : 0.5)
        }
    }
}

// MARK: - Settings View (placeholder)

struct SettingsView: View {
    @ObservedObject var userSettings = UserSettings.shared

    var body: some View {
        List {
            Section("Profile") {
                HStack {
                    Text("Learning Reason")
                    Spacer()
                    Text(userSettings.learningReason.rawValue)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Daily Goal")
                    Spacer()
                    Text("\(userSettings.dailyGoalMinutes) minutes")
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Target Level")
                    Spacer()
                    Text(userSettings.targetLevel.rawValue)
                        .foregroundColor(.secondary)
                }
            }

            Section("Statistics") {
                HStack {
                    Text("Total XP")
                    Spacer()
                    Text("\(userSettings.totalXP)")
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Current Streak")
                    Spacer()
                    Text("\(userSettings.currentStreak) days")
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Longest Streak")
                    Spacer()
                    Text("\(userSettings.longestStreak) days")
                        .foregroundColor(.secondary)
                }
            }

            Section {
                Button("Reset Onboarding") {
                    userSettings.resetProgress()
                }
                .foregroundColor(.red)
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NewHomeView()
        .environmentObject(ProgressManager())
}
