//
//  CrateView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct CrateView: View {
    // Values won't update (Debug tomorrow)
    let cartRow = CartRowStruct()
    
    var taxPrice: Double {
        cartRow.basePrice * 0.26
    }
    
    var totalPrice: Double {
        cartRow.basePrice + taxPrice + 59.90
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
                        CartRowStruct()
                    }
                    .background(AppColour.cDarkGreen)
                    .cornerRadius(10.0)
                    .padding(.horizontal, 35)
                    .padding(.bottom, 30)
                    
                    VStack(alignment: .leading, spacing: 20.0) {
                        HStack {
                            Text("Base Price: ")
                                .font(.custom("Didot", size: 18))
                                .bold()
                                .foregroundColor(AppColour.cBlack)
                            
                            Text("RM\(String(format: "%.2f", cartRow.basePrice))")
                                .font(.custom("Didot", size: 18))
                                .bold()
                                .foregroundColor(AppColour.cBlack)
                        }
                        
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
                            
                            Text("RM\(String(format: "%.2f", totalPrice))")
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
