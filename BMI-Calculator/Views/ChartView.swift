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
    
    @FetchRequest(entity: Bmi.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Bmi.date, ascending: true)]) var bmiData: FetchedResults<Bmi>
    
    var body: some View {
        if bmiData.isEmpty {
            VStack {
                Text("No BMI information found.")
                    .foregroundColor(Color.TextColor)
                Text("Please enter BMI.")
                    .foregroundColor(Color.TextColor)
            }
            .padding()
        } else {
            VStack {
                LineView(data: bmiData.map { Double($0.weight) }, title: "Weight Data", legend: "Weight Graph")
                                    .padding()
                BarChartView(data: ChartData(points: bmiData.map { Double($0.bmiResult) }), title: "BMI Data", legend: "BMI Graph")
                    .padding()
            }
        }
    }
}

//#Preview {
//    ChartView(currentTab: .constant(1))
//}
