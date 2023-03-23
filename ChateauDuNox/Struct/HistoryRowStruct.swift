//
//  HistoryRowStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 18/03/2023.
//

import Foundation
import SwiftUI

struct HistoryRowStruct: View {
    // State Variables
    @State private var showReceivedAlert = false
    
    // Binding Variables
    @Binding var historyItem: HistoryItemStruct
    
    var body: some View {
        let taxPrice = (historyItem.totalPrice - 59.90) / (1.26) * 0.26
        let basePrice = (historyItem.totalPrice - 59.90 - taxPrice) / Double(historyItem.quantity)
        
        VStack(alignment: .leading) {
            HStack {
                Image(historyItem.bottleImage)
                    .resizable()
                    .frame(width: 60.0, height: 175.0)
                    .cornerRadius(10.0)
                    .aspectRatio(contentMode: .fill)
                    .padding(.trailing, 35)
                
                VStack(alignment: .leading, spacing: 10.0) {
                    Text(historyItem.wine)
                        .font(.custom("Didot", size: 24))
                        .bold()
                        .foregroundColor(AppColour.cYellow)
                    
                    Text("Quantity: \(historyItem.quantity)")
                        .font(.custom("Avenir Next", size: 14))
                        .bold()
                        .foregroundColor(AppColour.cYellow)
                    
                    Text("Price per bottle: \(String(format: "RM%.2f", basePrice))")
                        .font(.custom("Avenir Next", size: 14))
                        .bold()
                        .foregroundColor(AppColour.cYellow)
                    
                    Text("Tax Price: \(String(format: "RM%.2f", taxPrice))")
                        .font(.custom("Avenir Next", size: 14))
                        .bold()
                        .foregroundColor(AppColour.cYellow)
                    
                    Text("Total Price: \(String(format: "RM%.2f", historyItem.totalPrice))")
                        .font(.custom("Avenir Next", size: 14))
                        .bold()
                        .foregroundColor(AppColour.cYellow)
                }
            }
            .padding(.bottom, 10.0)
            
            Text("To: \(historyItem.address)")
                .padding(.bottom, 2.5)
                .font(.custom("Avenir Next", size: 16))
                .foregroundColor(AppColour.cYellow)
            
            Text("From: \(historyItem.customer)")
                .padding(.bottom, 2.5)
                .font(.custom("Avenir Next", size: 16))
                .foregroundColor(AppColour.cYellow)
            
            Text("Paid on \(formatDateToString(historyItem.orderedDate))")
                .padding(.bottom, 2.5)
                .font(.custom("Avenir Next", size: 16))
                .foregroundColor(AppColour.cYellow)
            
            if (historyItem.deliveredDate != nil) {
                Text("Delivered on \(formatDateToString(historyItem.deliveredDate ?? Date()))")
                    .padding(.bottom, 2.5)
                    .font(.custom("Avenir Next", size: 16))
                    .foregroundColor(AppColour.cYellow)
            } else {
                Button(action: {
                    showReceivedAlert = true
                }) {
                    Text("Received?")
                        .font(.custom("Avenir Next", size: 16))
                        .bold()
                        .foregroundColor(AppColour.cYellow)
                        .padding(5)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(AppColour.cLightGreen)
                        .cornerRadius(50)
                }
                .padding(.vertical, 20.0)
                .padding(.trailing, 70.0)
                .alert(isPresented: $showReceivedAlert) {
                    Alert(
                        title: Text("Confirm Received?"),
                        message: Text("This action cannot be undone."),
                        primaryButton: .destructive(
                            Text("Yes"),
                            action: {
                                updateWineOrder(wine: historyItem.wine, orderedDate: historyItem.orderedDate)
                            }
                        ),
                        secondaryButton: .cancel()
                    )
                }
            }
        }
        .padding(.horizontal, 35)
        .padding(.vertical, 20)
    }
    
    // Format Date to String
    func formatDateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.string(from: date)
    }
}

struct HistoryRowStruct_Previews: PreviewProvider {
    static var previews: some View {
        let historyItem = HistoryItemStruct(
            wine: "Default Wine",
            customer: "Default Customer",
            bottleImage: "Default Bottle Image",
            orderedDate: Date(),
            deliveredDate: Date(),
            address: "Default Address",
            quantity: 1,
            totalPrice: 0
        )
        
        HistoryRowStruct(
            historyItem: .constant(
                HistoryItemStruct(
                    wine: historyItem.wine,
                    customer: historyItem.customer,
                    bottleImage: historyItem.bottleImage,
                    orderedDate: historyItem.orderedDate,
                    deliveredDate: historyItem.deliveredDate,
                    address: historyItem.address,
                    quantity: historyItem.quantity,
                    totalPrice: historyItem.totalPrice
                )
            )
        )
    }
}
