import SwiftUI

struct LessonView: View {
    let lesson: LessonManager.Lesson
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var progressManager: ProgressManager
    @ObservedObject var userSettings = UserSettings.shared

    @State private var currentExerciseIndex = 0
    @State private var earnedXP = 0
    @State private var correctAnswers = 0
    @State private var showCompletion = false
    @State private var exerciseCompleted = false

    private var currentExercise: LessonManager.Exercise? {
        guard currentExerciseIndex < lesson.exercises.count else { return nil }
        return lesson.exercises[currentExerciseIndex]
    }

    private var progress: Double {
        Double(currentExerciseIndex) / Double(lesson.exercises.count)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                if showCompletion {
                    completionView
                } else if let exercise = currentExercise {
                    VStack(spacing: 0) {
                        // Progress bar
                        progressHeader

                        // Exercise content
                        exerciseContent(for: exercise)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                    }
                }

                ToolbarItem(placement: .principal) {
                    Text("Lesson \(lesson.lessonNumber)")
                        .font(.headline)
                }
            }
        }
    }

    // MARK: - Progress Header

    private var progressHeader: some View {
        VStack(spacing: 8) {
            ProgressView(value: progress)
                .tint(.blue)

            HStack {
                Text("\(currentExerciseIndex + 1)/\(lesson.exercises.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Spacer()

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("+\(earnedXP) XP")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
    }

    // MARK: - Exercise Content

    @ViewBuilder
    private func exerciseContent(for exercise: LessonManager.Exercise) -> some View {
        switch exercise {
        case .flashcard(let card):
            FlashcardExercise(card: card) { correct in
                handleAnswer(correct: correct, xp: exercise.xpValue)
            }

        case .multipleChoice(let card):
            MultipleChoiceExercise(card: card) { correct in
                handleAnswer(correct: correct, xp: exercise.xpValue)
            }

        case .fillBlank(let card):
            FillBlankExercise(card: card) { correct in
                handleAnswer(correct: correct, xp: exercise.xpValue)
            }

        case .matching(let cards):
            MatchingExercise(cards: cards) { correct in
                handleAnswer(correct: correct, xp: exercise.xpValue)
            }

        case .listening(let card):
            ListeningExercise(card: card) { correct in
                handleAnswer(correct: correct, xp: exercise.xpValue)
            }

        case .wordOrder(let card):
            WordOrderExercise(card: card) { correct in
                handleAnswer(correct: correct, xp: exercise.xpValue)
            }

        case .swipe(let sentence):
            SwipeExercise(sentence: sentence) { correct in
                handleAnswer(correct: correct, xp: exercise.xpValue)
            }
        }
    }

    // MARK: - Completion View

    private var completionView: some View {
        VStack(spacing: 30) {
            Spacer()

            // Celebration
            VStack(spacing: 16) {
                Image(systemName: "party.popper.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.yellow)

                Text("Lesson Complete!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Great job!")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }

            // Stats
            HStack(spacing: 30) {
                VStack {
                    Text("\(earnedXP)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    Text("XP Earned")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                VStack {
                    Text("\(correctAnswers)/\(lesson.exercises.count)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    Text("Correct")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                VStack {
                    Text("\(Int(Double(correctAnswers) / Double(lesson.exercises.count) * 100))%")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("Accuracy")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(16)

            // Streak info
            HStack {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                Text("\(userSettings.currentStreak) day streak!")
                    .fontWeight(.semibold)
            }
            .padding()
            .background(Color.orange.opacity(0.1))
            .cornerRadius(12)

            Spacer()

            // Continue button
            Button {
                dismiss()
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
        .padding()
    }

    // MARK: - Actions

    private func handleAnswer(correct: Bool, xp: Int) {
        if correct {
            earnedXP += xp
            correctAnswers += 1
        }

        // Move to next exercise after delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if currentExerciseIndex < lesson.exercises.count - 1 {
                withAnimation {
                    currentExerciseIndex += 1
                }
            } else {
                completeLesson()
            }
        }
    }

    private func completeLesson() {
        userSettings.completeLesson(unit: lesson.unitId, lesson: lesson.lessonNumber)
        userSettings.recordLessonCompleted(xpEarned: earnedXP)

        withAnimation {
            showCompletion = true
        }
    }
}

// MARK: - Exercise Views

struct FlashcardExercise: View {
    let card: Flashcard
    let onComplete: (Bool) -> Void

    @State private var isFlipped = false
    @State private var hasAnswered = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("Learn this word")
                .font(.headline)
                .foregroundColor(.secondary)

            // Card
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 5)

                VStack(spacing: 16) {
                    if !isFlipped {
                        Text(card.german)
                            .font(.title)
                            .fontWeight(.bold)

                        Button {
                            SpeechManager.shared.speakGerman(card.german)
                        } label: {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }

                        Text("Tap to reveal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    } else {
                        Text(card.german)
                            .font(.title2)
                            .foregroundColor(.secondary)

                        Text(card.english)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)

                        Text(card.explanation)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                .padding(30)
            }
            .frame(height: 280)
            .onTapGesture {
                withAnimation(.spring()) {
                    isFlipped = true
                }
            }
            .padding(.horizontal)

            Spacer()

            if isFlipped && !hasAnswered {
                HStack(spacing: 20) {
                    Button {
                        hasAnswered = true
                        onComplete(false)
                    } label: {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                            Text("Study Again")
                        }
                        .font(.headline)
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(12)
                    }

                    Button {
                        hasAnswered = true
                        onComplete(true)
                    } label: {
                        HStack {
                            Image(systemName: "checkmark")
                            Text("Got it!")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
        }
    }
}

struct MultipleChoiceExercise: View {
    let card: Flashcard
    let onComplete: (Bool) -> Void

    @State private var selectedAnswer: String?
    @State private var showResult = false

    private var options: [String] {
        // Generate wrong answers
        var opts = [card.english]
        let wrongAnswers = GermanContent.flashcards
            .filter { $0.id != card.id }
            .map { $0.english }
            .shuffled()
            .prefix(3)
        opts.append(contentsOf: wrongAnswers)
        return opts.shuffled()
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("What does this mean?")
                .font(.headline)
                .foregroundColor(.secondary)

            HStack {
                Text(card.german)
                    .font(.title)
                    .fontWeight(.bold)

                Button {
                    SpeechManager.shared.speakGerman(card.german)
                } label: {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(16)

            Spacer()

            VStack(spacing: 12) {
                ForEach(options, id: \.self) { option in
                    AnswerButton(
                        text: option,
                        isSelected: selectedAnswer == option,
                        isCorrect: showResult ? option == card.english : nil,
                        isDisabled: showResult
                    ) {
                        selectAnswer(option)
                    }
                }
            }
            .padding(.horizontal)

            Spacer()
        }
    }

    private func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        showResult = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            onComplete(answer == card.english)
        }
    }
}

struct AnswerButton: View {
    let text: String
    let isSelected: Bool
    let isCorrect: Bool?
    let isDisabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.body)

                Spacer()

                if let correct = isCorrect {
                    Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(correct ? .green : .red)
                }
            }
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: isSelected ? 2 : 0)
            )
        }
        .disabled(isDisabled)
    }

    private var backgroundColor: Color {
        if let correct = isCorrect, isSelected {
            return correct ? Color.green.opacity(0.2) : Color.red.opacity(0.2)
        }
        if isSelected {
            return Color.blue.opacity(0.1)
        }
        return Color(.secondarySystemBackground)
    }

    private var foregroundColor: Color {
        if isCorrect != nil && isSelected {
            return isCorrect! ? .green : .red
        }
        return .primary
    }

    private var borderColor: Color {
        if let correct = isCorrect, isSelected {
            return correct ? .green : .red
        }
        return isSelected ? .blue : .clear
    }
}

struct FillBlankExercise: View {
    let card: Flashcard
    let onComplete: (Bool) -> Void

    @State private var userInput = ""
    @State private var showResult = false
    @FocusState private var isFocused: Bool

    // Extract first word as the answer
    private var answer: String {
        card.german.components(separatedBy: " ").first ?? card.german
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Fill in the blank")
                .font(.headline)
                .foregroundColor(.secondary)

            Text(card.english)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            VStack(spacing: 8) {
                TextField("Type in German...", text: $userInput)
                    .font(.title3)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .focused($isFocused)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                if showResult {
                    HStack {
                        Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(isCorrect ? .green : .red)

                        Text(isCorrect ? "Correct!" : "Answer: \(answer)")
                            .foregroundColor(isCorrect ? .green : .red)
                    }
                    .font(.subheadline)
                }
            }
            .padding(.horizontal)

            Spacer()

            if !showResult {
                Button {
                    checkAnswer()
                } label: {
                    Text("Check")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(userInput.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(12)
                }
                .disabled(userInput.isEmpty)
                .padding(.horizontal)
            }

            Spacer()
        }
        .onAppear { isFocused = true }
    }

    private var isCorrect: Bool {
        userInput.lowercased().trimmingCharacters(in: .whitespaces) ==
        answer.lowercased().trimmingCharacters(in: .whitespaces)
    }

    private func checkAnswer() {
        showResult = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            onComplete(isCorrect)
        }
    }
}

