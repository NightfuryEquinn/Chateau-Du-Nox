//
//  UpdateUserInfo.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 20/03/2023.
//

import Foundation
import CoreData
import SwiftUI

func updateUserInfo(password: String, email: String, contact: String, address: String) {
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { ( storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    let request: NSFetchRequest<User> = User.fetchRequest()
    request.predicate = NSPredicate(format: "name == %@", userSessionName ?? "")
    
    do {
        let users = try container.viewContext.fetch(request)
        
        guard let user = users.first else {
            print("User called \(userSessionName ?? "") does not exist.")
            return
        }
        
        
        
    } catch {
        print("Error updating user called \(userSessionName ?? ""): \(error.localizedDescription)")
    }
}
