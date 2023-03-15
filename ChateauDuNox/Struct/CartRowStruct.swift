//
//  CartRowStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import SwiftUI

struct CartRowStruct: View {
    // State Variables
    @State var quantity: Int = 1
    @State var basePrice = 135.0
    
    let itemPrice = 135.0
    
    var body: some View {
        VStack {
            HStack {
                Image("pinot-noir-bottle")
                    .resizable()
                    .frame(width: 60.0, height: 175.0)
                    .cornerRadius(10.0)
                    .aspectRatio(contentMode: .fill)
                    .padding(.trailing, 35)
                
                VStack(alignment: .leading) {
                    Text("Pinot Noir")
                        .font(.custom("Didot", size: 24))
                        .bold()
                        .padding(.bottom, 10)
                        .foregroundColor(AppColour.cYellow)
                    
                    Text("RM135")
                        .font(.custom("Didot", size: 20))
                        .bold()
                        .padding(.bottom, 10)
                        .foregroundColor(AppColour.cYellow)
                    
                    HStack(alignment: .center) {
                        Button(action: {
                            // Decrease quantity
                            if quantity > 1 {
                                quantity -= 1
                                basePrice -= itemPrice
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(AppColour.cYellow)
                                .cornerRadius(10.0)
                        }
                        
                        Text("\(quantity)")
                            .padding(.horizontal, 10.0)
                            .font(.custom("Didot", size: 20))
                            .foregroundColor(AppColour.cYellow)
                        
                        Button(action: {
                            // Increase quantity
                            quantity += 1
                            basePrice += itemPrice
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(AppColour.cYellow)
                                .cornerRadius(10.0)
                        }
                    }
                    .padding(10)
                    
                    Button(action: {
                        print("Remove")
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
        CartRowStruct()
    }
}
