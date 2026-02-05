import SwiftUI

@main
struct GermanFlashcardsApp: App {
    @StateObject private var progressManager = ProgressManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressManager)
        }
    }
}
