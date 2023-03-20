//
//  ChateauDuNoxApp.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI

// Declare a global variable to store the user ID
var userSessionName: String? = UserDefaults.standard.string(forKey: "userSessionName")
var userSessionPassword: String? = UserDefaults.standard.string(forKey: "userSessionPassword")
var userSessionEmail: String? = UserDefaults.standard.string(forKey: "userSessionEmail")
var userSessionContact: String? = UserDefaults.standard.string(forKey: "userSessionContact")
var userSessionAddress: String? = UserDefaults.standard.string(forKey: "userSessionAddress")

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
