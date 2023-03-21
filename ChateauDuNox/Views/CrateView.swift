//
//  CrateView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct CrateView: View {
    // State Variables
    @State var showPaymentView = false
    @State var items: [CartItemStruct] = fetchWineFromCart()
    
    var taxPrice: Double {
        return items.reduce(0) { $0 + $1.taxPrice }
    }
    
    var totalPrice: Double {
        return items.reduce(0) { $0 + $1.totalPrice }
    }
    
    @State var historyItems: [HistoryItemStruct] = []
    
    var body: some View {
        VStack {
            Image("barrel-cover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .edgesIgnoringSafeArea(.all)
                .padding(.bottom, 30)
            
            Text("My Crate")
                .font(.custom("Didot", size: 44))
                .bold()
                .foregroundColor(AppColour.cBlack)
                .padding(.bottom, 15)
        
            ScrollView {
                if !items.isEmpty {
                    LazyVStack {
                        ForEach(items.indices, id: \.self) { index in
                            CartRowStruct(cartItem: $items[index])
                            
                            if index != items.indices.last {
                                Divider()
                                    .background(AppColour.cBlack)
                                    .padding(.horizontal, 35.0)
                            }
                        }
                    }
                    .background(AppColour.cDarkGreen)
                    .cornerRadius(10.0)
                    .padding(.horizontal, 35)
                    .padding(.bottom, 30)
                    
                    VStack(alignment: .leading, spacing: 20.0) {
                        HStack {
                            Text("Shipping Fee: ")
                                .font(.custom("Didot", size: 18))
                                .bold()
                                .foregroundColor(AppColour.cBlack)
                            
                            Text("RM59.90")
                                .font(.custom("Didot", size: 18))
                                .bold()
                                .foregroundColor(AppColour.cBlack)
                        }
                        
                        HStack {
                            Text("Tax 26%: ")
                                .font(.custom("Didot", size: 18))
                                .bold()
                                .foregroundColor(AppColour.cBlack)
                            
                            Text("RM\(String(format: "%.2f", taxPrice))")
                                .font(.custom("Didot", size: 18))
                                .bold()
                                .foregroundColor(AppColour.cBlack)
                        }
                        
                        HStack {
                            Text("Total Price: ")
                                .font(.custom("Didot", size: 18))
                                .bold()
                                .foregroundColor(AppColour.cBlack)
                            
                            Text("RM\(String(format: "%.2f", totalPrice + 59.90))")
                                .font(.custom("Didot", size: 18))
                                .bold()
                                .foregroundColor(AppColour.cBlack)
                        }
                    }
                    .padding(.bottom, 30)
                    
                    Button(action: {
                        print("Checkout")
                        
                        self.showPaymentView = true
                        
                        historyItems.removeAll()
                        
                        for item in items {
                            let historyItem = HistoryItemStruct(
                                wine: item.wine,
                                customer: userSessionName ?? "",
                                bottleImage: item.bottleImage,
                                orderedDate: Date(),
                                deliveredDate: nil,
                                address: userSessionAddress ?? "",
                                quantity: item.quantity,
                                totalPrice: totalPrice + 59.90
                            )
                            
                            historyItems.append(historyItem)
                        }
                    }) {
                        Text("Checkout")
                            .font(.custom("Didot", size: 20))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(10)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cDarkGreen)
                            .cornerRadius(50)
                    }
                    .padding(.horizontal, 120)
                    .padding(.bottom, 20)
                    .sheet(isPresented: $showPaymentView) {
                        PaymentView(showPaymentView: $showPaymentView, historyItems: $historyItems)
                    }
                
                } else {
                    VStack(alignment: .center, spacing: 20.0) {
                        Image(systemName: "cart.badge.minus")
                            .font(.largeTitle)
                            .foregroundColor(AppColour.cDarkGreen)
                        
                        Text("There is no wine in your crate.")
                            .font(.custom("Didot", size: 24))
                            .bold()
                    }
                    .padding(.top, 110.0)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct CrateView_Previews: PreviewProvider {
    static var previews: some View {
        CrateView()
    }
}
