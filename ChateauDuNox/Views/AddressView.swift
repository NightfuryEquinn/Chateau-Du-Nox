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
    
    // Binding Variables
    @Binding var showAddressView: Bool
    @Binding var showPaymentView: Bool
    
    @Binding var historyItems: [HistoryItemStruct]
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("Address")
                    .font(.custom("Didot", size: 24))
                    .foregroundColor(AppColour.cBlack)
                
                TextField("Enter address", text: $address)
                    .font(.custom("Avenir Next", size: 18))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    print("Confirm Address")
                    
                    updateCoordinate()
                    
                    showAddressView = false
                    showPaymentView = false
                    
                    for var historyItem in historyItems {
                        historyItem.address = address
                    }
                    
                    addWineToOrder(wineOrders: historyItems)
                    
                    for historyItem in historyItems {
                        deleteWineFromCart(wine: historyItem.wine)
                    }
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
                    .padding(.bottom, 30.0)
                
                Text("NOTE: Ensure that your address is correctly typed. Inaccurate or invalid address will not be tolerated.\nPlease contact our customer service as soon as possible if your address is wrongly inputted.")
                    .font(.custom("Avenir Next", size: 14))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(35.0)
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
        let historyItem = HistoryItemStruct(
            wine: "Default Wine",
            customer: "Default Customer",
            bottleImage: "Default Image",
            orderedDate: Date(),
            deliveredDate: nil,
            address: "Default Address",
            quantity: 0,
            totalPrice: 0
        )
        
        AddressView(
            showAddressView: .constant(false),
            showPaymentView: .constant(false),
            historyItems: .constant([historyItem])
        )
            .environmentObject(LocationManager())
    }
}
