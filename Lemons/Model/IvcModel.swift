
import SwiftUI

class IvcModel: ObservableObject {
    
    let operatingCashFlowTitle = "Operating Cash Flow"
    let maintenanceCapitalExpendituresTitle = "Maintenance Capital Expenditures"
    let futureGrowthRateTitle = "Future Growth Rate"
    let desiredRateOfReturnTitle = "Desired Rate of Return"
    let numOfYearsTitle = "Number of Years"
    let outstandingSharesTitle = "Outstanding Shares"
    
    @Published var operatingCashFlow: Double = 0
    @Published var maintenanceCapitalExpenditure: Double = 0
    @Published var futureGrowthRate: Double = 0
    @Published var desiredRateOfReturn: Double = 0
    @Published var numOfYears: Double = 0
    @Published var outstandingShares: Double = 0

    @Published var result: [Datum] = []
    @Published var discount: [Datum] = []
    @Published var intrinsicValue: Double = 0.0
    @Published var currentEntryType: EntryType = .CASH
    @Published var currentValue: IvcValues = .OCF
    
    func calcResult() {
        discount.removeAll()
        result.removeAll()
        let cashFlow = operatingCashFlow
        let mainCapExp = maintenanceCapitalExpenditure
        let futGrowRate = futureGrowthRate / 100
        let ror = desiredRateOfReturn / 100
        let numYears = Int(numOfYears)
        var cummulative = 0.0
        
        for i in 1...numYears {
            if (i == 1) {
                cummulative = (cashFlow - mainCapExp)
            } else {
                cummulative = cummulative + cummulative * futGrowRate
            }
            discount.append(
                Datum(year: getYear(offset: i), amount: getDiscount(num: cummulative, interest: ror, year: i))
            )
            result.append(
                Datum(year: getYear(offset: i), amount: cummulative)
            )
        }
        
        intrinsicValue = round(discount.reduce(0, { x, y in x + y.amount }) + (discount[discount.count - 1].amount * 10))
    }
    
    func getDiscount(num: Double, interest: Double, year: Int) -> Double {
        return (num / pow((1.0+interest), Double(year)))
    }
    
    func allowCalculation() -> Bool {
        return operatingCashFlow > 0 && maintenanceCapitalExpenditure > 0 && futureGrowthRate > 0 && desiredRateOfReturn > 0 && numOfYears > 0 && outstandingShares > 0
    }
    
    func getYear(offset: Int) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.year, from: Date()) + offset
    }
    
}
