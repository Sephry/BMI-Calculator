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
    @State private var kgOrLbs: String = "Kg"
    @State private var cmOrmetre: String = "Cm"
    @State private var age: Int16 = 0
    @State private var gender = true
    
    @State private var showAlert = false
    @State private var alertMessage = ""

    let optionsWeight = ["Kg","Lbs"]
    let optionsHeight = ["Cm", "Inc"]
    let userName: String
    
    var body: some View {
        
        VStack {
            VStack {
                VStack{
                    Text("Hi... \(userName)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.TextColor)
                        .font(.largeTitle)
                        .cornerRadius(20)
                        .padding(.leading, 40)
                        .padding(.all, 10)
                }
                .background(
                    Color.BackgroundColor
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
                                Circle().fill(gender ? Color.PrimaryColor : Color.PrimaryColor.opacity(0.35))
                            }
                            .onTapGesture {
                                gender = true
                            }
                        Image("woman")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .padding(20)
                            .background{
                                Circle().fill(!gender ? Color.PrimaryColor : Color.PrimaryColor.opacity(0.35))
                            }
                            .onTapGesture {
                                gender = false
                            }
                    }
                    
                    GenderSelectionView(isSelectedGenderMan: $gender)
                    
                }
                
                Section {
                    HStack {
                        Text("Age")
                            .padding()
                            .foregroundColor(Color.TextColor)
                        TextField("Age", value: $age, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .SecondaryColor, backgroundColor: .PrimaryColor))
                            .foregroundColor(Color.BackgroundColor)
                            .padding()
                    }
                    HStack {
                        Text("Height")
                            .padding()
                            .foregroundColor(Color.TextColor)
                        TextField("Height", value: $height, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .SecondaryColor, backgroundColor: .PrimaryColor))
                            .foregroundColor(Color.BackgroundColor)
                            .padding(.leading)
                        
                        Menu {
                            Picker(selection: $cmOrmetre) {
                                ForEach(optionsHeight, id:\.self) { value in
                                    Text(value)
                                        .tag(value)
                                }
                            } label: {}
                        } label: {
                            
                            HStack {
                                Text(cmOrmetre)
                                Image(systemName: "chevron.up.chevron.down")
                            }
                            .foregroundColor(Color.TextColor)
                            .frame(width: 70)
                        }
                    }
                    HStack {
                        Text("Weight")
                            .padding()
                            .foregroundColor(Color.TextColor)

                        TextField("Wight", value: $weight, format: .number)
                            .keyboardType(.numberPad)
                            .textFieldStyle(CustomTextFieldStyle(borderColor: .SecondaryColor, backgroundColor: .PrimaryColor))
                            .foregroundColor(Color.BackgroundColor)
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
                            .foregroundColor(Color.BackgroundColor)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.PrimaryColor)
                            .cornerRadius(10)
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Uyarı"),
                                    message: Text(alertMessage),
//                                    dismissButton: .default(Text("Tamam")),
                                    dismissButton: .default(Text("OK")) {
                                                                        // Call dismiss() here as well
                                                                        dismiss()
                                                                    }
                                )
                            }
                        Spacer()
                    }
                }
                .listStyle(GroupedListStyle())
                .background(Color.BackgroundColor)
                
            }
        }
    }
    
    func validateFields() {
        if isAddButtonDisabled {
            alertMessage = "Lütfen tüm alanları doldurun."
            showAlert = true
        } else {
            AddBmi()
        }
    }
    
    var  isAddButtonDisabled: Bool {
        return height == .zero || weight == .zero || age == .zero
    }
    
    func AddBmi() {
        if isAddButtonDisabled {
                   alertMessage = "Lütfen tüm alanları doldurun."
                   showAlert = true
        } else {
            let kgOrlbs = kgOrLbs == "Kg" ? true : false
            let cmOrMetre = cmOrmetre == "Cm" ? true : false
            DataController().addBmi(gender: gender, weight: weight, height: height, age: age, cmOrInches: cmOrMetre, kgOrlbs: kgOrlbs, context: managedObjContext)
            showAlert = true
            alertMessage = "Your BMI data has been saved."
            currentTab = 5
            dismiss()
        }
    }
}

#Preview {
    EnterBMIView(currentTab: .constant(1), userName: "ismail")
}
