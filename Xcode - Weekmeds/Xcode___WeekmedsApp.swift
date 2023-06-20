
import SwiftUI

@main
struct Xcode___Weekmeds: App {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(isDarkMode ? .dark:.light)
        }
    }
}
