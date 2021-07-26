
import SwiftUI

struct HomeView: View {
    
    @StateObject var ivcModel = IvcModel()
    @State var isEditing: Bool = false
    
    let haptics = UIImpactFeedbackGenerator()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                HStack(alignment: .center, spacing: 16) {
                    EntryCard(title: ivcModel.operatingCashFlowTitle, type: .CASH, value: $ivcModel.operatingCashFlow) {
                        haptics.impactOccurred()
                        ivcModel.currentEntryType = .CASH
                        ivcModel.currentValue = .OCF
                        isEditing = true
                    }
                    EntryCard(title: ivcModel.maintenanceCapitalExpendituresTitle, type: .CASH, value: $ivcModel.maintenanceCapitalExpenditure) {
                        haptics.impactOccurred()
                        ivcModel.currentEntryType = .CASH
                        ivcModel.currentValue = .MCE
                        isEditing = true
                    }
                }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                
                HStack(alignment: .center, spacing: 16) {
                    EntryCard(title: ivcModel.futureGrowthRateTitle, type: .PERCENT, value: $ivcModel.futureGrowthRate) {
                        haptics.impactOccurred()
                        ivcModel.currentEntryType = .PERCENT
                        ivcModel.currentValue = .FGR
                        isEditing = true
                    }
                    EntryCard(title: ivcModel.desiredRateOfReturnTitle, type: .PERCENT, value: $ivcModel.desiredRateOfReturn) {
                        haptics.impactOccurred()
                        ivcModel.currentEntryType = .PERCENT
                        ivcModel.currentValue = .DROR
                        isEditing = true
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                HStack(alignment: .center, spacing: 16) {
                    EntryCard(title: ivcModel.numOfYearsTitle, type: .NUMBER, value: $ivcModel.numOfYears) {
                        haptics.impactOccurred()
                        ivcModel.currentEntryType = .NUMBER
                        ivcModel.currentValue = .YEARS
                        isEditing = true
                    }
                    EntryCard(title: ivcModel.outstandingSharesTitle, type: .NUMBER, value: $ivcModel.outstandingShares) {
                        haptics.impactOccurred()
                        ivcModel.currentEntryType = .NUMBER
                        ivcModel.currentValue = .OS
                        isEditing = true
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                Spacer()
                
                NavigationLink(destination: ResultView(ivcModel: ivcModel)) {
                    Text("Calculate")
                        .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                        .background(ivcModel.allowCalculation() ? Color.green : Color(UIColor.systemGray3))
                        .foregroundColor(.white)
                        .font(Font.system(size: 17, weight: .semibold, design: .default))
                        .cornerRadius(16, antialiased: true)
                }
                .disabled(!ivcModel.allowCalculation())
                .padding()
            }
            .navigationBarTitle("Lemons", displayMode: .automatic)
        }
        .sheet(isPresented: $isEditing) {
            KeyPadView(ivcModel: ivcModel)
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
