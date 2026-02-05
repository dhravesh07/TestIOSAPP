import SwiftUI

struct SwipeCardView: View {
    let sentences: [SwipeSentence]
    @EnvironmentObject var progressManager: ProgressManager
    @Environment(\.dismiss) private var dismiss

    @State private var currentIndex = 0
    @State private var offset: CGSize = .zero
    @State private var showExplanation = false
    @State private var lastAnswer: Bool?
    @State private var correctCount = 0
    @State private var totalAnswered = 0
    @State private var showResults = false

    var body: some View {
        VStack {
            if showResults {
                resultsView
            } else if currentIndex < sentences.count {
                cardStack
            }
        }
        .navigationTitle("Swipe Practice")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showExplanation) {
            explanationSheet
        }
    }

    // MARK: - Card Stack

    private var cardStack: some View {
        VStack(spacing: 20) {
            // Progress
            HStack {
                Text("\(currentIndex + 1) / \(sentences.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                Text("Score: \(correctCount)/\(totalAnswered)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)

            // Instructions
            HStack(spacing: 40) {
                VStack {
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                    Text("Wrong")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                VStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title)
                        .foregroundColor(.green)
                    Text("Correct")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.top)

            Spacer()

            // Card
            ZStack {
                // Background cards for stack effect
                ForEach(0..<min(3, sentences.count - currentIndex), id: \.self) { index in
                    if index > 0 {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemBackground))
                            .shadow(radius: 5)
                            .offset(y: CGFloat(index) * 8)
                            .scaleEffect(1 - CGFloat(index) * 0.05)
                    }
                }

                // Current card
                SwipeCard(sentence: sentences[currentIndex], offset: offset)
                    .offset(offset)
                    .rotationEffect(.degrees(Double(offset.width / 20)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { gesture in
                                handleSwipe(gesture.translation.width)
                            }
                    )
            }
            .padding(.horizontal, 20)

            Spacer()

            // Swipe buttons
            HStack(spacing: 60) {
                Button {
                    withAnimation(.spring()) {
                        offset = CGSize(width: -500, height: 0)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        processAnswer(userSaidCorrect: false)
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.red)
                }

                Button {
                    withAnimation(.spring()) {
                        offset = CGSize(width: 500, height: 0)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        processAnswer(userSaidCorrect: true)
                    }
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.green)
                }
            }
            .padding(.bottom, 40)
        }
    }

    // MARK: - Swipe Card

    struct SwipeCard: View {
        let sentence: SwipeSentence
        let offset: CGSize

        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: shadowColor, radius: 10)

                VStack(spacing: 20) {
                    Text("Is this sentence correct?")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text(sentence.sentence)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Divider()

                    Text(sentence.translation)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .italic()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(30)

                // Overlay indicators
                if offset.width > 50 {
                    overlayIndicator(text: "CORRECT", color: .green, alignment: .leading)
                } else if offset.width < -50 {
                    overlayIndicator(text: "WRONG", color: .red, alignment: .trailing)
                }
            }
            .frame(height: 300)
        }

        private var shadowColor: Color {
            if offset.width > 50 {
                return .green.opacity(0.5)
            } else if offset.width < -50 {
                return .red.opacity(0.5)
            }
            return .black.opacity(0.1)
        }

        private func overlayIndicator(text: String, color: Color, alignment: Alignment) -> some View {
            VStack {
                Text(text)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(color)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(color, lineWidth: 3)
                    )
                    .rotationEffect(.degrees(alignment == .leading ? -15 : 15))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
            .padding(30)
        }
    }

    // MARK: - Results View

    private var resultsView: some View {
        VStack(spacing: 30) {
            Image(systemName: correctCount > totalAnswered / 2 ? "star.fill" : "book.fill")
                .font(.system(size: 80))
                .foregroundColor(.yellow)

            Text("Session Complete!")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 10) {
                Text("Score: \(correctCount) / \(totalAnswered)")
                    .font(.title2)

                Text(String(format: "Accuracy: %.0f%%", Double(correctCount) / Double(max(totalAnswered, 1)) * 100))
                    .font(.headline)
                    .foregroundColor(.blue)
            }

            VStack(spacing: 12) {
                Button {
                    resetSession()
                } label: {
                    Text("Practice Again")
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

    // MARK: - Explanation Sheet

    private var explanationSheet: some View {
        NavigationStack {
            VStack(spacing: 20) {
                let sentence = sentences[max(0, currentIndex - 1)]

                // Result indicator
                Image(systemName: lastAnswer == sentence.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(lastAnswer == sentence.isCorrect ? .green : .red)

                Text(lastAnswer == sentence.isCorrect ? "Correct!" : "Incorrect")
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 16) {
                    // Original sentence
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Sentence:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(sentence.sentence)
                            .font(.headline)
                    }

                    // Is it correct?
                    HStack {
                        Text("This sentence is:")
                            .foregroundColor(.secondary)
                        Text(sentence.isCorrect ? "CORRECT" : "INCORRECT")
                            .fontWeight(.bold)
                            .foregroundColor(sentence.isCorrect ? .green : .red)
                    }

                    // Correct version if applicable
                    if let correctVersion = sentence.correctVersion {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Correct version:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(correctVersion)
                                .font(.headline)
                                .foregroundColor(.green)
                        }
                    }

                    Divider()

                    // Explanation
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Explanation:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(sentence.explanation)
                            .font(.body)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)

                Spacer()

                Button {
                    showExplanation = false
                    if currentIndex >= sentences.count {
                        showResults = true
                    }
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            }
            .padding()
            .navigationTitle("Explanation")
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium, .large])
    }

    // MARK: - Helper Methods

    private func handleSwipe(_ width: CGFloat) {
        if width > 100 {
            withAnimation(.spring()) {
                offset = CGSize(width: 500, height: 0)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                processAnswer(userSaidCorrect: true)
            }
        } else if width < -100 {
            withAnimation(.spring()) {
                offset = CGSize(width: -500, height: 0)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                processAnswer(userSaidCorrect: false)
            }
        } else {
            withAnimation(.spring()) {
                offset = .zero
            }
        }
    }

    private func processAnswer(userSaidCorrect: Bool) {
        let sentence = sentences[currentIndex]
        let isAnswerCorrect = userSaidCorrect == sentence.isCorrect

        lastAnswer = userSaidCorrect
        totalAnswered += 1

        if isAnswerCorrect {
            correctCount += 1
        }

        currentIndex += 1
        offset = .zero
        showExplanation = true
    }

    private func resetSession() {
        currentIndex = 0
        correctCount = 0
        totalAnswered = 0
        showResults = false
        offset = .zero
    }
}

#Preview {
    NavigationStack {
        SwipeCardView(sentences: GermanVocabulary.swipeSentences)
            .environmentObject(ProgressManager())
    }
}