struct MatchingExercise: View {
    let cards: [Flashcard]
    let onComplete: (Bool) -> Void

    @State private var germanItems: [String] = []
    @State private var englishItems: [String] = []
    @State private var selectedGerman: String?
    @State private var selectedEnglish: String?
    @State private var matchedPairs: Set<String> = []
    @State private var wrongPair: (String, String)?

    var body: some View {
        VStack(spacing: 20) {
            Text("Match the pairs")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.top)

            HStack(spacing: 16) {
                // German column
                VStack(spacing: 8) {
                    Text("German")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    ForEach(germanItems, id: \.self) { item in
                        MatchingItem(
                            text: item,
                            isSelected: selectedGerman == item,
                            isMatched: matchedPairs.contains(item),
                            isWrong: wrongPair?.0 == item
                        ) {
                            selectGerman(item)
                        }
                    }
                }

                // English column
                VStack(spacing: 8) {
                    Text("English")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    ForEach(englishItems, id: \.self) { item in
                        MatchingItem(
                            text: item,
                            isSelected: selectedEnglish == item,
                            isMatched: matchedPairs.contains(item),
                            isWrong: wrongPair?.1 == item
                        ) {
                            selectEnglish(item)
                        }
                    }
                }
            }
            .padding()

            Spacer()
        }
        .onAppear {
            germanItems = cards.map { $0.german }.shuffled()
            englishItems = cards.map { $0.english }.shuffled()
        }
    }

    private func selectGerman(_ item: String) {
        guard !matchedPairs.contains(item) else { return }
        selectedGerman = item
        checkMatch()
    }

    private func selectEnglish(_ item: String) {
        guard !matchedPairs.contains(item) else { return }
        selectedEnglish = item
        checkMatch()
    }

    private func checkMatch() {
        guard let german = selectedGerman, let english = selectedEnglish else { return }

        // Find if this is a correct pair
        let isMatch = cards.contains { $0.german == german && $0.english == english }

        if isMatch {
            matchedPairs.insert(german)
            matchedPairs.insert(english)
            selectedGerman = nil
            selectedEnglish = nil

            // Check if all matched
            if matchedPairs.count == cards.count * 2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    onComplete(true)
                }
            }
        } else {
            wrongPair = (german, english)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                wrongPair = nil
                selectedGerman = nil
                selectedEnglish = nil
            }
        }
    }
}

