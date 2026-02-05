import SwiftUI

struct OnboardingView: View {
    @ObservedObject var userSettings = UserSettings.shared
    @State private var currentPage = 0
    @State private var selectedReason: LearningReason = .general
    @State private var selectedLevel: StartingLevel = .beginner
    @State private var selectedGoal: DailyGoal = .regular
    @State private var selectedTarget: CEFRLevel = .b1

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack {
                // Progress dots
                HStack(spacing: 8) {
                    ForEach(0..<4, id: \.self) { index in
                        Circle()
                            .fill(index <= currentPage ? Color.blue : Color.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.top)

                // Page content
                TabView(selection: $currentPage) {
                    welcomePage.tag(0)
                    levelPage.tag(1)
                    goalPage.tag(2)
                    targetPage.tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentPage)
            }
        }
    }

    // MARK: - Page 1: Welcome & Reason

    private var welcomePage: some View {
        VStack(spacing: 30) {
            Spacer()

            // App icon/logo
            ZStack {
                Circle()
                    .fill(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 120, height: 120)

                Text("DE")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }

            VStack(spacing: 12) {
                Text("Learn German")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Your journey to fluency starts here")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }

            Spacer()

            // Reason selection
            VStack(alignment: .leading, spacing: 16) {
                Text("Why are you learning German?")
                    .font(.headline)
                    .padding(.horizontal)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(LearningReason.allCases) { reason in
                        ReasonCard(
                            reason: reason,
                            isSelected: selectedReason == reason
                        ) {
                            selectedReason = reason
                        }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()

            // Next button
            Button {
                withAnimation { currentPage = 1 }
            } label: {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(16)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }

    // MARK: - Page 2: Current Level

    private var levelPage: some View {
        VStack(spacing: 30) {
            Spacer()

            VStack(spacing: 12) {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)

                Text("What's your level?")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("We'll personalize your learning path")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(spacing: 16) {
                ForEach(StartingLevel.allCases) { level in
                    LevelOptionCard(
                        level: level,
                        isSelected: selectedLevel == level
                    ) {
                        selectedLevel = level
                    }
                }
            }
            .padding(.horizontal, 24)

            Spacer()

            HStack(spacing: 16) {
                Button {
                    withAnimation { currentPage = 0 }
                } label: {
                    Text("Back")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(16)
                }

                Button {
                    withAnimation { currentPage = 2 }
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }

    // MARK: - Page 3: Daily Goal

    private var goalPage: some View {
        VStack(spacing: 30) {
            Spacer()

            VStack(spacing: 12) {
                Image(systemName: "flame.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.orange)

                Text("Set your daily goal")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Consistency is key to learning")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(spacing: 16) {
                ForEach(DailyGoal.allCases) { goal in
                    GoalOptionCard(
                        goal: goal,
                        isSelected: selectedGoal == goal
                    ) {
                        selectedGoal = goal
                    }
                }
            }
            .padding(.horizontal, 24)

            Spacer()

            HStack(spacing: 16) {
                Button {
                    withAnimation { currentPage = 1 }
                } label: {
                    Text("Back")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(16)
                }

                Button {
                    withAnimation { currentPage = 3 }
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }

    // MARK: - Page 4: Target & Start

    private var targetPage: some View {
        VStack(spacing: 20) {
            VStack(spacing: 12) {
                Text("Your target level")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("What level do you want to reach?")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .padding(.top, 20)

            VStack(spacing: 12) {
                ForEach([CEFRLevel.a2, .b1, .b2], id: \.self) { level in
                    TargetLevelCard(
                        level: level,
                        isSelected: selectedTarget == level
                    ) {
                        selectedTarget = level
                    }
                }
            }
            .padding(.horizontal, 24)

            Spacer()

            // Summary
            VStack(spacing: 8) {
                Text("Your personalized plan")
                    .font(.headline)
                    .foregroundColor(.secondary)

                HStack(spacing: 20) {
                    SummaryItem(icon: selectedReason.icon, text: selectedReason.rawValue)
                    SummaryItem(icon: "chart.bar.fill", text: selectedLevel.cefrLevel.rawValue)
                    SummaryItem(icon: "flame.fill", text: "\(selectedGoal.rawValue) min")
                    SummaryItem(icon: "flag.fill", text: selectedTarget.rawValue)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(16)
            .padding(.horizontal, 24)

            HStack(spacing: 16) {
                Button {
                    withAnimation { currentPage = 2 }
                } label: {
                    Text("Back")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(16)
                }

                Button {
                    completeOnboarding()
                } label: {
                    HStack {
                        Text("Start Learning")
                        Image(systemName: "arrow.right")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(16)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }

    // MARK: - Helper Views

    struct ReasonCard: View {
        let reason: LearningReason
        let isSelected: Bool
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                VStack(spacing: 8) {
                    Image(systemName: reason.icon)
                        .font(.title2)
                    Text(reason.rawValue)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(isSelected ? Color.blue.opacity(0.15) : Color(.secondarySystemBackground))
                .foregroundColor(isSelected ? .blue : .primary)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                )
            }
            .buttonStyle(.plain)
        }
    }

    struct LevelOptionCard: View {
        let level: StartingLevel
        let isSelected: Bool
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(level.rawValue)
                            .font(.headline)
                        Text("Start at \(level.cefrLevel.rawValue)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundColor(isSelected ? .blue : .gray)
                }
                .padding()
                .background(isSelected ? Color.blue.opacity(0.1) : Color(.secondarySystemBackground))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                )
            }
            .buttonStyle(.plain)
        }
    }

    struct GoalOptionCard: View {
        let goal: DailyGoal
        let isSelected: Bool
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(goal.title)
                            .font(.headline)
                        Text(goal.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    // Flame intensity indicator
                    HStack(spacing: 2) {
                        ForEach(0..<(goal.rawValue / 5), id: \.self) { _ in
                            Image(systemName: "flame.fill")
                                .font(.caption)
                                .foregroundColor(.orange)
                        }
                    }

                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundColor(isSelected ? .blue : .gray)
                }
                .padding()
                .background(isSelected ? Color.blue.opacity(0.1) : Color(.secondarySystemBackground))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                )
            }
            .buttonStyle(.plain)
        }
    }

    struct TargetLevelCard: View {
        let level: CEFRLevel
        let isSelected: Bool
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(level.rawValue)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(level.name)
                            .font(.subheadline)
                        Text(level.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                        .font(.title2)
                        .foregroundColor(isSelected ? .green : .gray)
                }
                .padding()
                .background(isSelected ? Color.green.opacity(0.1) : Color(.secondarySystemBackground))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? Color.green : Color.clear, lineWidth: 2)
                )
            }
            .buttonStyle(.plain)
        }
    }

    struct SummaryItem: View {
        let icon: String
        let text: String

        var body: some View {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.blue)
                Text(text)
                    .font(.caption)
                    .fontWeight(.medium)
            }
        }
    }

    // MARK: - Actions

    private func completeOnboarding() {
        userSettings.learningReason = selectedReason
        userSettings.currentLevel = selectedLevel.cefrLevel
        userSettings.dailyGoalMinutes = selectedGoal.rawValue
        userSettings.targetLevel = selectedTarget
        userSettings.currentUnit = selectedLevel.startUnit
        userSettings.currentLesson = 1
        userSettings.hasCompletedOnboarding = true
    }
}

#Preview {
    OnboardingView()
}
