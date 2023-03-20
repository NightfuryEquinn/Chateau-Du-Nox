//
//  CartRowStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import SwiftUI

struct CartRowStruct: View {
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
                    Text(cartItem.name)
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
                    }
                    .padding(.vertical, 10.0)
                    .padding(.trailing, 10.0)
                    
                    Button(action: {
                        print("Remove")
                        
                        deleteWineFromCart(wine: cartItem.name)
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
            name: "Default Name",
            bottleImage: "Default Bottle Image",
            basePrice: 0,
            quantity: 1
        )
        
        CartRowStruct(
            cartItem: .constant(
                CartItemStruct(
                    name: cartItem.name,
                    bottleImage: cartItem.bottleImage,
                    basePrice: cartItem.basePrice,
                    quantity: cartItem.quantity
                )
            )
        )
    }
}
