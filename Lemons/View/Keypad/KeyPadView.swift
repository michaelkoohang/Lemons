
import SwiftUI

struct KeyPadView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var ivcModel: IvcModel
    @State var value: String = ""
    @State var decimalPlacesUsed: Int = 0
    
    let haptics = UISelectionFeedbackGenerator()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text(getFormattedValue())
                    .font(Font.system(size: 72, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .minimumScaleFactor(0.6)
                    .lineLimit(1)
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
                            .disabled(value.contains(".") || value.count < 1 || ivcModel.currentEntryType == .NUMBER)
                        KeyPadButton(char: "0", action: {keyPressed(s: "0")})
                        KeyPadButton(char: "", image: "delete.left", action: {keyPressed(s: "<")})
                            .disabled(value.count < 1)
                    }
                }
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                        .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(Font.system(size: 17, weight: .semibold, design: .default))
                        .cornerRadius(15, antialiased: true)
                        
                }
                .padding()
            }
            .navigationTitle(getTitle())
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            value = getSavedValue()
        }
    }
    
    func keyPressed(s: String) {
        haptics.selectionChanged()
        if s == "<" {
            if value.contains(".") && value.last != "." {
                decimalPlacesUsed -= 1
            }
            value.removeLast()
        } else {
            if value.contains(".") {
                if decimalPlacesUsed < 2 {
                    decimalPlacesUsed += 1
                    value.append(s)
                }
            } else {
                value.append(s)
            }
        }
        
        switch ivcModel.currentValue {
        case .OCF:
            ivcModel.operatingCashFlow = value.count > 0 ? Double(value)! : 0.0
        case .DROR:
            ivcModel.desiredRateOfReturn = value.count > 0 ? Double(value)! : 0.0
        case .FGR:
            ivcModel.futureGrowthRate = value.count > 0 ? Double(value)! : 0.0
        case .MCE:
            ivcModel.maintenanceCapitalExpenditure = value.count > 0 ? Double(value)! : 0.0
        case .YEARS:
            ivcModel.numOfYears = value.count > 0 ? Double(value)! : 0.0
        case .OS:
            ivcModel.outstandingShares = value.count > 0 ? Double(value)! : 0.0
        }
    }
    
    func getFormattedValue() -> String {
        switch ivcModel.currentEntryType {
        case .CASH:
            return value.count > 0 ? "$\(value)" : "$0"
        case .PERCENT:
            return value.count > 0 ? "\(value)%" : "0%"
        case .NUMBER:
            return value.count > 0 ? value : "0"
        }
    }
    
    func getSavedValue() -> String {
        switch ivcModel.currentValue {
        case .OCF:
            if ivcModel.operatingCashFlow > 0 {
                decimalPlacesUsed = 2
                return String(ivcModel.operatingCashFlow) + "0"
            } else {
                return ""
            }
        case .DROR:
            if ivcModel.desiredRateOfReturn > 0 {
                decimalPlacesUsed = 2
                return String(ivcModel.desiredRateOfReturn) + "0"
            } else {
                return ""
            }
        case .FGR:
            if ivcModel.futureGrowthRate > 0 {
                decimalPlacesUsed = 2
                return String(ivcModel.futureGrowthRate) + "0"
            } else {
                return ""
            }
        case .MCE:
            if ivcModel.maintenanceCapitalExpenditure > 0 {
                decimalPlacesUsed = 2
                return String(ivcModel.maintenanceCapitalExpenditure) + "0"
            } else {
                return ""
            }
        case .YEARS:
            return ivcModel.numOfYears > 0 ? String(Int(ivcModel.numOfYears)) : ""
        case .OS:
            return ivcModel.outstandingShares > 0 ? String(Int(ivcModel.outstandingShares)) : ""
        }
    }
    
    func getTitle() -> String {
        switch ivcModel.currentValue {
        case .OCF:
            return ivcModel.operatingCashFlowTitle
        case .DROR:
            return ivcModel.desiredRateOfReturnTitle
        case .FGR:
            return ivcModel.futureGrowthRateTitle
        case .MCE:
            return ivcModel.maintenanceCapitalExpendituresTitle
        case .YEARS:
            return ivcModel.numOfYearsTitle
        case .OS:
            return ivcModel.outstandingSharesTitle
        }
    }
    
}

struct KeyPad_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadView(ivcModel: IvcModel())
    }
}
