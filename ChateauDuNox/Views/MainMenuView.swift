//
//  MainMenuView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 13/03/2023.
//

import SwiftUI
import BottomBar_SwiftUI

let bottomBarItemsWhenLogin: [BottomBarItem] = [
    BottomBarItem(icon: "person.crop.circle", title: "Profile", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
    BottomBarItem(icon: "house", title: "Main Menu", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
    BottomBarItem(icon: "shippingbox", title: "Crate", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
    BottomBarItem(icon: "cart", title: "Order", color: Color(red: 103/255, green: 132/255, blue: 56/255))
]

struct MainMenuView: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    let item: BottomBarItem
    
    var body: some View {
        VStack {
            Text("Main Menu")
        }
    }
}

struct MainMenuContentView: View {
    @State private var selectedIndex: Int = 0
    
    var selectedItem: BottomBarItem {
        bottomBarItemsWhenLogin[selectedIndex]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                switch selectedIndex {
                case 0:
                    ProfileView()
                case 1:
                    MainMenuView(item: bottomBarItemsWhenLogin[1])
                case 2:
                    CrateView()
                case 3:
                    OrderView()
                default:
                    EmptyView()
                }
                
                BottomBar(selectedIndex: $selectedIndex, items: bottomBarItemsWhenLogin)
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(item: bottomBarItemsWhenLogin[1])
    }
}
