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
    
    func addBmi(age: Int16, weight: Int16, height: Int16, gender: Bool, context: NSManagedObjectContext) {
        let bmi = Bmi(context: context)
        bmi.id = UUID()
        bmi.date = Date()
        bmi.age = age
        bmi.weight = weight
        bmi.height = height
        bmi.gender = gender
        
        save(context: context)
    }
    
    func editBmi(bmi: Bmi, age: Int16, weight: Int16, height: Int16, gender: Bool, context: NSManagedObjectContext) {
        bmi.date = Date()
        bmi.age = age
        bmi.gender = gender
        bmi.height = height
        bmi.weight = weight
        
        save(context: context)
    }
    
    
    
}
