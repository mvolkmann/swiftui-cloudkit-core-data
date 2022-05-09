import CoreData
import SwiftUI

// This displays a list of sports.
// Tapping one navigates to a list of teams in that sport.
struct SportsList: View {
    @Environment(\.managedObjectContext) var dbContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name, order: .forward)])
        var sports: FetchedResults<Sport>
    
    @State private var openSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sports) { sport in
                    NavigationLink(destination: TeamsView(sport: sport)) {
                        Text(sport.name ?? "Unnamed")
                    }
                }
                .onDelete { indexes in
                    Task { await deleteSports(indexes: indexes) }
                }
            }
            .navigationBarTitle("Sports")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Sport") { openSheet = true }
                }
            }
            .sheet(isPresented: $openSheet) {
                AddSportView()
            }
        }
    }
    
    func deleteSports(indexes: IndexSet) async {
        // There will only be one index in the IndexSet.
        await dbContext.perform {
            for index in indexes {
                dbContext.delete(sports[index])
            }
            do {
                try dbContext.save()
            } catch {
                print("Error deleting sport")
            }
        }
    }
}
