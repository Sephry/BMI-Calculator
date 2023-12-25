//
//  CustomTextFieldStyle.swift
//  BMI-Calculator
//
//  Created by Alperen Aydın on 22.12.2023.
//

import Foundation
import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    var borderColor: Color = Color.SecondaryColor
    var backgroundColor: Color = Color.BackgroundColor
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 1)
                    .background(backgroundColor)
            )
    }
}
