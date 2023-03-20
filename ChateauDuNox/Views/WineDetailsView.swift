//
//  WineDetailsView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct WineDetailsView: View {
    // State Variables
    @State var showAddToCartView = false
    
    // Binding Variables
    @Binding var isLogin: Bool
    
    let wine: Wine
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            VStack {
                Image(wine.coverImage)
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 20)
                
                Text(wine.name)
                    .font(.custom("Didot", size: 44))
                    .bold()
                    .foregroundColor(AppColour.cBlack)
                    .padding(.horizontal, 35)
                    .padding(.bottom, 20)
            
            
            ScrollView {
                    Image(wine.bottleImage)
                        .resizable()
                        .frame(width: 125.0, height: 375.0)
                        .cornerRadius(10.0)
                        .aspectRatio(contentMode: .fill)
                        .padding(.trailing, 10)
                        .padding(.bottom, 40)
                    
                    HStack {
                        Text("Description")
                            .font(.custom("Didot", size: 24))
                            .bold()
                            .foregroundColor(AppColour.cBlack)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        VStack {
                            Text(wine.content)
                                .font(.custom("Avenir Next", size: 16))
                                .foregroundColor(AppColour.cYellow)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 20)
                                .multilineTextAlignment(.center)
                        }
                        .background(AppColour.cDarkGreen)
                        .cornerRadius(10.0)
                    }
                    .padding(.horizontal, 35)
                    .padding(.top, 5)
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Wine Details")
                            .font(.custom("Didot", size: 24))
                            .bold()
                            .foregroundColor(AppColour.cBlack)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        VStack {
                            Text("Price: \(String(format: "RM%.0f", wine.price))")
                                .font(.custom("Didot", size: 28))
                                .bold()
                                .foregroundColor(AppColour.cYellow)
                                .padding(.horizontal, 80)
                                .padding(.top, 20)
                            
                            Text("Rating: \(String(format: "%.1f", wine.rating))")
                                .font(.custom("Didot", size: 28))
                                .bold()
                                .foregroundColor(AppColour.cYellow)
                                .padding(.bottom, 20)
                        }
                        .background(AppColour.cDarkGreen)
                        .cornerRadius(10.0)
                    }
                    .padding(.horizontal, 35)
                    .padding(.vertical, 5)
                    
                    Spacer()
                    
                    if isLogin {
                        Button(action: {
                            print("Add to Cart")
                            
                            self.showAddToCartView = true
                            
                            addWineToCart(
                                customer: userSessionName ?? "",
                                wine: wine.name,
                                bottleImage: wine.bottleImage,
                                price: wine.price,
                                quantity: 1
                            )
                        }) {
                            HStack {
                                Spacer()
                                Text("Add to Cart")
                                    .font(.custom("Didot", size: 16))
                                    .bold()
                                    .foregroundColor(AppColour.cYellow)
                                    .padding(5)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .background(AppColour.cLightGreen)
                                    .cornerRadius(50)
                            }
                        }
                        .padding(.vertical, 40)
                        .padding(.leading, 200)
                        .padding(.trailing, 35)
                    }
                }
            }
        }
        .background(AppColour.cYellow)
        .navigationBarHidden(true)
    }
}

struct WineDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let wine = Wine(
            name: "Default Wine",
            price: 0,
            phrase: "Default Phrase",
            content: "Default Content",
            rating: 0.0,
            bottleImage: "Default Bottle Image",
            coverImage: "Default Cover Image"
        )
        
        WineDetailsView(
            isLogin: .constant(false),
            wine: Wine(
                name: wine.name,
                price: wine.price,
                phrase: wine.phrase,
                content: wine.content,
                rating: wine.rating,
                bottleImage: wine.bottleImage,
                coverImage: wine.coverImage
            )
        )
    }
}
