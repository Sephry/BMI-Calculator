//
//  TabbedItems.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import Foundation
enum TabbedItems: Int, CaseIterable{
    case bmi
    case target
    case enterBmi
    case chart
    case profile
    
    
    var iconName:String{
        switch self {
        case .bmi:
            "ruler.fill"
        case .target:
            "target"
        case .enterBmi:
            "plus.circle.fill"
        case .chart:
            "chart.line.uptrend.xyaxis"
        case .profile:
            "person"
        }
    }
    
    var iconText:String{
        switch self {
        case .bmi:
            "BMİ"
        case .target:
            "Target"
        case .enterBmi:
            ""
        case .chart:
            "Chart"
        case .profile:
            "Profile"
        }
    }
}
