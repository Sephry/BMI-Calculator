//
//  ChartView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    @Binding var currentTab: Int
    
    var body: some View {
        VStack {
            BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550)]), title: "Sales", legend: "Quarterly") // legend is optional

        }
        
    }
}

#Preview {
    ChartView(currentTab: .constant(1))
}
