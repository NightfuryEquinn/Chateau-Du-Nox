//
//  DeleteWineFromCart.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 20/03/2023.
//

import CoreData

func deleteWineFromCart(wine: String) {
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { ( storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    let request: NSFetchRequest<Crate> = Crate.fetchRequest()
    request.predicate = NSPredicate(format: "wine == %@ AND customer == %@", wine, userSessionName ?? "")
    
    do {
        let crates = try container.viewContext.fetch(request)
        
        // Check if wine is already in cart
        if let crate = crates.first(where: { $0.wine == wine }) {
            // Remove wine from cart
            container.viewContext.delete(crate)
            
            // Save changes to cart
            try container.viewContext.save()
        } else {
            print("\(wine) is not in cart.")
        }
    } catch {
        print("Error removing \(wine) from cart: \(error.localizedDescription)")
    }

}
