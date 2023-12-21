//
//  RootView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct RootView: View {
    @State var showOnboarding: Bool = UserDefaults.standard.bool(forKey: "isFirstTimeLaunch")
    @AppStorage("username") var userName: String = ""
    
    var body: some View {
        if showOnboarding {
            OnboardingRootView(userName: $userName)
        } else {
            TabsView()
        }
    }
}

#Preview {
    RootView()
}
