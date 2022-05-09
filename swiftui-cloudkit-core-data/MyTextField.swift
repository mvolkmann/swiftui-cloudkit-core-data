import SwiftUI

struct MyTextField: View {
    var label: String?
    var placeholder: String?
    @Binding var text: String
    
    var body: some View {
        HStack {
            if let label = label {
                Text(label)
            }
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
