//
//  AddWineToOrder.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 21/03/2023.
//

import CoreData

func addWineToOrder(wineOrders: [HistoryItemStruct]) {
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { ( storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    do {
        for wineOrder in wineOrders {
            let order = Order(context: container.viewContext)
            
            order.customer = wineOrder.customer
            order.wine = wineOrder.wine
            order.bottleImage = wineOrder.bottleImage
            order.quantity = Int16(wineOrder.quantity)
            order.totalPrice = Int16(wineOrder.totalPrice)
            order.address = wineOrder.address
            order.orderedDate = wineOrder.orderedDate
            order.deliveredDate = wineOrder.deliveredDate
            
            try container.viewContext.save()
        }
    } catch {
        print("Error purchasing: \(error.localizedDescription)")
    }
}
