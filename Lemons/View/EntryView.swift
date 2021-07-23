
import SwiftUI

enum EntryType {
    case CASH
    case PERCENT
    case NUMBER
}

struct EntryView: View {
    
    @ObservedObject var ivcModel: IvcModel
    @State var value: String = ""

    var body: some View {
        VStack {
            Spacer()
            Text("")
                .frame(maxWidth: .infinity, minHeight: 80)
                .lineLimit(1)
                .foregroundColor(.clear)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing)
                        .mask(
                            Text(value.count > 0 ? value : "Enter a #")
                            .minimumScaleFactor(0.6)
                            .font(Font.system(size: 72, weight: .semibold, design: .default)
                        )
                    )
                )
                .padding()
            
            Spacer()
            VStack {
                HStack {
                    KeyPadButton(char: "1", action: {keyPressed(s: "1")})
                    KeyPadButton(char: "2", action: {keyPressed(s: "2")})
                    KeyPadButton(char: "3", action: {keyPressed(s: "3")})
                }
                HStack {
                    KeyPadButton(char: "4", action: {keyPressed(s: "4")})
                    KeyPadButton(char: "5", action: {keyPressed(s: "5")})
                    KeyPadButton(char: "6", action: {keyPressed(s: "6")})

                }
                HStack {
                    KeyPadButton(char: "7", action: {keyPressed(s: "7")})
                    KeyPadButton(char: "8", action: {keyPressed(s: "8")})
                    KeyPadButton(char: "9", action: {keyPressed(s: "9")})
                }
                HStack {
                    KeyPadButton(char: ".", action: {keyPressed(s: ".")})
                    KeyPadButton(char: "0", action: {keyPressed(s: "0")})
                    KeyPadButton(char: "", image: "delete.left", action: {keyPressed(s: "<")})
                }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("Save")
                            .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .default))
                            .cornerRadius(15, antialiased: true)
                            
                    }
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 4))
                    Button(action: {
                        
                    }) {
                        Text("Cancel")
                            .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .default))
                            .cornerRadius(15, antialiased: true)
                            
                    }
                    .padding(EdgeInsets(top: 16, leading: 4, bottom: 16, trailing: 16))
                }
                
            }
            .background(Color(UIColor.systemBackground)
                .ignoresSafeArea(.container, edges: .bottom)
                .shadow(color: Color(UIColor.systemGray3), radius: 10, x: 0.0, y: 0.0)
            )
            .frame(maxWidth: .infinity)
        }
        
    }
    
    func keyPressed(s: String) {
        value.append(s)
        switch ivcModel.currentValue {
        case .OCF:
            ivcModel.operatingCashFlow = Double(value)!
        case .DROR:
            ivcModel.desiredRateOfReturn = Double(value)!
        case .FGR:
            ivcModel.futureGrowthRate = Double(value)!
        case .MCE:
            ivcModel.maintenanceCapitalExpenditure = Double(value)!
        case .YEARS:
            ivcModel.numOfYears = Double(value)!
        }
        print(ivcModel.operatingCashFlow)

    }
    
    
}

struct KeyPad_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(ivcModel: IvcModel())
    }
}
