//
//  EnterBMIView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct EnterBMIView: View {
    @Binding var currentTab: Int
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var height: Double = 0
    @State private var weight = 0
    @State private var age = 0
    @State private var gender = "Male"
    @State private var result = 0
    
    let userName: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            VStack {
                VStack{
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "list.bullet")
                                .imageScale(.large)
                                .padding()
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "bell.fill")
                                .imageScale(.large)
                                .padding()
                        }
                    }
                    Text("Hi ...\(userName)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .cornerRadius(20)
                        .padding(.leading, 40)
                        .padding(.all, 20)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.green, .teal]), startPoint: .top, endPoint: .bottom)
                )
            }
            
            Form {
                
                Section {
                    HStack {
                        Text("Age")
                            .padding()
                        TextField("Yaş", value: $age, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .black, backgroundColor: .white))
                            .foregroundColor(.black)
                            .padding()
                    }
                    HStack {
                        Text("Boy")
                            .padding()
                        TextField("Boy", value: $height, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .black, backgroundColor: .white))
                            .foregroundColor(.black)
                            .padding()
                    }
                    HStack {
                        Text("Kilo")
                            .padding()
                        TextField("Kilo", value: $weight, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .black, backgroundColor: .white))
                        
                            .foregroundColor(.black)
                            .padding(.leading)
                        
                        Picker("", selection: $weight){
                            ForEach(30 ..< 151){
                                number in Text("\(number)")
                            }
                        }
                        .frame(width: 70)
                        
                   
                    }
                    
                    HStack {
                        Spacer()
                        Button("Submit") {
                            DataController().addBmi(age: 22, weight: 75, height: 175, gender: "Male", context: managedObjContext)
                            dismiss()
                        }
                        Spacer()
                    }
                }
            }
            
            
        }
    }
}

#Preview {
    EnterBMIView(currentTab: .constant(1), userName: "ismail")
}
