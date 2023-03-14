//
//  MainMenuView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 13/03/2023.
//

import SwiftUI
import BottomBar_SwiftUI

struct MainMenuView: View {
    let bottomBarItemsWhenLogin: [BottomBarItem] = [
        BottomBarItem(icon: "person.crop.circle", title: "Profile", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
        BottomBarItem(icon: "house", title: "Main Menu", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
        BottomBarItem(icon: "shippingbox", title: "Crate", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
        BottomBarItem(icon: "cart", title: "Order", color: Color(red: 103/255, green: 132/255, blue: 56/255))
    ]
    
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    var body: some View {
        Text("Main Menu")
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
