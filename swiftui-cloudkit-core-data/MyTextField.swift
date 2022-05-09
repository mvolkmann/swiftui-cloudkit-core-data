import SwiftUI

// Adds a delete button to a TextField and provides default styling.
struct MyTextField: View {
    @Binding var text: String
    var placeholder: String?
    var label: String?
    
    var body: some View {
        HStack {
            if let label = label { Text(label) }
            ZStack(alignment: .trailing) {
                TextField(placeholder ?? "", text: $text)
                    .textFieldStyle(.roundedBorder)
                Button(
                    action: { text = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.lightGray))
                    }
                ).padding(.trailing, 10)
            }
        }
    }
}
