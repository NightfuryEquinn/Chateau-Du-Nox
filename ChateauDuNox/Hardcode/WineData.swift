//
//  WineData.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 13/03/2023.
//

import Foundation

struct WineData {
    static let wineData: [Wine] = [
        Wine(
            name: "Pinot Noir",
            price: 135,
            phrase: "Pinot Noir is a delicate and elegant red wine with aromas of red fruit, flowers, and spices.",
            content: "Pinot Noir is a red wine grape variety that is famous for its complex, delicate and elegant flavor profile. It is grown in many wine regions around the world, including Burgundy, California, Oregon, and New Zealand. Pinot Noir is known for its aromas of red fruit, flowers, and spices, as well as its medium body and silky texture. Pinot Noir pairs well with a variety of foods, including salmon, duck, pork, and mushroom dishes.",
            rating: 8.9,
            bottleImage: "pinot-noir-bottle",
            coverImage: "pinot-noir-grapes"
        ),
        Wine(
            name: "Erbaluce",
            price: 156,
            phrase: "Erbaluce is a white grape variety known for its crisp acidity, mineral notes, and flavors of citrus and green apple.",
            content: "Erbaluce is a white grape variety that is primarily grown in the Piedmont region of northern Italy. It is used to produce both still and sparkling wines. Erbaluce wines are known for their crisp acidity, mineral notes, and flavors of citrus and green apple. The wine is often paired with seafood, poultry, and pasta dishes.",
            rating: 7.6,
            bottleImage: "erbaluce-bottle",
            coverImage: "erbaluce-grapes"
        ),
        Wine(
            name: "Barbera",
            price: 214,
            phrase: "Barbera is a red wine grape variety known for its high acidity, deep color, and flavors of dark fruit, chocolate, and spice.",
            content: "Barbera is a red wine grape variety that is primarily grown in the Piedmont region of northern Italy. It is known for its high acidity, deep color, and flavors of dark fruit, chocolate, and spice. Barbera wines are often aged in oak barrels to add complexity and depth to the flavor profile. They pair well with rich and hearty dishes, such as roasted meats and pasta with tomato-based sauces.",
            rating: 6.3,
            bottleImage: "barbera-bottle",
            coverImage: "barbera-grapes"
        ),
        Wine(
            name: "Sauvignon Blanc",
            price: 241,
            phrase: "Blanc is a term used to describe white wine varieties, which vary widely in flavor and aroma.",
            content: "Blanc is a French term that simply means 'white.' It is often used to describe white wine varieties such as Sauvignon Blanc, Chardonnay, and Riesling. Blanc wines vary widely in flavor and aroma, depending on the grape variety and winemaking techniques used. They can range from light and crisp to full-bodied and rich. Blanc wines are often paired with seafood, chicken, and light pasta dishes.",
            rating: 8.6,
            bottleImage: "blanc-bottle",
            coverImage: "blanc-grapes"
        )
    ]
}
