//
//  TargetDataController.swift
//  BMI-Calculator
//
//  Created by İsmail KURT on 1.02.2024.
//

import Foundation
import CoreData

class TargetDataController : ObservableObject {
    let container = NSPersistentContainer(name: "TargetWeight")
    
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
    
    func addTarget(weight: Double, kgOrlbs: Bool, name: String, context: NSManagedObjectContext) {
        let target = TargetWeight(context: context)
        let bmi = Bmi(context: context)
        target.id = UUID()
        target.kgOrlbs = kgOrlbs
        target.name = name
        
        var convertedWeight = weight // Başlangıçta, veri dönüşümü yapmadan ağırlık ve boy uzunluğunu atıyoruz.
        
        if !kgOrlbs {
            // Eğer lbs cinsinden ağırlık verisi geliyorsa, bunu kilograma çeviriyoruz.
            convertedWeight = weight * 0.453592 // Bir pound 0.453592 kilogram
        }
        
        let formattedWeight = Double(String(format: "%.2f", convertedWeight)) ?? 0.0
        bmi.weight = formattedWeight
        
        save(context: context)
    }
}
