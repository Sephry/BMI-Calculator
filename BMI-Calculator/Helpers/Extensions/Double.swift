//
//  DoubleRemoveTrailingZero.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 30.12.2023.
//

import Foundation
import SwiftUI

extension Double {
    func removeTrailingZeros() -> String {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 16 // veya istediğiniz başka bir hassasiyet
            formatter.minimumIntegerDigits = 1
            formatter.numberStyle = .decimal

            let formattedValue = formatter.string(from: NSNumber(value: self)) ?? ""
            return formattedValue
    }
}
