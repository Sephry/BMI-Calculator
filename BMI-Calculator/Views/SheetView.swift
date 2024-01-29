//
//  SheetView.swift
//  BMI-Calculator
//
//  Created by Alperen Aydın on 26.12.2023.
//

import SwiftUI



struct SheetView: View {
    var bmiData: Bmi?
    
    var body: some View {
        ZStack{
           
                LinearGradient(gradient: Gradient(colors: [Color.SecondaryColor, Color.PrimaryColor]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                if let bmiData = bmiData {
                    Text("Age: \(bmiData.age)")
                    Text("Weight (\(bmiData.kgOrlbs ? "Kg" : "lb")): \(bmiData.weight.removeTrailingZeros())")
                    Text("Height (\(bmiData.cmOrMetre ? "Cm" : "Inches")): \(bmiData.height.removeTrailingZeros())")
                    Text("BMI Result: \(bmiData.bmiResult.removeTrailingZeros())")
                } else {
                    Text("Hata: BMI verisi eksik")
                }
            }
            .padding()
        }
        .ignoresSafeArea(.all)
    }
}


#Preview {
    SheetView()
}
