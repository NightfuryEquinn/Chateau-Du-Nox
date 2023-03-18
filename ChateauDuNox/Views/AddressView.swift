//
//  AddressView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 18/03/2023.
//

import SwiftUI
import MapKit

struct AddressView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    // State Variables
    @State private var address = ""
    @State private var coordinate = CLLocationCoordinate2D()
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center) {
                    Text("Address")
                        .font(.custom("Avenir Next", size: 18))
                        .foregroundColor(AppColour.cBlack)
                    
                    TextField("Enter address", text: $address)
                        .font(.custom("Avenir Next", size: 18))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        print("Confirm Address")
                        
                        updateCoordinate()
                    }) {
                        Text("Confirm Address")
                            .font(.custom("Didot", size: 20))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(10)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cDarkGreen)
                            .cornerRadius(50)
                    }
                    .padding(.horizontal, 60)
                    .padding(.vertical, 20)
                    
                    AddressMap(address: $address, coordinate: coordinate)
                        .frame(maxWidth: .infinity)
                        .frame(height: 450.0)
                        .cornerRadius(10.0)
                }
            }
            .padding(.horizontal, 35.0)
        }
        .background(AppColour.cYellow)
    }
    
    func updateCoordinate() {
        // Update the coordinate property to the user's address
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                // Update the coordinate property of the AddressMap struct
                self.coordinate = location.coordinate
            }
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView().environmentObject(LocationManager())
    }
}
