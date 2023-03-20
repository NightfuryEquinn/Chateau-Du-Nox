//
//  UserSession.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 20/03/2023.
//

import CoreData
import SwiftUI

func createUserSession(username: String, password: String) {
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
            UserDefaults.standard.set(user.name, forKey: "userSessionName")
            UserDefaults.standard.set(user.password, forKey: "userSessionPassword")
            UserDefaults.standard.set(user.email, forKey: "userSessionEmail")
            UserDefaults.standard.set(user.contact, forKey: "userSessionContact")
            UserDefaults.standard.set(user.address, forKey: "userSessionAddress")
            
            userSessionName = user.name
            userSessionPassword = user.password
            userSessionEmail = user.email
            userSessionContact = user.contact
            userSessionAddress = user.address
    
        }
    } catch {
        // Handle errors with fetching from CoreData
        print("Error fetching from Core Data: \(error.localizedDescription)")
    }
}

func obliterateUserSession() {
    // Remove the stored authentication status and user identifier from UserDefaults
    UserDefaults.standard.removeObject(forKey: "userSessionName")
    UserDefaults.standard.removeObject(forKey: "userSessionPassword")
    UserDefaults.standard.removeObject(forKey: "userSessionEmail")
    UserDefaults.standard.removeObject(forKey: "userSessionContact")
    UserDefaults.standard.removeObject(forKey: "userSessionAddress")
    
    // Synchronize UserDefaults to persist the changes
    UserDefaults.standard.synchronize()
}
