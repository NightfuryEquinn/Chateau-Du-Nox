//
//  ForgotAuthentication.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 13/03/2023.
//

import CoreData

func forgotAuthentication(email: String, newPassword: String) {
    let container = NSPersistentContainer(name: "ChateauDB")
    
    container.loadPersistentStores { ( storeDescription, error ) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    let request: NSFetchRequest<User> = User.fetchRequest()
    request.predicate = NSPredicate(format: "email == %@", email)
    
    do {
        let users = try container.viewContext.fetch(request)
        
        // Check if a user with the given email exists
        guard let user = users.first else {
            print("User with email \(email) does not exist.")
            return
        }
        
        // Update the user's password
        user.password = newPassword
        
        // Save the changes to CoreData
        try container.viewContext.save()
        
        print("User with email \(email) updated successfully.")
    } catch {
        print("Error updating user with email \(email): \(error.localizedDescription)")
    }
}
