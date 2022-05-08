# swiftui-cloudkit-core-data

1. Select top item in Navigator.
1. Select the "Signing & Capabilities" tab.

1. Click the "+" button in the upper-left.
1. Add "iCloud" capability.
1. Check the "CloudKit" checkbox.
1. Under "Containers", click the "plus" button.
1. Enter your reverse internet domain followed by a period and the app name.
1. Click the "OK" button.
1. TODO: Why is the new container name red?

1. Click the "+" button in the upper-left.
1. Add the "Background Modes" capability.
1. Check the checkboxes for "Background fetch"
   and "Remote Notifications".
   
1. Select the project folder in the Navigator (contains "ContentView.swift")   
1. Select File ... New ... File...
1. Under "Core Data", select "Data Model".
1. Click the "Next" button.
1. Click the "Create" button which creates the file "Model.xcdatamodeld".
1. Create entities.
1. Create attributes.
1. Create relationships.
1. For each relationship, check the "Optional" checkbox in the Inspector panel.
1. Select the "Default" configuration and check the
   "Used with CloudKit" checkbox in the Inspector panel.
   
1. Create the file "Model.swift".
   This uses NSPersistentCloudKitContainer to synchronized with iCloud.
   TODO: Why isn't this working?
   
1. Modify the ".swift" file that defines the class that inherits from "App".

1. Modify "ContentView.swift".

1. Select top item in Navigator.
1. Select the "Signing & Capabilities" tab.
1. Click the "CloudKit Console" button.
1. Sign in
1. Click the big "CloudKit Database" button.
1. In the dropdown at the top, select the container just created.
1. The dropdown in the left nav should have "Development" selected.
