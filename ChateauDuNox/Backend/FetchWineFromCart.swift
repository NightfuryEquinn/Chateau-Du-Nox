//
//  FetchWineFromCart.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 20/03/2023.
//

import CoreData

func fetchWineFromCart() -> [CartItemStruct] {
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { ( storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    let request: NSFetchRequest<Crate> = Crate.fetchRequest()
    request.predicate = NSPredicate(format: "customer == %@", userSessionName ?? "")
    
    do {
        let crates = try container.viewContext.fetch(request)
        
        return crates.map {
            CartItemStruct(
                wine: $0.wine ?? "",
                bottleImage: $0.bottleImage ?? "",
                basePrice: $0.price,
                quantity: Int($0.quantity)
            )
        }
    } catch {
        print("Error fetching user called \(userSessionName ?? "") and item from crate: \(error.localizedDescription)")
        
        return[]
    }
}