struct MatchingItem: View {
    let text: String
    let isSelected: Bool
    let isMatched: Bool
    let isWrong: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.subheadline)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(borderColor, lineWidth: 2)
                )
        }
        .disabled(isMatched)
    }

    private var backgroundColor: Color {
        if isMatched { return Color.green.opacity(0.2) }
        if isWrong { return Color.red.opacity(0.2) }
        if isSelected { return Color.blue.opacity(0.1) }
        return Color(.secondarySystemBackground)
    }

    private var foregroundColor: Color {
        if isMatched { return .green }
        if isWrong { return .red }
        return .primary
    }

    private var borderColor: Color {
        if isMatched { return .green }
        if isWrong { return .red }
        if isSelected { return .blue }
        return .clear
    }
}

struct ListeningExercise: View {
    let card: Flashcard
    let onComplete: (Bool) -> Void

    @State private var selectedAnswer: String?
    @State private var showResult = false
    @State private var hasPlayed = false

    private var options: [String] {
        var opts = [card.german]
        let wrong = GermanContent.flashcards
            .filter { $0.id != card.id }
            .map { $0.german }
            .shuffled()
            .prefix(3)
        opts.append(contentsOf: wrong)
        return opts.shuffled()
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("What do you hear?")
                .font(.headline)
                .foregroundColor(.secondary)

            // Play button
            Button {
                SpeechManager.shared.speakGerman(card.german)
                hasPlayed = true
            } label: {
                VStack(spacing: 12) {
                    Image(systemName: "speaker.wave.3.fill")
                        .font(.system(size: 50))

                    Text(hasPlayed ? "Tap to replay" : "Tap to listen")
                        .font(.subheadline)
                }
                .foregroundColor(.blue)
                .frame(width: 150, height: 150)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(75)
            }

            Spacer()

            if hasPlayed {
                VStack(spacing: 12) {
                    ForEach(options, id: \.self) { option in
                        AnswerButton(
                            text: option,
                            isSelected: selectedAnswer == option,
                            isCorrect: showResult ? option == card.german : nil,
                            isDisabled: showResult
                        ) {
                            selectAnswer(option)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
        }
    }

    private func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        showResult = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            onComplete(answer == card.german)
        }
    }
}

struct WordOrderExercise: View {
    let card: Flashcard
    let onComplete: (Bool) -> Void

