//
//  LocationManager.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 18/03/2023.
//

import SwiftUI
import CoreLocation

class LocationManager: ObservableObject {
    let userLocationManager = CLLocationManager()
    
    func requestPermission() {
        switch userLocationManager.authorizationStatus {
            
        case .notDetermined:
            userLocationManager.requestAlwaysAuthorization()
            
        default:
            return
        }
    }
    
    init() {
        requestPermission()
    }
}
