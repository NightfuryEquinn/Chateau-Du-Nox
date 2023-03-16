//
//  CrateView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct CrateView: View {
    @State var items: [CartItemStruct] = [
        CartItemStruct(name: "Pinot Noir", bottleImage: "pinot-noir-bottle", basePrice: 135.0, quantity: 1),
        CartItemStruct(name: "Erbaluce", bottleImage: "erbaluce-bottle", basePrice: 156.0, quantity: 1)
    ]
    
    var taxPrice: Double {
        return items.reduce(0) { $0 + $1.taxPrice }
    }
    
    var totalPrice: Double {
        return items.reduce(0) { $0 + $1.totalPrice }
    }
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image("barrel-cover")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 30)
                    
                    Text("My Cart")
                        .font(.custom("Didot", size: 44))
                        .bold()
                        .foregroundColor(AppColour.cBlack)
                        .padding(.bottom, 15)
                    
                    LazyVStack {
                        ForEach(items.indices, id: \.self) { index in
                            CartRowStruct(cartItem: $items[index])
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
                            Text("Tax (26%): ")
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
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .background(AppColour.cYellow)
        .navigationBarHidden(true)
    }
}

struct CrateView_Previews: PreviewProvider {
    static var previews: some View {
        CrateView()
    }
}
