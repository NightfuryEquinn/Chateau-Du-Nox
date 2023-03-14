//
//  WineDetails.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct WineDetails: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    let wine: Wine
    
    var body: some View {
        GeometryReader { geometry in
            cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image(wine.coverImage)
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 20)
                    
                    Text(wine.name)
                        .font(.custom("Didot", size: 44))
                        .bold()
                        .foregroundColor(cBlack)
                        .padding(.horizontal, 35)
                        .padding(.bottom, 40)
                    
                    Image(wine.bottleImage)
                        .resizable()
                        .frame(width: 125.0, height: 375.0)
                        .cornerRadius(10.0)
                        .aspectRatio(contentMode: .fill)
                        .padding(.trailing, 10)
                        .padding(.bottom, 40)
                    
                    HStack {
                        Text("Wine Details")
                            .font(.custom("Didot", size: 24))
                            .bold()
                            .foregroundColor(cBlack)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        VStack {
                            Text("Price: \(String(format: "RM%.0f", wine.price))")
                                .font(.custom("Avenir Next", size: 28))
                                .foregroundColor(cYellow)
                                .bold()
                                .padding(.horizontal, 80)
                                .padding(.top, 20)
                            
                            Text("Rating: \(String(format: "%.1f", wine.rating))")
                                .font(.custom("Avenir Next", size: 28))
                                .foregroundColor(cYellow)
                                .bold()
                                .padding(.bottom, 20)
                        }
                        .background(cDarkGreen)
                        .cornerRadius(10.0)
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Description")
                            .font(.custom("Didot", size: 24))
                            .bold()
                            .foregroundColor(cBlack)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        VStack {
                            Text(wine.content)
                                .font(.custom("Avenir Next", size: 16))
                                .foregroundColor(cYellow)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 20)
                                .multilineTextAlignment(.center)
                        }
                        .background(cDarkGreen)
                        .cornerRadius(10.0)
                    }
                    .padding(.horizontal, 35)
                    .padding(.vertical, 5)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Add to Cart")
                    }) {
                        HStack {
                            Spacer()
                            Text("Add to Cart")
                                .font(.custom("Didot", size: 16))
                                .bold()
                                .foregroundColor(cYellow)
                                .padding(5)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(cLightGreen)
                                .cornerRadius(50)
                        }
                    }
                    .padding(.vertical, 40)
                    .padding(.leading, 200)
                    .padding(.trailing, 35)
                }
            }
        }
        .background(cYellow)
        .navigationBarHidden(true)
    }
}

struct WineDetails_Previews: PreviewProvider {
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
        
        WineDetails(
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
