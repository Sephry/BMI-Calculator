//
//  EnterBMIView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct EnterBMIView: View {
    @Binding var currentTab: Int
    
    var body: some View {
        Text("Hello, World!Enter BMI")
    }
}

#Preview {
    EnterBMIView(currentTab: .constant(1))
}
