import SwiftUI

struct ContentView: View {
    @ObservedObject var userSettings = UserSettings.shared
    @StateObject var progressManager = ProgressManager()

    var body: some View {
        Group {
            if userSettings.hasCompletedOnboarding {
                NewHomeView()
                    .environmentObject(progressManager)
            } else {
                OnboardingView()
            }
        }
        .animation(.easeInOut, value: userSettings.hasCompletedOnboarding)
    }
}

#Preview {
    ContentView()
}
