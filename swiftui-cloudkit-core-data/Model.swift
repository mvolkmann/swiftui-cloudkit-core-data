import CoreData
import SwiftUI

class Model: ObservableObject {
    let container: NSPersistentCloudKitContainer
    
    //static var preview: Model = { Model(preview: true) }()
    static var preview = Model(preview: true)
    
    init(preview: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Model")
        if preview {
            container.persistentStoreDescriptions.first!.url =
                URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Error \(error), \(error.userInfo)")
            }
        }
    }
}
