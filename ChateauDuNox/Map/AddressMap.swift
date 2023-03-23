//
//  AddressMap.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 18/03/2023.
//

import SwiftUI
import MapKit

struct AddressMap: UIViewRepresentable {
    @Binding var address: String
    @State var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        updateCoordinate()
    }
    
    func updateCoordinate() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                coordinate = location.coordinate
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: AddressMap
        var map: MKMapView?
        
        init(_ parent: AddressMap) {
            self.parent = parent
        }
    }
}
