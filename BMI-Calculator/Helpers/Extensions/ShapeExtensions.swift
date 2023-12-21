//
//  ShapeExtensions.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import Foundation
import SwiftUI

extension Shape{
    func style<S: ShapeStyle, F: ShapeStyle>(
        withStroke strokeContent: S,
        lineWidth: CGFloat = 1,
        fill fillContent: F
    ) -> some View {
        self.stroke(strokeContent, lineWidth: lineWidth)
            .background(fill(fillContent))
    }
}
