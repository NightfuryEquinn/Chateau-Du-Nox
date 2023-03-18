//
//  ChateauDuNoxApp.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI

@main
struct ChateauDuNoxApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            AddressView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(locationManager)
        }
    }
}
