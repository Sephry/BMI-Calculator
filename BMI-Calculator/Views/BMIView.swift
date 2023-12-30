//
//  BMIView.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 20.12.2023.
//

import SwiftUI
import CoreData

struct BMIView: View {
    @Binding var currentTab: Int
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var bmiData: FetchedResults<Bmi>
    
    @State private var result: Double = 0.0
    @State var isSheetPresented:Bool = false
    @State var selectedBmi: Bmi? = nil
    
    var body: some View {
        
        if bmiData.isEmpty {
            VStack {
                Text("No BMI information found.")
                    .foregroundColor(Color.TextColor)
                Text("Please enter BMI.")
                    .foregroundColor(Color.TextColor)
            }
            .padding()
        } else {
            NavigationStack{
                        List {
                            ForEach(bmiData) { bmiData in
                                NavigationLink(destination: SheetView(bmiData: bmiData), isActive: Binding(
                                    get: { selectedBmi == bmiData },
                                    set: { _ in selectedBmi = nil }
                                )) {
                                    HStack {
                                        VStack {
                                            Text("\(bmiData.bmiResult.removeTrailingZeros())")
                                        }
                                    }
                                }
                            }.onTapGesture {
                                isSheetPresented = true
                            }
                            
                        }
                        .sheet(isPresented: $isSheetPresented) {
                            if let selectedBmi = selectedBmi {
                                SheetView(bmiData: selectedBmi)
                                    .interactiveDismissDisabled()
                            }
                        }
            }
        }
    }
}
        
    

        
//        #Preview {
//            BMIView(currentTab: .constant(1))
//        }
//    }
