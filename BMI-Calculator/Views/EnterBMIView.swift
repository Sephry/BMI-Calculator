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
    @State private var weight: Double = 0
    @State private var kgOrLbs: String = "KG"
    @State private var age = 0
    @State private var gender = true
    @State private var result = 0
    let options = ["KG","LBS"]
    
    let userName: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            VStack {
                VStack{
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "list.bullet")
                                .imageScale(.large)
                                .foregroundColor(Color.TextColor)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "bell.fill")
                                .imageScale(.large)
                                .foregroundColor(Color.TextColor)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    Text("Hi ...\(userName)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.TextColor)
                        .font(.largeTitle)
                        .cornerRadius(20)
                        .padding(.leading, 40)
                        .padding(.all, 10)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.SecondaryColor, Color.PrimaryColor]), startPoint: .top, endPoint: .bottom)
                )
            }
            
            Form {
                VStack {
                    HStack{
                        Image("man")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .padding(20)
                            .background{
                                Circle().fill(Color.PrimaryColor)
                            }
                        Image("woman")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .padding(20)
                            .background{
                                Circle().fill(Color.PrimaryColor)
                            }
                    }
                    .padding(.top)
                    
                    Toggle("Male", isOn: $gender)
                    
                }
                
                Section {
                    HStack {
                        Text("Age")
                            .padding()
                        TextField("Yaş", value: $age, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .SecondaryColor, backgroundColor: .PrimaryColor))
                            .foregroundColor(Color.TextColor)
                            .padding()
                    }
                    HStack {
                        Text("Boy")
                            .padding()
                        TextField("Boy", value: $height, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .SecondaryColor, backgroundColor: .PrimaryColor))
                            .foregroundColor(Color.TextColor)
                            .padding()
                    }
                    HStack {
                        Text("Kilo")
                            .padding()
                        TextField("Kilo", value: $weight, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .SecondaryColor, backgroundColor: .PrimaryColor))
                            .foregroundColor(Color.TextColor)
                            .padding(.leading)
                        
                        Menu {
                            Picker(selection: $kgOrLbs) {
                                ForEach(options, id:\.self) { value in
                                    Text(value)
                                        .tag(value)
                                }
                            } label: {}
                        } label: {
                            
                            HStack {
                                Text(kgOrLbs)
                                Image(systemName: "chevron.up.chevron.down")
                            }
                            .foregroundColor(Color.TextColor)
                            .frame(width: 70)
                        }
                    }
                    
                    
                    HStack {
                        Spacer()
                        Button("Submit") {
                            DataController().addBmi(age: 22, weight: 75, height: 175, gender: true, context: managedObjContext)
                            dismiss()
                        }
                        .foregroundColor(Color.TextColor)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.PrimaryColor)
                        .cornerRadius(10)
                        Spacer()
                    }
                }
                .listStyle(GroupedListStyle())
                .background(Color.BackgroundColor)
                    
            }
        }
    }
}

#Preview {
    EnterBMIView(currentTab: .constant(1), userName: "ismail")
}
