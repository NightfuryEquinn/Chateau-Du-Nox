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
    @State var showReceivedPopView = false
    
    // Binding Variables
    @Binding var historyItem: HistoryItemStruct
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(historyItem.bottleImage)
                    .resizable()
                    .frame(width: 60.0, height: 175.0)
                    .cornerRadius(10.0)
                    .aspectRatio(contentMode: .fill)
                    .padding(.trailing, 35)
                
                VStack(alignment: .leading) {
                    Text(historyItem.name)
                        .font(.custom("Didot", size: 24))
                        .bold()
                        .padding(.bottom, 10)
                        .foregroundColor(AppColour.cYellow)
                    
                    Text(String(format: "RM%.2f", historyItem.totalPrice))
                        .font(.custom("Didot", size: 20))
                        .bold()
                        .padding(.bottom, 10)
                        .foregroundColor(AppColour.cYellow)
                    
                    Text("Quantity: \(historyItem.quantity)")
                        .font(.custom("Didot", size: 18))
                        .bold()
                        .padding(.bottom, 10)
                        .foregroundColor(AppColour.cYellow)
                }
            }
            
            Text("To: \(historyItem.address)")
                .font(.custom("Avenir Next", size: 18))
                .padding(.bottom, 10)
                .foregroundColor(AppColour.cYellow)
            
            Text("From: \(historyItem.customer)")
                .font(.custom("Avenir Next", size: 18))
                .padding(.bottom, 10)
                .foregroundColor(AppColour.cYellow)
            
            Text("Paid on \(formatDateToString(historyItem.orderedDate))")
                .font(.custom("Avenir Next", size: 16))
                .padding(.bottom, 10)
                .foregroundColor(AppColour.cYellow)
            
            if (historyItem.deliveredDate != nil) {
                Text("Delivered on \(formatDateToString(historyItem.deliveredDate ?? Date()))")
                    .font(.custom("Avenir Next", size: 16))
                    .padding(.bottom, 10)
                    .foregroundColor(AppColour.cYellow)
            } else {
                Button(action: {
                    print("Received")
                    
                    self.showReceivedPopView = true
                }) {
                    HStack {
                        Text("Received?")
                            .font(.custom("Avenir Next", size: 16))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(5)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cLightGreen)
                            .cornerRadius(50)
                        Spacer()
                    }
                }
                .padding(.vertical, 20.0)
                .padding(.trailing, 80.0)
                .sheet(isPresented: $showReceivedPopView) {
                    ReceivedPopView(showReceivedPopView: $showReceivedPopView)
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
            name: "Default Name",
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
                    name: historyItem.name,
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
