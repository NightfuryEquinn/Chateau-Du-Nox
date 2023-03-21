//
//  UpdateWineOrder.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 21/03/2023.
//

import Foundation
import CoreData

func updateWineOrder(wine: String, orderedDate: Date) {
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { ( storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
   
    let request: NSFetchRequest<Order> = Order.fetchRequest()
    request.predicate = NSPredicate(format: "wine == %@ AND customer == %@ AND orderedDate == %@ AND deliveredDate == nil", wine, userSessionName ?? "", orderedDate as NSDate)
    
    do {
        let orders = try container.viewContext.fetch(request)
        
        if let order = orders.first(where: { $0.wine == wine }) {
            // Update to today
            order.deliveredDate = Date()
            
            // Save the updated information to CoreData
            try container.viewContext.save()
        }
    } catch {
        print("Error updating order: \(error.localizedDescription)")
    }
}
