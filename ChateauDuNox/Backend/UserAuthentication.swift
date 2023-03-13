//
//  UserAuthentication.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import CoreData

func userAuthentication(username: String, password: String) -> Bool {
    // Get a Reference to the Core Data persistent container
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { (storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    // Create a fetch request for the User Entity
    let request: NSFetchRequest<User> = User.fetchRequest()
    
    // Add a predicate to the fetch request to filter by username and password
    request.predicate = NSPredicate(format: "name == %@ AND password == %@", username, password)
    
    do {
        // Fetch the users that match the username and password
        let matchingUsers = try container.viewContext.fetch(request)
        
        // If there is at least one user that matches, return true
        return !matchingUsers.isEmpty
    } catch {
        // Handle errors with fetching from CoreData
        print("Error fetching from Core Data: \(error.localizedDescription)")
    
        return false
    }
}
