//
//  AddWineToCart.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 20/03/2023.
//

import Foundation
import CoreData

func addWineToCart(customer: String, wine: String, bottleImage: String, price: Double, quantity: Int) {
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { ( storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    let request: NSFetchRequest<Crate> = Crate.fetchRequest()
    request.predicate = NSPredicate(format: "wine == %@ AND customer == %@", wine, customer)
    
    do {
        let crates = try container.viewContext.fetch(request)
        
        // Check if the wine is already in cart
        if !crates.isEmpty || crates.contains(where: { $0.wine == wine } ) {
            print("\(wine) is already in cart.")
            return
        }
        
        let crate = Crate(context: container.viewContext)
        // Add wine into cart
        crate.customer = customer
        crate.wine = wine
        crate.bottleImage = bottleImage
        crate.price = price
        crate.quantity = Int16(quantity)
        
        // Save wine into cart
        try container.viewContext.save()
    } catch {
        print("Error updating user called \(userSessionName ?? "") and item into crate: \(error.localizedDescription)")
    }
}
