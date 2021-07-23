
import SwiftUI
import Combine


struct EntryField: View {
    
    @State var title: String
    @Binding var value: Double
    @State var action: () -> ()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.body)
                NavigationLink(destination: HelpView(title: title, info: helpInfo[title]!)) {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(Color.secondary)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                }
            }
            ZStack {
                Button(action: action) {
                    Text("test")
                        .frame(maxWidth: .infinity, minHeight: 45, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .foregroundColor(Color(UIColor.secondarySystemBackground))
                        )
                        .foregroundColor(.primary)
                        .font(Font.system(size: 14, weight: .semibold, design: .default))
                        .cornerRadius(10, antialiased: true)
                        
                }
                .shadow(color: Color(UIColor.systemGray3), radius: 15, x: 0.0, y: 0.0)
            }
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

struct BearishTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EntryField(title: "Test", value: .constant(24), action: {})
        }
    }
}

