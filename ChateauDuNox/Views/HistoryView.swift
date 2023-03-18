//
//  HistoryView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct HistoryView: View {
    // State Variables
    @State private var filterDate = Date()
    
    @State var items: [HistoryItemStruct] = [
        HistoryItemStruct(name: "Barbera", customer: "New", bottleImage: "barbera-bottle", orderedDate: Date(), deliveredDate: Date(), address: "29, Jalan King, Taman Queen, 31650 Ipoh, Perak", quantity: 3, totalPrice: 568.38),
        HistoryItemStruct(name: "Sauvignon Blanc", customer: "New", bottleImage: "blanc-bottle", orderedDate: Date().addingTimeInterval(60 * 60 * 24), deliveredDate: nil, address: "29, Jalan King, Taman Queen, 31650 Ipoh, Perak", quantity: 5, totalPrice: 968.38),
        HistoryItemStruct(name: "Pinot Noir", customer: "New", bottleImage: "pinot-noir-bottle", orderedDate: Date().addingTimeInterval(60 * 60 * 24), deliveredDate: nil, address: "29, Jalan King, Taman Queen, 31650 Ipoh, Perak", quantity: 2, totalPrice: 268.38)
    ]
    
    var filteredHistory: [Binding<HistoryItemStruct>] {
        items.indices.filter { index in
            Calendar.current.isDate(items[index].orderedDate, inSameDayAs: filterDate)
        }.map { index in
            Binding(
                get: { items[index] },
                set: { items[index] = $0 }
            )
        }
    }
    
    var body: some View {
        VStack {
            Image("chateauLogo")
                .resizable()
                .scaledToFill()
                .frame(height: 10)
                .padding(.bottom, 75)
            
            Text("Order History")
                .font(.custom("Didot", size: 44))
                .bold()
                .foregroundColor(AppColour.cBlack)
                .padding(.bottom, 15)
            
            DatePicker("Filter by Order Date", selection: $filterDate, displayedComponents: .date)
                .padding(.horizontal, 30.0)
                .font(.custom("Avenir Next", size: 16))
            
            ScrollView {
                LazyVStack {
                    ForEach(filteredHistory.indices, id: \.self) { index in
                        HistoryRowStruct(historyItem: filteredHistory[index]).id(index)
                        
                        if index != filteredHistory.indices.last {
                            Divider()
                                .background(AppColour.cBlack)
                                .padding(.horizontal, 35.0)
                        }
                    }
                }
                .background(AppColour.cDarkGreen)
                .cornerRadius(10)
                .padding(30.0)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
