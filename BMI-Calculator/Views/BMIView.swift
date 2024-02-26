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
    @FetchRequest(sortDescriptors: [SortDescriptor(\.weight, order: .reverse)]) var targetData: FetchedResults<TargetWeight>
    
    @State private var result: Double = 0.0
    @State var isSheetPresented:Bool = false
    @State var selectedBmi: Bmi? = nil
    
    let userName: String
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                Text("Hi... \(userName)")
                    .foregroundColor(Color.PrimaryColor)
                    .font(.largeTitle)
                    .padding(.horizontal)
                
                if bmiData.isEmpty {
                    VStack {
                        Text(LocalizedStringKey("No BMI information found."))
                            .foregroundColor(Color.TextColor)
                        Text(LocalizedStringKey("Please enter BMI."))
                            .foregroundColor(Color.TextColor)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(targetData) { targetData in
                            HStack {
                                Text("Hedefinz : ")
                                Text("\(targetData.weight.removeTrailingZeros())")
                            }
                        }

                        ForEach(bmiData) { bmiData in
                            if let bmiData = bmiData as? Bmi {
                                NavigationLink(destination: SheetView(currentTab: $currentTab, bmiData: bmiData, onDelete: {
                                    managedObjContext.delete(bmiData)
                                    do {
                                        try managedObjContext.save()
                                    } catch {
                                        print("Hata: Veri silinemedi - \(error)")
                                    }
                                }), isActive: Binding(
                                    get: { selectedBmi == bmiData },
                                    set: { _ in selectedBmi = nil }
                                )) {
                                    HStack {
                                        VStack {
                                            Text("\(bmiData.bmiResult.removeTrailingZeros())")
                                        }
                                    }
                                }
                            }
                        }

                    }
                }
            }
        }
    }
}




#Preview {
    BMIView(currentTab: .constant(1), userName: "ismail")
}
//    }
