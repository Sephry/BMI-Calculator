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
    @State private var isToggleOn = false
    @State private var selectedOption: ToggleOption = .option1
    @State private var userInput: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var selectedNumber = 30
    @State  var selectedNumber2 = 20


    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green, .teal]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            HStack{
                
                Button(action: {
                                // Sağ üst köşedeki butona tıklandığında yapılacak işlemler
                                print("Sağ üst köşedeki butona tıklandı")
                            }) {
                                Image(systemName: "bell.fill")
                                    .foregroundColor(.white)
                                    .imageScale(.large)
                                    .padding()
                            }
//                        .position(x:UIScreen.main.bounds.width - 50 , y: 50)
                
                Button(action: {
                                // Sağ üst köşedeki butona tıklandığında yapılacak işlemler
                                print("Sağ üst köşedeki butona tıklandı")
                            }) {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(.white)
                                    .imageScale(.large)
                                    .padding()
                            }
//                        .position(x:50 , y: -335)
                
                
            }
            VStack{
                Text("Hi ...")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                
                
                Rectangle()
                    .fill(Color.white)
                    .frame(height: UIScreen.main.bounds.height )
                    .cornerRadius(20)
                    .overlay(
                        VStack{
                            HStack{
                                
                                Button("buton1"){
                                    print("buton1")
                                }.foregroundColor(.black)
                                    .padding()
                                Button("buton2"){
                                    print("buton2")
                                    
                                }
                                .foregroundColor(.blue)
                                .padding()
                               
                                
                            }
                            
                            Toggle(selectedOption.rawValue, isOn: Binding(get: {self.selectedOption == .option2}, set: {newValue in self.selectedOption = newValue ? .option2 : .option1}
                                                                         ))
                            .frame(width: 100, height: 100)
                            
                            .foregroundColor(.black)
                            .padding()
                            
                            
                            HStack{
                                Section{
                                    Text("asd")
                                        .padding()
                                    TextField("Yaş", text: $userInput)
                                        .textFieldStyle(CustomTextFieldStyle(borderColor: .white, backgroundColor: .cyan))
                                        .foregroundColor(.black)
                                        .cornerRadius(20)
                                        .padding()
                                }
                               
                            }
                            
                            HStack{
                                Section{
                                    Text("Weight")
                                    TextField("Weight", text: $userInput)
                                        .textFieldStyle(CustomTextFieldStyle(borderColor: .white, backgroundColor: .cyan))
                                        .foregroundColor(.black)
                                        .cornerRadius(20)
                                        .padding()
                                    
                                    Picker("KG", selection: $selectedNumber){
                                        ForEach(30 ..< 151){
                                            number in Text("\(number)")
                                        }
                                    }
                                }
                                
                            }
                            .padding()
                            HStack{
                                Section{
                                    Text("Height")
                                    TextField("Yaş", text: $userInput)
                                        .textFieldStyle(CustomTextFieldStyle(borderColor: .white, backgroundColor: .cyan))
                                        .foregroundColor(.black)
                                        .cornerRadius(20)
                                    Picker("KG", selection: $selectedNumber2){
                                        ForEach(30 ..< 151){
                                            number in Text("\(number)")
                                        }
                                    }
                                }
                               
                            }
                            .padding()
                            
                            Button("Calculate Your BMI"){
                                
                            }
                            Spacer()
                        }
                       
                
                    )
                
                
            }.position(x:UIScreen.main.bounds.width / 2,y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 3))
        
            
                    
                
            
     
        }
    }
}

#Preview {
    BMIView(currentTab: .constant(1))
}
