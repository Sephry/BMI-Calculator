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
        VStack{
            VStack{
                Rectangle()
                    .fill(Color.red)
                    .frame(height: UIScreen.main.bounds.height )
                    .cornerRadius(20)
                    .overlay(
                        VStack{
                            HStack{
                                
                                Button(action: {}) {
                                                Image(systemName: "person")
                                                    .imageScale(.large)
                                                    .padding()
                                            }
                                Button(action: {}) {
                                                Image(systemName: "person")
                                                    .imageScale(.large)
                                                    .padding()
                                            }
                               
                                
                            }
                            
                            
                            
                            
                            HStack{
                                
                               
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
                
                
            }
            .position(x:UIScreen.main.bounds.width / 2,y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 3))
        
            
                    
                
            
     
        }
    }
}

#Preview {
    BMIView(currentTab: .constant(1))
}
