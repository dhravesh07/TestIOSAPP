import SwiftUI

struct FlashcardView: View {
    let flashcards: [Flashcard]
    @EnvironmentObject var progressManager: ProgressManager
    @Environment(\.dismiss) private var dismiss

    @State private var currentIndex = 0
    @State private var isFlipped = false
    @State private var showExplanation = false
    @State private var offset: CGSize = .zero

    var body: some View {
        VStack(spacing: 20) {
            if currentIndex < flashcards.count {
                // Progress indicator
                progressIndicator

                Spacer()

                // Flashcard
                flashcard

                Spacer()

                // Action buttons
                actionButtons

                // Navigation
                navigationButtons
            } else {
                completionView
            }
        }
        .padding()
        .navigationTitle("Flashcards")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showExplanation) {
            ExplanationView(flashcard: flashcards[currentIndex])
        }
    }

    // MARK: - Progress Indicator

    private var progressIndicator: some View {
        VStack(spacing: 8) {
            HStack {
                Text("\(currentIndex + 1) / \(flashcards.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                Text(flashcards[currentIndex].difficulty.rawValue)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(flashcards[currentIndex].difficulty == .a1 ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                    .foregroundColor(flashcards[currentIndex].difficulty == .a1 ? .green : .blue)
                    .cornerRadius(8)
            }

            ProgressView(value: Double(currentIndex), total: Double(flashcards.count))
                .tint(.blue)
        }
    }

    // MARK: - Flashcard

    private var flashcard: some View {
        ZStack {
            // Front of card
            CardFace(
                content: flashcards[currentIndex].german,
                subtitle: "German",
                icon: "speaker.wave.2.fill",
                color: .blue
            )
            .opacity(isFlipped ? 0 : 1)
            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))

            // Back of card
            CardFace(
                content: flashcards[currentIndex].english,
                subtitle: "English",
                icon: "textformat",
                color: .green
            )
            .opacity(isFlipped ? 1 : 0)
            .rotation3DEffect(.degrees(isFlipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
        }
        .frame(height: 280)
        .offset(offset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { gesture in
                    handleSwipe(gesture.translation.width)
                }
        )
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isFlipped.toggle()
            }
        }
    }

    // MARK: - Card Face

    struct CardFace: View {
        let content: String
        let subtitle: String
        let icon: String
        let color: Color

        var body: some View {
            VStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(color)

                Text(content)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text("Tap to flip")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        }
    }

    // MARK: - Action Buttons

    private var actionButtons: some View {
        VStack(spacing: 12) {
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

            HStack(spacing: 20) {
                Button {
                    markForReview()
                } label: {
                    VStack {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.title2)
                        Text("Review")
                            .font(.caption)
                    }
                    .foregroundColor(.orange)
                    .frame(width: 80)
                }

                Button {
                    markAsMastered()
                } label: {
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                        Text("Got it!")
                            .font(.caption)
                    }
                    .foregroundColor(.green)
                    .frame(width: 80)
                }
            }
        }
    }

    // MARK: - Navigation Buttons

    private var navigationButtons: some View {
        HStack {
            Button {
                previousCard()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .foregroundColor(currentIndex > 0 ? .blue : .gray)
            }
            .disabled(currentIndex == 0)

            Spacer()

            Button {
                nextCard()
            } label: {
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal, 40)
    }

    // MARK: - Completion View

    private var completionView: some View {
        VStack(spacing: 30) {
            Image(systemName: "party.popper.fill")
                .font(.system(size: 80))
                .foregroundColor(.yellow)

            Text("Great job!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("You've reviewed all \(flashcards.count) cards!")
                .font(.headline)
                .foregroundColor(.secondary)

            VStack(spacing: 12) {
                Button {
                    resetSession()
                } label: {
                    Text("Start Over")
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
    }

    // MARK: - Helper Methods

    private func handleSwipe(_ width: CGFloat) {
        if width > 100 {
            withAnimation(.spring()) {
                offset = CGSize(width: 500, height: 0)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                markAsMastered()
            }
        } else if width < -100 {
            withAnimation(.spring()) {
                offset = CGSize(width: -500, height: 0)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                markForReview()
            }
        } else {
            withAnimation(.spring()) {
                offset = .zero
            }
        }
    }

    private func nextCard() {
        withAnimation {
            isFlipped = false
            if currentIndex < flashcards.count - 1 {
                currentIndex += 1
            } else {
                currentIndex = flashcards.count
            }
            offset = .zero
        }
    }

    private func previousCard() {
        withAnimation {
            isFlipped = false
            if currentIndex > 0 {
                currentIndex -= 1
            }
            offset = .zero
        }
    }

    private func markAsMastered() {
        let card = flashcards[currentIndex]
        progressManager.markCardMastered(card.id)
        progressManager.recordAnswer(correct: true, cardId: card.id, category: card.category)
        nextCard()
    }

    private func markForReview() {
        let card = flashcards[currentIndex]
        progressManager.markCardForReview(card.id)
        progressManager.recordAnswer(correct: false, cardId: card.id, category: card.category)
        nextCard()
    }

    private func resetSession() {
        currentIndex = 0
        isFlipped = false
        offset = .zero
    }
}

#Preview {
    NavigationStack {
        FlashcardView(flashcards: GermanVocabulary.flashcards)
            .environmentObject(ProgressManager())
    }
}