    @State private var availableWords: [String] = []
    @State private var selectedWords: [String] = []
    @State private var showResult = false

    private var correctWords: [String] {
        card.german.components(separatedBy: " ")
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Put the words in order")
                .font(.headline)
                .foregroundColor(.secondary)

            Text(card.english)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Selected words area
            FlowLayoutView(items: selectedWords) { word in
                WordChip(word: word, isSelected: true) {
                    removeWord(word)
                }
            }
            .frame(minHeight: 60)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal)

            // Available words
            FlowLayoutView(items: availableWords) { word in
                WordChip(word: word, isSelected: false) {
                    addWord(word)
                }
            }
            .padding(.horizontal)

            if showResult {
                HStack {
                    Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(isCorrect ? .green : .red)
                    Text(isCorrect ? "Correct!" : "Answer: \(card.german)")
                        .foregroundColor(isCorrect ? .green : .red)
                }
            }

            Spacer()

            if !showResult && selectedWords.count == correctWords.count {
                Button {
                    checkAnswer()
                } label: {
                    Text("Check")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .onAppear {
            availableWords = correctWords.shuffled()
        }
    }

    private var isCorrect: Bool {
        selectedWords == correctWords
    }

    private func addWord(_ word: String) {
        if let index = availableWords.firstIndex(of: word) {
            availableWords.remove(at: index)
            selectedWords.append(word)
        }
    }

    private func removeWord(_ word: String) {
        if let index = selectedWords.firstIndex(of: word) {
            selectedWords.remove(at: index)
            availableWords.append(word)
        }
    }

    private func checkAnswer() {
        showResult = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            onComplete(isCorrect)
        }
    }
}

struct WordChip: View {
    let word: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(word)
                .font(.body)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(isSelected ? Color.blue.opacity(0.2) : Color(.tertiarySystemBackground))
                .foregroundColor(isSelected ? .blue : .primary)
                .cornerRadius(20)
        }
    }
}

struct FlowLayoutView<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    let items: Data
    let content: (Data.Element) -> Content

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(Array(items.enumerated()), id: \.element) { index, item in
                content(item)
                    .padding(4)
                    .alignmentGuide(.leading) { dimension in
                        if abs(width - dimension.width) > geometry.size.width {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if index == items.count - 1 {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if index == items.count - 1 {
                            height = 0
                        }
                        return result
                    }
            }
        }
    }
}

struct SwipeExercise: View {
    let sentence: SwipeSentence
    let onComplete: (Bool) -> Void

    @State private var offset: CGSize = .zero
    @State private var showResult = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Is this sentence correct?")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.top)

            HStack(spacing: 40) {
                VStack {
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                    Text("Wrong")
                        .font(.caption)
                }

                VStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title)
                        .foregroundColor(.green)
                    Text("Correct")
                        .font(.caption)
                }
            }

            Spacer()

            // Card
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 5)

                VStack(spacing: 16) {
                    Button {
                        SpeechManager.shared.speakGerman(sentence.sentence)
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .foregroundColor(.blue)
                    }

                    Text(sentence.sentence)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)

                    Text(sentence.translation)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .italic()
                }
                .padding(30)
            }
            .frame(height: 250)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { offset = $0.translation }
                    .onEnded { handleSwipe($0.translation.width) }
            )
            .padding(.horizontal)

            Spacer()

            HStack(spacing: 60) {
                Button {
                    swipeLeft()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.red)
                }

                Button {
                    swipeRight()
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.green)
                }
            }

            Spacer()
        }
    }

    private func handleSwipe(_ width: CGFloat) {
        if width > 100 {
            swipeRight()
        } else if width < -100 {
            swipeLeft()
        } else {
            withAnimation { offset = .zero }
        }
    }

    private func swipeRight() {
        withAnimation { offset = CGSize(width: 500, height: 0) }
        let userSaidCorrect = true
        let isActuallyCorrect = sentence.isCorrect
        let correct = userSaidCorrect == isActuallyCorrect

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            onComplete(correct)
        }
    }

    private func swipeLeft() {
        withAnimation { offset = CGSize(width: -500, height: 0) }
        let userSaidCorrect = false
        let isActuallyCorrect = sentence.isCorrect
        let correct = userSaidCorrect == isActuallyCorrect

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            onComplete(correct)
        }
    }
}

#Preview {
    if let lesson = LessonManager.shared.getLesson(unit: 1, lesson: 1) {
        LessonView(lesson: lesson)
            .environmentObject(ProgressManager())
    }
}
