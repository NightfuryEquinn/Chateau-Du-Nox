//
//  WineRowStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import SwiftUI

struct WineRowStruct: View {
    // State Variables
    @State var showWineDetailsView = false
    
    let wine: Wine

    var body: some View {
        HStack(spacing: 16) {
            Image(wine.bottleImage)
                .resizable()
                .frame(width: 60.0, height: 175.0)
                .cornerRadius(10.0)
                .aspectRatio(contentMode: .fill)
                .padding(.trailing, 10)

            VStack(alignment: .leading, spacing: 4.0) {
                Text(wine.name)
                    .font(.custom("Didot", size: 24))
                    .bold()
                    .foregroundColor(AppColour.cBlack)
                
                Text(wine.phrase)
                    .font(.custom("Avenir Next", size: 14))
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
                    .foregroundColor(AppColour.cBlack)
                    .multilineTextAlignment(.leading)
                
                Text(String(format: "RM%.0f", wine.price))
                    .font(.custom("Didot", size: 20))
                    .padding(.bottom, 10)
                    .foregroundColor(AppColour.cBlack)
                
                HStack {
                    Button(action: {
                        print("More")
                        
                        self.showWineDetailsView = true
                    }) {
                        Text("More")
                            .font(.custom("Didot", size: 16))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(5)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cDarkGreen)
                            .cornerRadius(50)
                    }
                    .padding(.trailing, 100)
                    .padding(.vertical, 10)
                    .sheet(isPresented: $showWineDetailsView) {
                        WineDetailsView(wine: wine)
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct WineRowStruct_Previews: PreviewProvider {
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
        
        WineRowStruct(
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
