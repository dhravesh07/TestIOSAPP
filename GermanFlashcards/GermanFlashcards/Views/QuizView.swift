import SwiftUI

struct QuizView: View {
    let flashcards: [Flashcard]
    @EnvironmentObject var progressManager: ProgressManager
    @Environment(\.dismiss) private var dismiss

    @State private var questions: [QuizQuestion] = []
    @State private var currentIndex = 0
    @State private var selectedAnswer: String?
    @State private var showResult = false
    @State private var correctCount = 0
    @State private var showExplanation = false
    @State private var showFinalResults = false
    @State private var earnedPoints = 0

    var body: some View {
        VStack {
            if showFinalResults {
                finalResultsView
            } else if !questions.isEmpty && currentIndex < questions.count {
                quizContent
            } else {
                loadingView
            }
        }
        .navigationTitle("Quiz")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            generateQuestions()
        }
        .sheet(isPresented: $showExplanation) {
            if currentIndex < questions.count {
                ExplanationView(flashcard: questions[currentIndex].flashcard)
            }
        }
    }

    // MARK: - Quiz Content

    private var quizContent: some View {
        VStack(spacing: 20) {
            // Progress
            progressSection

            // Question
            questionSection

            // Options
            optionsSection

            Spacer()

            // Action Button
            actionButton
        }
        .padding()
    }

    // MARK: - Progress Section

    private var progressSection: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Question \(currentIndex + 1) of \(questions.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                // Level badge
                Text(questions[currentIndex].level.rawValue)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(colorForLevel(questions[currentIndex].level))
                    .cornerRadius(8)

                HStack(spacing: 4) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("\(correctCount)")
                        .fontWeight(.semibold)
                }
            }

            ProgressView(value: Double(currentIndex), total: Double(questions.count))
                .tint(.blue)
        }
    }

    // MARK: - Question Section

    private var questionSection: some View {
        VStack(spacing: 16) {
            let question = questions[currentIndex]

            HStack {
                Spacer()
                Text(questionText(for: question))
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                Spacer()

                // Speaker button for German questions
                if question.questionType == .germanToEnglish {
                    Button {
                        SpeechManager.shared.speakGerman(question.flashcard.german)
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.title3)
                            .foregroundColor(.blue)
                    }
                }
            }

            Text(questionPrompt(for: question))
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
        }
    }

    private func questionText(for question: QuizQuestion) -> String {
        switch question.questionType {
        case .germanToEnglish:
            return "What does this mean in English?"
        case .englishToGerman:
            return "How do you say this in German?"
        case .fillInBlank:
            return "Fill in the blank:"
        case .selectCorrectForm:
            return "Select the correct form:"
        case .conjugation:
            return "Conjugate the verb:"
        case .caseSelection:
            return "Which case is this?"
        case .articleSelection:
            return "Choose the correct article:"
        }
    }

    private func questionPrompt(for question: QuizQuestion) -> String {
        switch question.questionType {
        case .germanToEnglish:
            return question.flashcard.german
        case .englishToGerman:
            return question.flashcard.english
        case .fillInBlank:
            return question.flashcard.example
        default:
            return question.flashcard.german
        }
    }

    // MARK: - Options Section

    private var optionsSection: some View {
        VStack(spacing: 12) {
            ForEach(questions[currentIndex].options, id: \.self) { option in
                OptionButton(
                    text: option,
                    isSelected: selectedAnswer == option,
                    isCorrect: showResult ? option == questions[currentIndex].correctAnswer : nil,
                    isWrong: showResult && selectedAnswer == option && option != questions[currentIndex].correctAnswer
                ) {
                    if !showResult {
                        selectedAnswer = option
                    }
                }
            }
        }
    }

    // MARK: - Option Button

    struct OptionButton: View {
        let text: String
        let isSelected: Bool
        let isCorrect: Bool?
        let isWrong: Bool

        let action: () -> Void

        var body: some View {
            Button(action: action) {
                HStack {
                    Text(text)
                        .font(.body)
                        .multilineTextAlignment(.leading)

                    Spacer()

                    if let isCorrect = isCorrect {
                        Image(systemName: isCorrect ? "checkmark.circle.fill" : (isWrong ? "xmark.circle.fill" : "circle"))
                            .foregroundColor(isCorrect ? .green : (isWrong ? .red : .gray))
                    } else {
                        Image(systemName: isSelected ? "circle.fill" : "circle")
                            .foregroundColor(isSelected ? .blue : .gray)
                    }
                }
                .padding()
                .background(backgroundColor)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(borderColor, lineWidth: 2)
                )
            }
            .buttonStyle(.plain)
        }

        private var backgroundColor: Color {
            if let isCorrect = isCorrect, isCorrect {
                return Color.green.opacity(0.1)
            } else if isWrong {
                return Color.red.opacity(0.1)
            } else if isSelected {
                return Color.blue.opacity(0.1)
            }
            return Color(.secondarySystemBackground)
        }

        private var borderColor: Color {
            if let isCorrect = isCorrect, isCorrect {
                return .green
            } else if isWrong {
                return .red
            } else if isSelected {
                return .blue
            }
            return .clear
        }
    }

    // MARK: - Action Button

    private var actionButton: some View {
        VStack(spacing: 12) {
            if showResult {
                // Points earned
                if selectedAnswer == questions[currentIndex].correctAnswer {
                    Text("+\(questions[currentIndex].flashcard.points) points")
                        .font(.headline)
                        .foregroundColor(.green)
                }

                Button {
                    showExplanation = true
                } label: {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("Show Explanation")
                    }
                    .font(.subheadline)
                    .foregroundColor(.blue)
                }

                Button {
                    nextQuestion()
                } label: {
                    Text("Next Question")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            } else {
                Button {
                    checkAnswer()
                } label: {
                    Text("Check Answer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedAnswer == nil ? Color.gray : Color.blue)
                        .cornerRadius(12)
                }
                .disabled(selectedAnswer == nil)
            }
        }
    }

    // MARK: - Final Results View

    private var finalResultsView: some View {
        VStack(spacing: 30) {
            let percentage = Double(correctCount) / Double(questions.count) * 100

            Image(systemName: resultIcon(for: percentage))
                .font(.system(size: 80))
                .foregroundColor(resultColor(for: percentage))

            Text("Quiz Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 10) {
                Text("\(correctCount) / \(questions.count) correct")
                    .font(.title2)

                Text(String(format: "%.0f%%", percentage))
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(resultColor(for: percentage))

                Text("+\(earnedPoints) points earned")
                    .font(.headline)
                    .foregroundColor(.orange)

                Text(resultMessage(for: percentage))
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }

            VStack(spacing: 12) {
                Button {
                    restartQuiz()
                } label: {
                    Text("Try Again")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }

                Button {
                    dismiss()
                } label: {
                    Text("Back to Home")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }

    // MARK: - Loading View

    private var loadingView: some View {
        VStack {
            ProgressView()
            Text("Preparing quiz...")
                .foregroundColor(.secondary)
        }
    }

    // MARK: - Helper Methods

    private func generateQuestions() {
        let selectedCards = Array(flashcards.shuffled().prefix(min(10, flashcards.count)))
        questions = selectedCards.map { card in
            generateQuizQuestion(from: card, allFlashcards: flashcards)
        }
    }

    private func generateQuizQuestion(from flashcard: Flashcard, allFlashcards: [Flashcard]) -> QuizQuestion {
        let questionTypes: [QuizQuestion.QuestionType] = [.germanToEnglish, .englishToGerman]
        let questionType = questionTypes.randomElement()!

        let correctAnswer: String

        switch questionType {
        case .germanToEnglish:
            correctAnswer = flashcard.english
            let wrongOptions = allFlashcards
                .filter { $0.id != flashcard.id }
                .shuffled()
                .prefix(3)
                .map { $0.english }
            var options = Array(wrongOptions) + [correctAnswer]
            options.shuffle()
            return QuizQuestion(flashcard: flashcard, questionType: questionType, options: options, correctAnswer: correctAnswer)

        case .englishToGerman:
            correctAnswer = flashcard.german
            let wrongOptions = allFlashcards
                .filter { $0.id != flashcard.id }
                .shuffled()
                .prefix(3)
                .map { $0.german }
            var options = Array(wrongOptions) + [correctAnswer]
            options.shuffle()
            return QuizQuestion(flashcard: flashcard, questionType: questionType, options: options, correctAnswer: correctAnswer)

        default:
            correctAnswer = flashcard.english
            let wrongOptions = allFlashcards
                .filter { $0.id != flashcard.id }
                .shuffled()
                .prefix(3)
                .map { $0.english }
            var options = Array(wrongOptions) + [correctAnswer]
            options.shuffle()
            return QuizQuestion(flashcard: flashcard, questionType: questionType, options: options, correctAnswer: correctAnswer)
        }
    }

    private func checkAnswer() {
        showResult = true
        let question = questions[currentIndex]
        let isCorrect = selectedAnswer == question.correctAnswer

        if isCorrect {
            correctCount += 1
            earnedPoints += question.flashcard.points
        }

        progressManager.recordAnswer(correct: isCorrect, card: question.flashcard)
    }

    private func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            selectedAnswer = nil
            showResult = false
        } else {
            showFinalResults = true
        }
    }

    private func restartQuiz() {
        currentIndex = 0
        selectedAnswer = nil
        showResult = false
        correctCount = 0
        earnedPoints = 0
        showFinalResults = false
        generateQuestions()
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

    private func resultIcon(for percentage: Double) -> String {
        if percentage >= 80 {
            return "star.fill"
        } else if percentage >= 60 {
            return "hand.thumbsup.fill"
        } else if percentage >= 40 {
            return "book.fill"
        } else {
            return "arrow.counterclockwise"
        }
    }

    private func resultColor(for percentage: Double) -> Color {
        if percentage >= 80 {
            return .yellow
        } else if percentage >= 60 {
            return .green
        } else if percentage >= 40 {
            return .orange
        } else {
            return .red
        }
    }

    private func resultMessage(for percentage: Double) -> String {
        if percentage >= 80 {
            return "Ausgezeichnet! Excellent work!"
        } else if percentage >= 60 {
            return "Gut gemacht! Good job!"
        } else if percentage >= 40 {
            return "Keep practicing! You're improving!"
        } else {
            return "Don't give up! Practice makes perfect!"
        }
    }
}

#Preview {
    NavigationStack {
        QuizView(flashcards: GermanContent.flashcards)
            .environmentObject(ProgressManager())
    }
}
