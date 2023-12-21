//
//  OnboardingRootView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct OnboardingRootView: View {

    @Binding var userName: String
    
    var body: some View {
        VStack{
            TextField("Enter your Name", text: $userName)
            Button{
                userName = "Alperen Sik"
                UserDefaults.standard.set(false, forKey: "isFirstTimeLaunch")
            }label: {
                Text("Press")
            }
        }
    }
}

#Preview {
    OnboardingRootView(userName: .constant("ismail"))
}
