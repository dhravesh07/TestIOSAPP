import AVFoundation

class SpeechManager: NSObject, ObservableObject {
    static let shared = SpeechManager()

    private let synthesizer = AVSpeechSynthesizer()
    @Published var isSpeaking = false

    // Cached premium voices
    private var germanVoice: AVSpeechSynthesisVoice?
    private var englishVoice: AVSpeechSynthesisVoice?

    private override init() {
        super.init()

        // Configure audio session for playback
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio, options: [.duckOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }

        // Set delegate for proper speech tracking
        synthesizer.delegate = self

        // Find best available voices
        germanVoice = findBestVoice(for: "de")
        englishVoice = findBestVoice(for: "en")

        // Debug: Print selected voices
        if let gv = germanVoice {
            print("German voice: \(gv.name) (\(gv.identifier))")
        }
        if let ev = englishVoice {
            print("English voice: \(ev.name) (\(ev.identifier))")
        }
    }

    /// Find the best available voice for a language
    /// Prioritizes: Premium > Enhanced > Default
    private func findBestVoice(for languagePrefix: String) -> AVSpeechSynthesisVoice? {
        let allVoices = AVSpeechSynthesisVoice.speechVoices()

        // Filter voices for this language
        let languageVoices = allVoices.filter { $0.language.hasPrefix(languagePrefix) }

        // Priority 1: Premium quality voices (downloaded enhanced voices)
        // These have quality = .premium on iOS 16+
        if #available(iOS 16.0, *) {
            if let premiumVoice = languageVoices.first(where: { $0.voiceTraits.contains(.isPersonalVoice) == false && $0.quality == .premium }) {
                return premiumVoice
            }
        }

        // Priority 2: Enhanced quality voices
        if let enhancedVoice = languageVoices.first(where: { $0.quality == .enhanced }) {
            return enhancedVoice
        }

        // Priority 3: Specific known good voices by name
        let preferredGermanNames = ["Helena", "Anna", "Markus", "Martin"]
        let preferredEnglishNames = ["Samantha", "Karen", "Daniel", "Moira", "Tessa"]
        let preferredNames = languagePrefix == "de" ? preferredGermanNames : preferredEnglishNames

        for name in preferredNames {
            if let voice = languageVoices.first(where: { $0.name.contains(name) }) {
                return voice
            }
        }

        // Priority 4: Default voice for the language
        // Prefer Germany (de-DE) for German, US (en-US) for English
        let preferredLocale = languagePrefix == "de" ? "de-DE" : "en-US"
        if let defaultVoice = AVSpeechSynthesisVoice(language: preferredLocale) {
            return defaultVoice
        }

        // Fallback: Any voice for this language
        return languageVoices.first
    }

    /// Speak German text with natural German voice
    func speakGerman(_ text: String, rate: Float = 0.48) {
        speak(text, voice: germanVoice, language: "de-DE", rate: rate)
    }

    /// Speak English text with natural English voice
    func speakEnglish(_ text: String, rate: Float = 0.5) {
        speak(text, voice: englishVoice, language: "en-US", rate: rate)
    }

    /// Stop current speech
    func stop() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        DispatchQueue.main.async {
            self.isSpeaking = false
        }
    }

    private func speak(_ text: String, voice: AVSpeechSynthesisVoice?, language: String, rate: Float) {
        // Stop any current speech
        stop()

        let utterance = AVSpeechUtterance(string: text)

        // Use cached premium voice or fall back to language default
        utterance.voice = voice ?? AVSpeechSynthesisVoice(language: language)

        // Natural speech settings
        utterance.rate = rate  // Slightly slower than default for clarity
        utterance.pitchMultiplier = 1.0  // Natural pitch
        utterance.volume = 1.0

        // Natural pauses
        utterance.preUtteranceDelay = 0.05
        utterance.postUtteranceDelay = 0.1

        DispatchQueue.main.async {
            self.isSpeaking = true
        }

        synthesizer.speak(utterance)
    }

    /// List all available voices (for debugging)
    func listAvailableVoices() {
        print("\n=== Available German Voices ===")
        for voice in AVSpeechSynthesisVoice.speechVoices().filter({ $0.language.hasPrefix("de") }) {
            print("  \(voice.name) - \(voice.language) - Quality: \(voice.quality.rawValue)")
        }

        print("\n=== Available English Voices ===")
        for voice in AVSpeechSynthesisVoice.speechVoices().filter({ $0.language.hasPrefix("en") }) {
            print("  \(voice.name) - \(voice.language) - Quality: \(voice.quality.rawValue)")
        }
    }
}

// MARK: - AVSpeechSynthesizerDelegate

extension SpeechManager: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            self.isSpeaking = true
        }
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            self.isSpeaking = false
        }
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            self.isSpeaking = false
        }
    }
}
