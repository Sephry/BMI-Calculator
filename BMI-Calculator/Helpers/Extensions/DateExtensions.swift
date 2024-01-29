//
//  DateExtensions.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 26.01.2024.
//

import Foundation
import SwiftUI
extension Date {
        func formatDate() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("hh,mm")
            return dateFormatter.string(from: self)
        }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
