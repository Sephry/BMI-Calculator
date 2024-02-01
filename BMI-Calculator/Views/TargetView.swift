//
//  TargetView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct TargetView: View {
    @Binding var currentTab: Int
    
    var body: some View {
        VStack {
            Image("archery")
                .resizable()
                .scaledToFit()
                .padding(20)
        }
    }
}

#Preview {
    TargetView(currentTab: .constant(1))
}
