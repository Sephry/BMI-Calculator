//
//  TargetView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 21.12.2023.
//

import SwiftUI

struct TargetView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @Binding var currentTab: Int

    @State private var weight: Double = 0
    @State private var kgOrLbs: String = "Kg"
    
    @State private var showAlert = false
    @State private var alertMessage = ""

    let optionsWeight = ["Kg","Lbs"]
    
    let userName: String

    var body: some View {
        VStack {
            VStack {
                VStack{
                    Text("Hi... \(userName)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.TextColor)
                        .font(.largeTitle)
                        .padding(.leading, 40)
                        .padding(.all, 10)
                    
                    Text("Hedefini Girmek İster Misin ?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                        .padding(.leading, 40)
                        .padding(.all, 10)

                }
                .background(
                    Color.PrimaryColor
                )
            }
            
            Form {
                Image("archery")
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Text("Weight")
                        .padding()
                    TextField("Wight", value: $weight, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(CustomTextFieldStyle(borderColor: .SecondaryColor, backgroundColor: .PrimaryColor))
                        .foregroundColor(Color.TextColor)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                        }
                        .padding(.leading)
                    
                    
                    Menu {
                        Picker(selection: $kgOrLbs) {
                            ForEach(optionsWeight, id:\.self) { value in
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
                    Button("Submit", action: validateFields)
                    //                            .disabled(isAddButtonDisabled)
                        .foregroundColor(Color.TextColor)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.PrimaryColor)
                        .cornerRadius(10)
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Uyarı"),
                                message: Text(alertMessage),
                                dismissButton: .default(Text("Tamam"))
                            )
                        }
                    Spacer()
                }
            }
        }
    }
    
    func validateFields() {
        if weight == .zero {
            alertMessage = "Lütfen kilonuzu giriniz."
            showAlert = true
        } else {
            AddTarget()
        }
    }
    
    func AddTarget() {
        let kgOrlbs = kgOrLbs == "Kg" ? true : false
        TargetDataController().addTarget(weight: weight, kgOrlbs: kgOrlbs, name: userName, context: managedObjContext)
        dismiss()
    }
    
}

#Preview {
    TargetView(currentTab: .constant(1), userName: "ismail")
}
