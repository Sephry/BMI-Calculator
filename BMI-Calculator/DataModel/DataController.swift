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
        bmi.weight = weight
        bmi.height = height
        bmi.age = age
        
        let resultBmi = weight / ((height / 10) * (height / 10))
        bmi.bmiResult = resultBmi
        
        save(context: context)
    }
    
    func editBmi(bmi: Bmi, gender: Bool, weight: Double, height: Double, age: Int16, context: NSManagedObjectContext) {
        bmi.date = Date()
        bmi.gender = gender
        bmi.weight = weight
        bmi.height = height
        bmi.age = age
        
        let resultBmi = weight / ((height / 10) * (height / 10))
        bmi.bmiResult = resultBmi
        
        save(context: context)
    }
    
}
