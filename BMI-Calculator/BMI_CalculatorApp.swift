//
//  BMI_CalculatorApp.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

@main
struct BMI_CalculatorApp: App {
    
    @AppStorage("isDarkModeEnabled") var isDarkModeEnabled: Bool = false
    @StateObject private var dataController = DataController()
    var defaults = UserDefaults.standard

    init(){
        if defaults.value(forKey: "isFirstTimeLaunch") == nil {
            defaults.set(true, forKey: "isFirstTimeLaunch")
        }
    }
    var body: some Scene {
        
        
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
        }
    }
}
