//
//  InvestmentCalculatorModel.swift
//  Bearish
//
//  Created by Michael Koohang on 7/12/21.
//

import SwiftUI

enum IvcValues {
    case OCF
    case MCE
    case FGR
    case DROR
    case YEARS
}

class IvcModel: ObservableObject {
    
    @Published var operatingCashFlow: Double = 0.0
    @Published var maintenanceCapitalExpenditure: Double = 0.0
    @Published var futureGrowthRate: Double = 0.0
    @Published var desiredRateOfReturn: Double = 0.0
    @Published var numOfYears: Double = 0.0
    
    @Published var result: [Double] = []
    @Published var discount: [Double] = []
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
        var cum = 0.0
        
        for i in 1...numYears {
            if (i == 1) {
                cum = (cashFlow - mainCapExp)
                discount.append(getDiscount(num: cum, interest: ror, year: i))
                result.append(cum)
            } else {
                cum = cum + cum * futGrowRate
                discount.append(getDiscount(num: cum, interest: ror, year: i))
                result.append(cum)
            }
        }
        
        intrinsicValue = round(discount.reduce(0, { x, y in x + y }) + (discount[discount.count - 1] * 10))
    }
    
    func getDiscount(num: Double, interest: Double, year: Int) -> Double {
        return (num / pow((1.0+interest), Double(year)))
    }
    
}
