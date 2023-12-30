//
//  DataController.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 24.12.2023.
//

import Foundation
import CoreData


class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "BmiModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved !!!")
        }catch {
            print("We colud not save the data....")
        }
    }
    
    func addBmi(gender: Bool, weight: Double, height: Double, age: Int16, context: NSManagedObjectContext) {
        let bmi = Bmi(context: context)
        bmi.id = UUID()
        bmi.date = Date()
        bmi.gender = gender
        bmi.age = age
        
        let formattedWeight = Double(String(format: "%.2f", weight)) ?? 0.0
        bmi.weight = formattedWeight
        let formattedHeight = Double(String(format: "%.2f", height)) ?? 0.0
        bmi.height = formattedHeight
        
        let resultBmi = (weight / ((height / 10) * (height / 10))) * 100
        let formattedDouble = Double(String(format: "%.2f", resultBmi)) ?? 0.0
        bmi.bmiResult = formattedDouble
        
        save(context: context)
    }
    
    func editBmi(bmi: Bmi, gender: Bool, weight: Double, height: Double, age: Int16, context: NSManagedObjectContext) {
        bmi.date = Date()
        bmi.gender = gender
        bmi.age = age
        
        let formattedWeight = Double(String(format: "%.2f", weight)) ?? 0.0
        bmi.weight = formattedWeight
        let formattedHeight = Double(String(format: "%.2f", height)) ?? 0.0
        bmi.height = formattedHeight
        
        let resultBmi = (weight / ((height / 10) * (height / 10))) * 100
        let formattedResultBMI = Double(String(format: "%.2f", resultBmi)) ?? 0.0
        bmi.bmiResult = formattedResultBMI
        
        save(context: context)
    }
    
}
