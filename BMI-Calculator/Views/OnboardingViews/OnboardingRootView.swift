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
        TextField("Enter your Name", text: $userName)
    }
}

#Preview {
    OnboardingRootView(userName: .constant("ismail"))
}
