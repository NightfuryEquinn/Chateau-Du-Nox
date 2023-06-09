//
//  CartRowStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import SwiftUI

struct CartRowStruct: View {
    // State Variables
    @State private var showRemoveAlert = false
    
    // Binding Variables
    @Binding var cartItem: CartItemStruct
    
    var body: some View {
        
        VStack {
            HStack {
                Image(cartItem.bottleImage)
                    .resizable()
                    .frame(width: 60.0, height: 175.0)
                    .cornerRadius(10.0)
                    .aspectRatio(contentMode: .fill)
                    .padding(.trailing, 35)
                
                VStack(alignment: .leading) {
                    Text(cartItem.wine)
                        .font(.custom("Didot", size: 24))
                        .bold()
                        .padding(.bottom, 10)
                        .foregroundColor(AppColour.cYellow)
                    
                    Text(String(format: "RM%.0f", cartItem.basePrice))
                        .font(.custom("Didot", size: 20))
                        .bold()
                        .padding(.bottom, 10)
                        .foregroundColor(AppColour.cYellow)
                    
                    HStack(alignment: .center) {
                        Stepper("\t\(cartItem.quantity)", value: $cartItem.quantity, in: 1...12)
                            .font(.custom("Avenir Next Medium", size: 16))
                            .foregroundColor(AppColour.cDarkGreen)
                            .background(AppColour.cYellow)
                            .cornerRadius(10.0)
                            .onChange(of: cartItem.quantity) { newQuantity in
                                updateQuantity(wine: cartItem.wine, quantity: cartItem.quantity)
                            }
                    }
                    .padding(.vertical, 10.0)
                    .padding(.trailing, 10.0)
                    
                    Button(action: {
                        showRemoveAlert = true
                    }) {
                        HStack {
                            Spacer()
                            Text("Remove")
                                .font(.custom("Didot", size: 16))
                                .bold()
                                .foregroundColor(AppColour.cYellow)
                                .padding(5)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(AppColour.cError)
                                .cornerRadius(50)
                        }
                    }
                    .padding(.vertical, 20.0)
                    .padding(.leading, 40.0)
                    .alert(isPresented: $showRemoveAlert) {
                        Alert(
                            title: Text("Remove \(cartItem.wine)?"),
                            message: Text("You can add it back from the main menu if you change your mind."),
                            primaryButton: .destructive(
                                Text("Yes"),
                                action: {
                                    deleteWineFromCart(wine: cartItem.wine)
                                }),
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
        }
        .padding(.horizontal, 35)
        .padding(.vertical, 20)
    }
}

struct CartRowStruct_Previews: PreviewProvider {
    static var previews: some View {
        let cartItem = CartItemStruct(
            wine: "Default Wine",
            bottleImage: "Default Bottle Image",
            basePrice: 0,
            quantity: 1
        )
        
        CartRowStruct(
            cartItem: .constant(
                CartItemStruct(
                    wine: cartItem.wine,
                    bottleImage: cartItem.bottleImage,
                    basePrice: cartItem.basePrice,
                    quantity: cartItem.quantity
                )
            )
        )
    }
}
