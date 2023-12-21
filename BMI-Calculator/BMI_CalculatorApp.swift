//
//  BMI_CalculatorApp.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

@main
struct BMI_CalculatorApp: App {
    let persistenceController = PersistenceController.shared
    var defaults = UserDefaults.standard

    init(){
        if defaults.value(forKey: "isFirstTimeLaunch") == nil {
            defaults.set(true, forKey: "isFirstTimeLaunch")
        }
    }
    var body: some Scene {
        
        
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
}
