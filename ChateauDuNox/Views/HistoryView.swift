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
    
    @State var items: [HistoryItemStruct] = fetchWineFromOrder()
    
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
                if !filteredHistory.isEmpty {
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
                } else {
                    VStack(alignment: .center, spacing: 20.0) {
                        Image(systemName: "clock.arrow.circlepath")
                            .font(.largeTitle)
                            .foregroundColor(AppColour.cDarkGreen)
                        
                        Text("There is no order on this day.")
                            .font(.custom("Didot", size: 24))
                            .bold()
                    }
                    .padding(.top, 110.0)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
