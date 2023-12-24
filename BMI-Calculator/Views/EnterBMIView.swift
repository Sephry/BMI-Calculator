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
    
    var body: some View {
        Form {
            Section {
                VStack {
                    Text("Height: \(Int(height))")
                    Slider(value: $height, in: 0...250, step: 1)
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

#Preview {
    EnterBMIView(currentTab: .constant(1))
}
