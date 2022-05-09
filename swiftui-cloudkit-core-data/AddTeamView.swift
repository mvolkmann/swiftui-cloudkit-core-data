import CoreData
import SwiftUI

struct AddTeamView: View {
    @Environment(\.managedObjectContext) var dbContext
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    let sport: Sport
    
    var body: some View {
        VStack {
            HStack {
                Text("Team Name")
                TextField("team name", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            Button("Save") {
                let text = name.trimmingCharacters(in: .whitespaces)
                if text.isEmpty { return }
                
                // Create an empty Team object.
                let team = Team(context: dbContext)
                // Set the attributes.
                team.name = text
                team.sport = sport
                // Update Core Data.
                do {
                    try dbContext.save()
                    print("Saved team \(text)")
                } catch {
                    print("Error saving team \(text)")
                }
                dismiss()
            }
        }
    }
}
