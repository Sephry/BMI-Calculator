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
    
    //List içindeki elemanların rengini değiştirmek için .listRowBackground(Color.cyan) gibi kullanabilirsiniz


    var body: some View {
        VStack{
            
            List {
                                
                ForEach(bmiData) { bmiData in
                    NavigationLink (destination: Text("\(bmiData.bmiResult)")){
                        HStack{
                            VStack{
                                Text("\(bmiData.bmiResult)")
                            }
                        }
                    }
                }
            }
            
            .scrollContentBackground(.hidden)

     
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

#Preview {
    BMIView(currentTab: .constant(1))
    
}
