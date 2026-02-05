import AVFoundation

class SpeechManager: ObservableObject {
    static let shared = SpeechManager()

    private let synthesizer = AVSpeechSynthesizer()
    @Published var isSpeaking = false

    private init() {
        // Configure audio session for playback
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }

    /// Speak German text with German voice
    func speakGerman(_ text: String, rate: Float = 0.45) {
        speak(text, language: "de-DE", rate: rate)
    }

    /// Speak English text with English voice
    func speakEnglish(_ text: String, rate: Float = 0.5) {
        speak(text, language: "en-US", rate: rate)
    }

    /// Stop current speech
    func stop() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        isSpeaking = false
    }

    private func speak(_ text: String, language: String, rate: Float) {
        // Stop any current speech
        stop()

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = rate
        utterance.pitchMultiplier = 1.0
        utterance.volume = 1.0

        // Add slight pause between sentences
        utterance.preUtteranceDelay = 0.1
        utterance.postUtteranceDelay = 0.1

        isSpeaking = true
        synthesizer.speak(utterance)

        // Reset speaking state when done (approximate based on text length)
        let estimatedDuration = Double(text.count) * 0.05 / Double(rate)
        DispatchQueue.main.asyncAfter(deadline: .now() + estimatedDuration + 0.5) { [weak self] in
            self?.isSpeaking = false
        }
    }
}
