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
                    if bmiData.bmiResult > 40 {
//                        red
                        Circle()
                            .stroke(lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.red)
                            .overlay {
                                Text("\(bmiData.bmiResult.removeTrailingZeros())")
                            }
                    } else if bmiData.bmiResult > 25 {
//                        orange
                        Circle()
                            .stroke(lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.orange)
                            .overlay {
                                Text("\(bmiData.bmiResult.removeTrailingZeros())")
                            }
                    } else if bmiData.bmiResult > 18.5 {
//                        green
                        Circle()
                            .stroke(lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.green)
                            .overlay {
                                Text("\(bmiData.bmiResult.removeTrailingZeros())")
                            }
                    } else {
//                        yellow
                        Circle()
                            .stroke(lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.yellow)
                            .overlay {
                                Text("\(bmiData.bmiResult.removeTrailingZeros())")
                            }
                    }
                    
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.blue)
                            .overlay(
                                VStack {
                                    Text("Age")
                                        .foregroundColor(.white)
                                    Text("\(bmiData.age)")
                                }
                            )
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.green)
                            .overlay(
                                VStack {
                                    Text("Weight (\(bmiData.kgOrlbs ? "Kg" : "lb"))")
                                        .foregroundColor(.white)
                                    Text("\(bmiData.weight.removeTrailingZeros())")
                                }
                            )
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.orange)
                            .overlay(
                                VStack {
                                    Text("Height (\(bmiData.cmOrMetre ? "Cm" : "Inches"))")
                                        .foregroundColor(.white)
                                    Text("\(bmiData.height.removeTrailingZeros())")
                                }
                            )
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                    
                    VStack{
                        Text("Underweight")
                        Text("Normal")

                        Text("Overweight")

                        Text("Obese")

                    }
                } else {
                    Text("Hata: BMI verisi eksik")
                }
                
            }
        }
        .ignoresSafeArea(.all)
    }
}


#Preview {
    SheetView()
}
