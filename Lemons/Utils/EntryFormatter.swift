
import Foundation

struct EntryFormatter {
    
    private static let currencyFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        f.maximumFractionDigits = 2
        return f
    }()
    
    private static let percentFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .percent
        f.maximumFractionDigits = 2
        return f
    }()
    
    
    static func formatCurrency(val: Double) -> String {
        let num = NSNumber(value: val)
        return currencyFormatter.string(from: num)!
    }
    
    static func formatPercent(val: Double) -> String {
        let num = NSNumber(value: val)
        return percentFormatter.string(from: num)!
    }
    
}
