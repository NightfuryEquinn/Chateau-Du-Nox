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
          price: 842,
          phrase: "Pinot Noir is a delicate and elegant red wine with aromas of red fruit, flowers, and spices.",
          content: "Pinot Noir is a red wine grape variety that is famous for its complex, delicate and elegant flavor profile. It is grown in many wine regions around the world, including Burgundy, California, Oregon, and New Zealand. Pinot Noir is known for its aromas of red fruit, flowers, and spices, as well as its medium body and silky texture. Pinot Noir pairs well with a variety of foods, including salmon, duck, pork, and mushroom dishes.",
          rating: 9.4,
          bottleImage: "pinot-noir-bottle",
          coverImage: "pinot-noir-grapes"
        ),
        Wine(
          name: "Erbaluce",
          price: 677,
          phrase: "Erbaluce is a white grape variety known for its crisp acidity, mineral notes, and flavors of citrus and green apple.",
          content: "Erbaluce is a white grape variety that is primarily grown in the Piedmont region of northern Italy. It is used to produce both still and sparkling wines. Erbaluce wines are known for their crisp acidity, mineral notes, and flavors of citrus and green apple. The wine is often paired with seafood, poultry, and pasta dishes.",
          rating: 9.0,
          bottleImage: "erbaluce-bottle",
          coverImage: "erbaluce-grapes"
        ),
        Wine(
          name: "Barbera",
          price: 486,
          phrase: "Barbera is a red wine grape variety known for its high acidity, deep color, and flavors of dark fruit, chocolate, and spice.",
          content: "Barbera is a red wine grape variety that is primarily grown in the Piedmont region of northern Italy. It is known for its high acidity, deep color, and flavors of dark fruit, chocolate, and spice. Barbera wines are often aged in oak barrels to add complexity and depth to the flavor profile. They pair well with rich and hearty dishes, such as roasted meats and pasta with tomato-based sauces.",
          rating: 7.6,
          bottleImage: "barbera-bottle",
          coverImage: "barbera-grapes"
        ),
        Wine(
          name: "Sauvignon Blanc",
          price: 256,
          phrase: "Blanc is a term used to describe white wine varieties, which vary widely in flavor and aroma.",
          content: "Blanc is a French term that simply means 'white.' It is often used to describe white wine varieties such as Sauvignon Blanc, Chardonnay, and Riesling. Blanc wines vary widely in flavor and aroma, depending on the grape variety and winemaking techniques used. They can range from light and crisp to full-bodied and rich. Blanc wines are often paired with seafood, chicken, and light pasta dishes.",
          rating: 8.6,
          bottleImage: "blanc-bottle",
          coverImage: "blanc-grapes"
        ),
        Wine(
          name: "Chardonnay",
          price: 139,
          phrase: "Chardonnay is a versatile white grape that produces full-bodied wines with fruity and vanilla flavors.",
          content: "Chardonnay is one of the most widely planted white grape varieties, Chardonnay produces a range of styles from crisp and citrusy to rich and buttery. Its versatility in winemaking is due to its ability to take on flavors from the winemaking process, such as oak barrel aging.",
          rating: 8.4,
          bottleImage: "chardonnay-bottle",
          coverImage: "chardonnay-grapes"
        ),
        Wine(
          name: "Arneis",
          price: 778,
          phrase: "Arneis is a white grape that produces aromatic wines with notes of pear and almond.",
          content: " A white grape variety grown primarily in the Piedmont region of Italy, Arneis produces wines with aromas of pear, almond, and white flowers. The wine is known for its light to medium body and crisp acidity, making it a great pairing for seafood, salads, and lighter dishes.",
          rating: 8.9,
          bottleImage: "arneis-bottle",
          coverImage: "arneis-grapes"
        ),
        Wine(
          name: "Cortese",
          price: 9.2,
          phrase: "Cortese is a white grape that produces crisp and light-bodied wines with a delicate citrus aroma.",
          content: "Cortese is an Italian white grape variety grown mainly in the Piedmont region, Cortese produces wines that are light-bodied with a delicate citrus aroma. The wine is often crisp and refreshing, making it a popular choice for warm weather.",
          rating: 436,
          bottleImage: "cortese-bottle",
          coverImage: "cortese-grapes"
        ),
        Wine(
          name: "Negroamaro",
          price: 189,
          phrase: "Negroamaro is a red grape variety primarily grown in southern Italy, known for producing full-bodied, dark and spicy wines.",
          content: "Negroamaro is a full-bodied red grape variety primarily grown in southern Italy. It produces wines with dark fruit flavors, firm tannins, and spicy notes. The grape is often blended with other grapes to add complexity. It's commonly used in the production of Salice Salentino DOC wine and is gaining recognition in the global wine market.",
          rating: 8.6,
          bottleImage: "negroamaro-bottle",
          coverImage: "negroamaro-grapes"
        ),
        Wine(
          name: "Nebbiolo",
          price: 237,
          phrase: "Nebbiolo is a red grape that produces full-bodied wines with flavors of cherry, leather, and rose petals.",
          content: "Nebbiolo is one of Italy's most iconic grape varieties, Nebbiolo produces full-bodied red wines with high acidity and tannins. The wine is known for its flavors of cherry, leather, and rose petals, and is often aged for several years before being consumed.",
          rating: 9.3,
          bottleImage: "nebbiolo-bottle",
          coverImage: "nebbiolo-grapes"
        ),
        Wine(
          name: "Dolcetto",
          price: 762,
          phrase: "Dolcetto is a red grape that produces dry and tannic wines with flavors of blackberry and plum.",
          content: "Dolcetto is a red grape variety that is grown in the Piedmont region of Italy, Dolcetto produces wines that are dry and tannic with flavors of blackberry and plum. The wine is often enjoyed young and is a great pairing for pasta dishes and meat-based meals.",
          rating: 8.7,
          bottleImage: "dolcetto-bottle",
          coverImage: "dolcetto-grapes"
        ),
        Wine(
          name: "Cabernet Sauvignon",
          price: 368,
          phrase: "Cabernet S. is a red grape that produces full-bodied wines with flavors of black currant, tobacco, and vanilla.",
          content: "Cabernet S. is a red grape variety that is grown in many regions around the world, Cabernet Sauvignon produces full-bodied wines with flavors of black currant, tobacco, and vanilla. The wine is often aged in oak barrels, giving it a distinct richness and complexity.",
          rating: 7.4,
          bottleImage: "cabernet-bottle",
          coverImage: "cabernet-grapes"
        ),
        Wine(
          name: "Riesling",
          price: 159,
          phrase: "Riesling is a white grape that produces aromatic wines with flavors of apple, honey, and petrol.",
          content: "Riesling is a red grape variety that is grown in many regions around the world, Cabernet Sauvignon produces full-bodied wines with flavors of black currant, tobacco, and vanilla. The wine is often aged in oak barrels, giving it a distinct richness and complexity.",
          rating: 8.2,
          bottleImage: "riesling-bottle",
          coverImage: "riesling-grapes"
        ),
        Wine(
          name: "Syrah",
          price: 272,
          phrase: "Syrah is a red grape that produces full-bodied wines with flavors of blackberry, pepper, and smoked meat.",
          content: "Syrah is a red grape variety that is grown in many regions around the world, Syrah produces full-bodied wines with flavors of blackberry, pepper, and smoked meat. The wine is often aged in oak barrels, giving it a spicy and smoky complexity.",
          rating: 8.4,
          bottleImage: "syrah-bottle",
          coverImage: "syrah-grapes"
        ),
        Wine(
          name: "Merlot",
          price: 784,
          phrase: "Merlot is a red grape that produces soft and smooth wines with flavors of plum, chocolate, and cherry.",
          content: "Merlot is a red grape variety that is grown in many regions around the world, Merlot produces soft and smooth wines with flavors of plum, chocolate, and cherry. The wine is often blended with other grape varieties, such as Cabernet S., to add complexity and depth.",
          rating: 9.3,
          bottleImage: "merlot-bottle",
          coverImage: "merlot-grapes"
        ),
        Wine(
          name: "Zinfandel",
          price: 136,
          phrase: "Zinfandel is a red grape that produces bold and spicy wines with flavors of blackberry, pepper, and cinnamon.",
          content: "Zinfandel is a red grape variety that is grown mainly in California, Zinfandel produces bold and spicy wines with flavors of blackberry, pepper, and cinnamon. The wine can range from light-bodied and fruity to full-bodied and rich, making it a versatile pairing for a variety of dishes.",
          rating: 8.1,
          bottleImage: "zinfandel-bottle",
          coverImage: "zinfandel-grapes"
        )
    ]
}
