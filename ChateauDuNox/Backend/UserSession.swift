//
//  UserSession.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 20/03/2023.
//

import CoreData
import SwiftUI

func createUserSession(username: String, password: String) -> String? {
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
        
        // If there is at least one user that matches, set the user ID and return it
        if let user = matchingUsers.first {
            UserDefaults.standard.set(user.name, forKey: "userID")
            
            userID = user.name
            
            return user.name
        } else {
            // If no matching user was found, return nil
            return nil
        }
    } catch {
        // Handle errors with fetching from CoreData
        print("Error fetching from Core Data: \(error.localizedDescription)")
    
        return nil
    }
}

func obliterateUserSession() {
    // Remove the stored authentication status and user identifier from UserDefaults
    UserDefaults.standard.removeObject(forKey: "isAuthenticated")
    UserDefaults.standard.removeObject(forKey: "userID")
    
    // Synchronize UserDefaults to persist the changes
    UserDefaults.standard.synchronize()
}
