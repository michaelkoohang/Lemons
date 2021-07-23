
import SwiftUI

struct MainView: View {
    
    @StateObject var ivcModel = IvcModel()
    @State var isEditing: Bool = false
    
    let haptics = UIImpactFeedbackGenerator()
    let operatingCashFlowTitle = "Operating Cash Flow"
    let maintenanceCapitalExpenditureTitle = "Maintenance Capital Expenditures"
    let futureGrowthRateTitle = "Future Growth Rate"
    let desiredRateOfReturnTitle = "Desired Rate of Return"
    let numOfYearsTitle = "Number of Years"
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 20) {
                        EntryField(title: operatingCashFlowTitle, value: $ivcModel.operatingCashFlow) {
                            ivcModel.currentEntryType = .CASH
                            ivcModel.currentValue = .OCF
                            isEditing = true
                        }
                        EntryField(title: maintenanceCapitalExpenditureTitle, value: $ivcModel.maintenanceCapitalExpenditure) {
                            ivcModel.currentEntryType = .CASH
                            ivcModel.currentValue = .MCE
                            isEditing = true
                        }
                        EntryField(title: futureGrowthRateTitle, value: $ivcModel.futureGrowthRate) {
                            ivcModel.currentEntryType = .PERCENT
                            ivcModel.currentValue = .FGR
                            isEditing = true
                        }
                        EntryField(title: desiredRateOfReturnTitle, value: $ivcModel.desiredRateOfReturn) {
                            ivcModel.currentEntryType = .PERCENT
                            ivcModel.currentValue = .DROR
                            isEditing = true
                        }
                        EntryField(title: numOfYearsTitle, value: $ivcModel.numOfYears) {
                            ivcModel.currentEntryType = .NUMBER
                            ivcModel.currentValue = .YEARS
                            isEditing = true
                        }
                    
                        if ivcModel.discount.count > 0 {
                            Text("$\(ivcModel.intrinsicValue)")
                                .foregroundColor(.clear)
                                .padding()
                                .font(Font.system(size: 32, weight: .semibold, design: .monospaced))
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing)
                                        .mask(
                                            Text("$\(ivcModel.intrinsicValue)")
                                                .padding()
                                                .font(Font.system(size: 32, weight: .semibold, design: .monospaced))
                                        )
                                )
                        }
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                }
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                    VStack {
                        Button(action: {
                            ivcModel.calcResult()
                            haptics.impactOccurred()
                        }) {
                            Text("Calculate")
                                .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .font(Font.system(size: 17, weight: .semibold, design: .default))
                                .cornerRadius(15, antialiased: true)
                        }
                        .padding()
                    }
                    .background(Color(UIColor.systemBackground)
                        .ignoresSafeArea(.container, edges: .bottom)
                        .shadow(color: Color(UIColor.systemGray3), radius: 10, x: 0.0, y: 0.0)
                    )
                    .frame(maxWidth: .infinity)
                    
                }
            }
            .navigationBarTitle("Intrinsic Value Calculator", displayMode: .automatic)
            .sheet(isPresented: $isEditing) {
                EntryView(ivcModel: ivcModel)
            }
        }
        
    }
    
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .preferredColorScheme(.light)
        }
    }
}
