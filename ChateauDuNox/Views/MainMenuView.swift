//
//  MainMenuView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI
import BottomBar_SwiftUI

struct MainMenuView: View {
    // Bottom Bar Items
    let bottomBarItems: [BottomBarItem] = [
        BottomBarItem(icon: "person.crop.circle", title: "Profile", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
        BottomBarItem(icon: "house", title: "Main Menu", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
        BottomBarItem(icon: "house", title: "Crate", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
        BottomBarItem(icon: "house", title: "Order", color: Color(red: 103/255, green: 132/255, blue: 56/255))
    ]
    
    var body: some View {
        NavigationView {
            Text("Main Menu")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
