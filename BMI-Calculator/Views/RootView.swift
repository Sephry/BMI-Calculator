//
//  RootView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct RootView: View {
    @State var showOnboarding: Bool = UserDefaults.standard.bool(forKey: "isFirstTimeLaunch")

//    @State var showOnboarding: Bool = false
    @AppStorage("username") var userName: String = ""
    
    
    var body: some View {
        if showOnboarding {
            OnboardingRootView(userName: $userName, showOnboarding: $showOnboarding)
        } else {
            TabsView(userName: $userName)
        }
    }
}

#Preview {
    RootView()
}
