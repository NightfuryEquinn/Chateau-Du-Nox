//
//  WineDetails.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct WineDetails: View {
    let wine: Wine
    
    var body: some View {
    
        Text(wine.name)
        
    }
}

struct WineDetails_Previews: PreviewProvider {
    static var previews: some View {
        let wine = Wine(
            name: "Pinot Noir",
            price: 135,
            phrase: "Pinot Noir is a delicate and elegant red wine with aromas of red fruit, flowers, and spices.",
            content: "Pinot Noir is a red wine grape variety that is famous for its complex, delicate and elegant flavor profile. It is grown in many wine regions around the world, including Burgundy, California, Oregon, and New Zealand. Pinot Noir is known for its aromas of red fruit, flowers, and spices, as well as its medium body and silky texture. Pinot Noir pairs well with a variety of foods, including salmon, duck, pork, and mushroom dishes.",
            rating: 8.9,
            bottleImage: "pinot-noir-bottle",
            coverImage: "pinot-noir-grapes"
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
