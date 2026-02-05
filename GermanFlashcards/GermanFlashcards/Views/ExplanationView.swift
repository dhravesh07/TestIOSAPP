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

                    // Conjugation (if available)
                    if let conjugation = flashcard.conjugation {
                        conjugationSection(conjugation)
                    }

                    // Case breakdown (if available)
                    if let caseBreakdown = flashcard.caseBreakdown {
                        caseBreakdownSection(caseBreakdown)
                    }

                    // Memory tip (if available)
                    if let memoryTip = flashcard.memoryTip {
                        memoryTipSection(memoryTip)
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

                // Audio hint if available
                if let audioHint = flashcard.audioHint {
                    VStack(spacing: 4) {
                        Button {
                            // TODO: Add text-to-speech
                        } label: {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        Text(audioHint)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                } else {
                    Button {
                        // TODO: Add text-to-speech
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
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

    // MARK: - Conjugation Section

    private func conjugationSection(_ conjugation: VerbConjugation) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Conjugation: \(conjugation.infinitive)", systemImage: "tablecells")
                .font(.headline)
                .foregroundColor(.green)

            // Present tense table
            VStack(spacing: 8) {
                HStack {
                    Text("Present Tense")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    if conjugation.isRegular {
                        Text("Regular")
                            .font(.caption)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.green.opacity(0.2))
                            .foregroundColor(.green)
                            .cornerRadius(4)
                    } else {
                        Text("Irregular")
                            .font(.caption)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.orange.opacity(0.2))
                            .foregroundColor(.orange)
                            .cornerRadius(4)
                    }
                }

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                    ConjugationRow(pronoun: "ich", form: conjugation.present.ich)
                    ConjugationRow(pronoun: "wir", form: conjugation.present.wir)
                    ConjugationRow(pronoun: "du", form: conjugation.present.du)
                    ConjugationRow(pronoun: "ihr", form: conjugation.present.ihr)
                    ConjugationRow(pronoun: "er/sie/es", form: conjugation.present.erSieEs)
                    ConjugationRow(pronoun: "sie/Sie", form: conjugation.present.sieSie)
                }
            }

            // Perfect tense if available
            if let perfect = conjugation.perfect {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Perfect Tense")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("\(perfect.auxiliary) + \(perfect.pastParticiple)")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.green.opacity(0.1))
        .cornerRadius(12)
    }

    struct ConjugationRow: View {
        let pronoun: String
        let form: String

        var body: some View {
            HStack {
                Text(pronoun)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(width: 60, alignment: .leading)
                Text(form)
                    .font(.body)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: - Case Breakdown Section

    private func caseBreakdownSection(_ breakdown: CaseBreakdown) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Case Analysis", systemImage: "rectangle.3.group")
                .font(.headline)
                .foregroundColor(.purple)

            VStack(alignment: .leading, spacing: 8) {
                Text(breakdown.originalSentence)
                    .font(.body)
                    .fontWeight(.medium)

                Text(breakdown.translation)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .italic()
            }

            Divider()

            ForEach(breakdown.components, id: \.word) { component in
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(component.word)
                            .font(.body)
                            .fontWeight(.semibold)
                        Text(component.role)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .frame(width: 80, alignment: .leading)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(component.grammaticalCase.rawValue)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(caseColor(component.grammaticalCase))
                            .foregroundColor(.white)
                            .cornerRadius(4)

                        Text(component.explanation)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.purple.opacity(0.1))
        .cornerRadius(12)
    }

    private func caseColor(_ grammaticalCase: CaseBreakdown.GrammaticalCase) -> Color {
        switch grammaticalCase {
        case .nominative: return .blue
        case .accusative: return .green
        case .dative: return .orange
        case .genitive: return .purple
        }
    }

    // MARK: - Memory Tip Section

    private func memoryTipSection(_ tip: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Memory Tip", systemImage: "brain.head.profile")
                .font(.headline)
                .foregroundColor(.cyan)

            Text(tip)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(12)
    }

    // MARK: - Meta Section

    private var metaSection: some View {
        VStack(spacing: 12) {
            // Grammar topics
            if !flashcard.grammarTopics.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Grammar Topics")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    FlowLayout(spacing: 6) {
                        ForEach(flashcard.grammarTopics) { topic in
                            HStack(spacing: 4) {
                                Image(systemName: topic.icon)
                                    .font(.caption2)
                                Text(topic.rawValue)
                                    .font(.caption2)
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(colorFromString(topic.color).opacity(0.2))
                            .foregroundColor(colorFromString(topic.color))
                            .cornerRadius(8)
                        }
                    }
                }
            }

            Divider()

            // Level and type badges
            HStack {
                // Thematic category
                Label(flashcard.thematicCategory.rawValue, systemImage: flashcard.thematicCategory.icon)
                    .font(.caption)
                    .foregroundColor(.secondary)

                Spacer()

                // Level badge
                Text(flashcard.level.rawValue)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(colorForLevel(flashcard.level).opacity(0.2))
                    .foregroundColor(colorForLevel(flashcard.level))
                    .cornerRadius(8)

                // Card type
                Text(flashcard.cardType.rawValue)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.gray)
                    .cornerRadius(8)

                // Points
                Text("+\(flashcard.points) pts")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
            }
        }
        .padding(.top)
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

    private func colorFromString(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "green": return .green
        case "purple": return .purple
        case "orange": return .orange
        case "red": return .red
        case "cyan": return .cyan
        case "yellow": return .yellow
        default: return .gray
        }
    }
}

// MARK: - Flow Layout for Tags

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, spacing: spacing, subviews: subviews)
        return CGSize(width: proposal.width ?? 0, height: result.height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, spacing: spacing, subviews: subviews)
        for (index, subview) in subviews.enumerated() {
            let point = result.positions[index]
            subview.place(at: CGPoint(x: bounds.minX + point.x, y: bounds.minY + point.y), proposal: .unspecified)
        }
    }

    struct FlowResult {
        var positions: [CGPoint] = []
        var height: CGFloat = 0

        init(in width: CGFloat, spacing: CGFloat, subviews: Subviews) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var rowHeight: CGFloat = 0

            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)

                if x + size.width > width && x > 0 {
                    x = 0
                    y += rowHeight + spacing
                    rowHeight = 0
                }

                positions.append(CGPoint(x: x, y: y))
                rowHeight = max(rowHeight, size.height)
                x += size.width + spacing
            }

            height = y + rowHeight
        }
    }
}

#Preview {
    ExplanationView(flashcard: GermanContent.flashcards[0])
}
