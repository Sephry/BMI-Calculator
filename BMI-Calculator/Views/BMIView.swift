//
//  BMIView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI

enum ToggleOption: String {
    case option1 = "Erkek"
    case option2 = "Kadın"
}

struct BMIView: View {
    @Binding var currentTab: Int

    var body: some View {
        VStack{
            
            
     
        }
    }
}

#Preview {
    BMIView(currentTab: .constant(1))
}
