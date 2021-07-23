
import Foundation

extension String {
    var isNumber: Bool {
        return NumberFormatter().number(from: self) != nil
    }
}
