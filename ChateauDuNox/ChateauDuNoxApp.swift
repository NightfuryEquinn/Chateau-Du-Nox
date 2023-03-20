//
//  ChateauDuNoxApp.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI

// Declare a global variable to store the user ID
var userID: String? = UserDefaults.standard.string(forKey: "userID")

@main
struct ChateauDuNoxApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
           LoginContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(locationManager)
        }
    }
}
