import CoreData
import SwiftUI

struct TeamsView: View {
    @Environment(\.managedObjectContext) var dbContext
    
    @FetchRequest(sortDescriptors: []) var teams: FetchedResults<Team>
    
    @State private var openSheet = false
    
    let sport: Sport
    
    init(sport: Sport) {
        self.sport = sport
        _teams = FetchRequest(
            sortDescriptors: [SortDescriptor(\Team.name, order: .forward)],
            predicate: NSPredicate(format: "sport = %@", sport),
            animation: .default
        )
    }
    
    var body: some View {
        List {
            ForEach(teams) { team in
                Text(team.name ?? "Unnamed Team")
            }
            .onDelete { indexes in
                Task { await deleteTeams(indexes: indexes) }
            }
        }
        .navigationBarTitle(sport.name ?? "Unnamed Sport")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add Team") { openSheet = true }
            }
        }
        .sheet(isPresented: $openSheet) {
            AddTeamView(sport: sport)
        }
    }
    
    func deleteTeams(indexes: IndexSet) async {
        await dbContext.perform {
            for index in indexes {
                dbContext.delete(teams[index])
            }
            do {
                try dbContext.save()
            } catch {
                print("Error deleting team")
            }
        }
    }
}
