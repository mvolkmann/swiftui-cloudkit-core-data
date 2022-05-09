import CoreData
import SwiftUI

struct AddSportView: View {
    @Environment(\.managedObjectContext) var dbContext
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Sport Name")
                TextField("name", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            Button("Save") {
                let text = name.trimmingCharacters(in: .whitespaces)
                if text.isEmpty { return }
                
                // Create an empty Sport object.
                let sport = Sport(context: dbContext)
                // Set the attributes.
                sport.name = text
                // Update Core Data.
                do {
                    try dbContext.save()
                    print("Saved sport \(text)")
                } catch {
                    print("Error saving sport \(text)")
                }
                dismiss()
            }
        }
        .padding()
    }
}
