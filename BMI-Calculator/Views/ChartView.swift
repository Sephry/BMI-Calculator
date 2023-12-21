//
//  ChartView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct ChartView: View {
    @Binding var currentTab: Int
    
    var body: some View {
        Image(systemName: "chart.line.uptrend.xyaxis")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        
    }
}

#Preview {
    ChartView(currentTab: .constant(1))
}
