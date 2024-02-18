//
//  SheetView.swift
//  BMI-Calculator
//
//  Created by Alperen Aydın on 26.12.2023.
//

import SwiftUI



struct SheetView: View {
    @Binding var currentTab: Int
    var bmiData: Bmi?
    var onDelete: (() -> Void)?
    @State private var isDeleted: Bool = false
    @Environment(\.presentationMode) var presentationMode


    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.PrimaryColor, Color.SecondaryColor]), startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 40) {
                if let bmiData = bmiData {
                    if bmiData.bmiResult > 40 {
                        //                        red
                        Circle()
                            .stroke(lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.red)
                            .overlay {
                                Text("\(bmiData.bmiResult.removeTrailingZeros())")
                                    .foregroundColor(Color.TextColor)
                            }
                    } else if bmiData.bmiResult > 25 {
                        //                        orange
                        Circle()
                            .stroke(lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.orange)
                            .overlay {
                                Text("\(bmiData.bmiResult.removeTrailingZeros())")
                                    .foregroundColor(Color.TextColor)
                            }
                    } else if bmiData.bmiResult > 18.5 {
                        //                        green
                        Circle()
                            .stroke(lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.green)
                            .overlay {
                                Text("\(bmiData.bmiResult.removeTrailingZeros())")
                                    .foregroundColor(Color.TextColor)
                            }
                    } else {
                        //                        yellow
                        Circle()
                            .stroke(lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.yellow)
                            .overlay {
                                Text("\(bmiData.bmiResult.removeTrailingZeros())")
                                    .foregroundColor(Color.TextColor)
                                
                            }
                    }
                    
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.blue)
                            .overlay(
                                VStack {
                                    Text("Age")
                                        .foregroundColor(Color.TextColor)
                                    Text("\(bmiData.age)")
                                        .foregroundColor(Color.TextColor)
                                }
                            )
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.green)
                            .overlay(
                                VStack {
                                    Text("Weight (\(bmiData.kgOrlbs ? "Kg" : "lb"))")
                                        .foregroundColor(Color.TextColor)
                                    Text("\(bmiData.weight.removeTrailingZeros())")
                                        .foregroundColor(Color.TextColor)
                                    
                                }
                            )
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.orange)
                            .overlay(
                                VStack {
                                    Text("Height (\(bmiData.cmOrMetre ? "Cm" : "Inches"))")
                                        .foregroundColor(Color.TextColor)
                                    Text("\(bmiData.height.removeTrailingZeros())")
                                        .foregroundColor(Color.TextColor)
                                }
                            )
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 20)
                    
                    
                    VStack{
                        HStack {
                            Circle()
                                .foregroundColor(.yellow)
                                .frame(width: 20, height: 20)
                            Text("Underweight")
                            Spacer()
                            Text("≤ 18.4")
                        }
                        
                        HStack {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 20, height: 20)
                            Text("Normal")
                            Spacer()
                            Text("18.5 - 24.9")
                        }
                        
                        HStack {
                            Circle()
                                .foregroundColor(.orange)
                                .frame(width: 20, height: 20)
                            Text("Overweight")
                            Spacer()
                            Text("25.0 - 39.9")
                        }
                        
                        HStack {
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 20, height: 20)
                            Text("Obese")
                            Spacer()
                            Text("≥ 40.0")
                        }
                        
                        Button(action: {
                            onDelete?() // Silme işlemini gerçekleştir
                            isDeleted = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                // Bildirim gösterildikten sonra BMIView sayfasına yönlendir
                                isDeleted = false // Bildirim gösterildiğinden emin olmak için isDeleted'i sıfırla
                                currentTab = 5 // BMIView sayfasına yönlendir
                                presentationMode.wrappedValue.dismiss() // Sheet'i kapat
                            }
                        }) {
                            Text("Sil")
                                .foregroundColor(.red)
                        }



                    }
                    .padding(.horizontal, 35)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.BackgroundColor)
                            .shadow(radius: 20)
                            .frame(width: .infinity, height: 150)
                            .padding()
                    )
                    
                    
                } else {
                    Text("Hata: BMI verisi eksik")
                }
                
            }
        }
        .ignoresSafeArea(.all)
    }
}
