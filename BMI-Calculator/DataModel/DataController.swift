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
    
    func addBmi(gender: Bool, weight: Double, height: Double, age: Int16, cmOrInches: Bool, kgOrlbs: Bool, context: NSManagedObjectContext) {
        let bmi = Bmi(context: context)
        bmi.id = UUID()
        bmi.date = Date()
        bmi.gender = gender
        bmi.age = age
        bmi.cmOrMetre = cmOrInches
        bmi.kgOrlbs = kgOrlbs
        
        var convertedWeight = weight // Başlangıçta, veri dönüşümü yapmadan ağırlık ve boy uzunluğunu atıyoruz.
        var convertedHeight = height
        
        if !cmOrInches {
            // Eğer inches cinsinden boy verisi geliyorsa, bunu santimetreye çeviriyoruz.
            convertedHeight = height * 2.54 // Bir inç 2.54 santimetre
        }
        
        if !kgOrlbs {
            // Eğer lbs cinsinden ağırlık verisi geliyorsa, bunu kilograma çeviriyoruz.
            convertedWeight = weight * 0.453592 // Bir pound 0.453592 kilogram
        }
        
        bmi.weight = convertedWeight
        bmi.height = convertedHeight
        
        let formattedWeight = Double(String(format: "%.2f", convertedWeight)) ?? 0.0
        bmi.weight = formattedWeight
        let formattedHeight = Double(String(format: "%.2f", convertedHeight)) ?? 0.0
        bmi.height = formattedHeight
        
        let resultBmi = (convertedWeight / ((convertedHeight / 10) * (convertedHeight / 10))) * 100
        let formattedDouble = Double(String(format: "%.2f", resultBmi)) ?? 0.0
        bmi.bmiResult = formattedDouble
        
        save(context: context)
    }
    
    func editBmi(bmi: Bmi, gender: Bool, weight: Double, height: Double, age: Int16, cmOrInches: Bool, kgOrlbs: Bool, context: NSManagedObjectContext) {
        bmi.date = Date()
        bmi.gender = gender
        bmi.age = age
        bmi.cmOrMetre = cmOrInches
        bmi.kgOrlbs = kgOrlbs
        
        var convertedWeight = weight // Başlangıçta, veri dönüşümü yapmadan ağırlık ve boy uzunluğunu atıyoruz.
        var convertedHeight = height
        
        if !cmOrInches {
            // Eğer inches cinsinden boy verisi geliyorsa, bunu santimetreye çeviriyoruz.
            convertedHeight = height * 2.54 // Bir inç 2.54 santimetre
        }
        
        if !kgOrlbs {
            // Eğer lbs cinsinden ağırlık verisi geliyorsa, bunu kilograma çeviriyoruz.
            convertedWeight = weight * 0.453592 // Bir pound 0.453592 kilogram
        }
        
        bmi.weight = convertedWeight
        bmi.height = convertedHeight
        
        let formattedWeight = Double(String(format: "%.2f", convertedWeight)) ?? 0.0
        bmi.weight = formattedWeight
        let formattedHeight = Double(String(format: "%.2f", convertedHeight)) ?? 0.0
        bmi.height = formattedHeight
        
        let resultBmi = (convertedWeight / ((convertedHeight / 10) * (convertedHeight / 10))) * 100
        let formattedResultBMI = Double(String(format: "%.2f", resultBmi)) ?? 0.0
        bmi.bmiResult = formattedResultBMI
        
        save(context: context)
    }
    
}
