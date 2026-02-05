import SwiftUI

struct ExplanationView: View {
    let flashcard: Flashcard
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Main word/phrase
                    mainSection

                    // Explanation
                    explanationSection

                    // Example
                    exampleSection

                    // Grammar tip (if available)
                    if let grammarTip = flashcard.grammarTip {
                        grammarSection(grammarTip)
                    }

                    // Meta info
                    metaSection
                }
                .padding()
            }
            .navigationTitle("Explanation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }

    // MARK: - Main Section

    private var mainSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("German")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text(flashcard.german)
                        .font(.title)
                        .fontWeight(.bold)
                }

                Spacer()

                Button {
                    // TODO: Add text-to-speech
                } label: {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }

            Divider()

            VStack(alignment: .leading, spacing: 4) {
                Text("English")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(flashcard.english)
                    .font(.title2)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
    }

    // MARK: - Explanation Section

    private var explanationSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Explanation", systemImage: "lightbulb.fill")
                .font(.headline)
                .foregroundColor(.orange)

            Text(flashcard.explanation)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.orange.opacity(0.1))
        .cornerRadius(12)
    }

    // MARK: - Example Section

    private var exampleSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Example", systemImage: "text.quote")
                .font(.headline)
                .foregroundColor(.blue)

            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    Text("DE")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.blue)
                        .cornerRadius(4)

                    Text(flashcard.example)
                        .font(.body)
                        .italic()
                }

                HStack(alignment: .top) {
                    Text("EN")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.green)
                        .cornerRadius(4)

                    Text(flashcard.exampleTranslation)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }

    // MARK: - Grammar Section

    private func grammarSection(_ tip: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Grammar Tip", systemImage: "book.fill")
                .font(.headline)
                .foregroundColor(.purple)

            Text(tip)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.purple.opacity(0.1))
        .cornerRadius(12)
    }

    // MARK: - Meta Section

    private var metaSection: some View {
        HStack {
            Label(flashcard.category.rawValue, systemImage: flashcard.category.icon)
                .font(.caption)
                .foregroundColor(.secondary)

            Spacer()

            Text(flashcard.difficulty.rawValue)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(flashcard.difficulty == .a1 ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                .foregroundColor(flashcard.difficulty == .a1 ? .green : .blue)
                .cornerRadius(8)

            Text(flashcard.cardType.rawValue.capitalized)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.gray)
                .cornerRadius(8)
        }
        .padding(.top)
    }
}

#Preview {
    ExplanationView(flashcard: GermanVocabulary.flashcards[0])
}
