import SwiftUI

@main
struct OneTweetApp: App {
    var body: some Scene {
        WindowGroup {
            TimelineView(viewModel: .init())
        }
    }
}
