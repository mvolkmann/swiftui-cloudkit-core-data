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
                if !text.isEmpty {
                    let sport = Sport(context: dbContext)
                    sport.name = text
                    do {
                        try dbContext.save()
                    } catch {
                        print("Error saving sport")
                    }
                    dismiss()
                }
            }
        }
        .padding()
    }
}

struct AddSportView_Previews: PreviewProvider {
    static var previews: some View {
        AddSportView()
    }
}
