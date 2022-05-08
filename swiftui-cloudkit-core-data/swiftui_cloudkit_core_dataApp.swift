import SwiftUI

@main
struct swiftui_cloudkit_core_dataApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(
                \.managedObjectContext,
                model.container.viewContext
            )
        }
    }
}
