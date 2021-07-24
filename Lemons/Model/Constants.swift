//
//  Constants.swift
//  Lemons
//
//  Created by Michael Koohang on 7/23/21.
//

import Foundation
import SwiftUI

struct Colors {
    static let yellow = Color(UIColor(red: 255/255, green: 243/255, blue: 180/255, alpha: 1))
}

enum EntryType {
    case CASH
    case PERCENT
    case NUMBER
}

enum IvcValues {
    case OCF
    case MCE
    case FGR
    case DROR
    case YEARS
    case OS
}
