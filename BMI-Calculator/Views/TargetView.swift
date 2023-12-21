//
//  TargetView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct TargetView: View {
    @Binding var currentTab: String
    
    var body: some View {
        Text("target")
    }
}

#Preview {
    TargetView(currentTab: .constant("Target"))
}
