//
//  BMIView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

struct BMIView: View {
    @Binding var currentTab: String
    
    var body: some View {
        Text("BMI")
    }
}

#Preview {
    BMIView(currentTab: .constant("BMI"))
}
