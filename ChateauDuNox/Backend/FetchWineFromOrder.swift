//
//  FetchWineFromOrder.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 21/03/2023.
//

import CoreData

func fetchWineFromOrder() -> [HistoryItemStruct] {
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { ( storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    let request: NSFetchRequest<Order> = Order.fetchRequest()
    request.predicate = NSPredicate(format: "customer == %@", userSessionName ?? "")
    
    do {
        let orders = try container.viewContext.fetch(request)
        
        return orders.map {
            HistoryItemStruct(
                wine: $0.wine ?? "",
                customer: $0.customer ?? "",
                bottleImage: $0.bottleImage ?? "",
                orderedDate: $0.orderedDate ?? Date(),
                deliveredDate: $0.deliveredDate,
                address: $0.address ?? "",
                quantity: Int($0.quantity),
                totalPrice: Double($0.totalPrice)
            )
        }
    } catch {
        print("Error fetching user called \(userSessionName ?? "") and order history: \(error.localizedDescription)")
        
        return[]
    }
}
