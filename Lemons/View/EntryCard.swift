
import SwiftUI
import Combine

struct EntryCard: View {
    
    @State var title: String
    @State var type: EntryType
    @Binding var value: Double
    @State var action: () -> ()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: HelpView(title: title, info: helpInfo[title]!)) {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10))
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(getValueFormat())
                                .foregroundColor(.black)
                                .font(.system(.title2, design: .serif))
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                            Text(title.lowercased())
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.system(.caption, design: .serif))
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Colors.yellow)
        )
        .frame(maxWidth: .infinity, maxHeight: 115)
        .onTapGesture(perform: action)
        
    }
    
    // Returns the pretty formatted version of the value
    func getValueFormat() -> String {
        switch type {
        case .CASH:
            return EntryFormatter.formatCurrency(val: value)
        case .PERCENT:
            return EntryFormatter.formatPercent(val: value)
        case .NUMBER:
            return String(Int(value))
        }
    }
}

struct EntryCard_Previews: PreviewProvider {
    static var previews: some View {
        EntryCard(title: "Maintenance Capital Expenditures", type: .PERCENT, value: .constant(24), action: {})
    }
}

