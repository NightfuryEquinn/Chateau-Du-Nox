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
    let item: BottomBarItem
    
    // Wines Data
    let wines = WineData.wineData
    
    // State Variables
    @State private var searchText = ""
    @State private var filteredWines = [Wine]()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                AppColour.cYellow.ignoresSafeArea()
                
                VStack {
                    Image("chateauLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 10)
                        .padding(.bottom, 75)
                    
                    SearchBarStruct(text: $searchText)
                        .onChange(of: searchText) { searchText in
                            if searchText.isEmpty {
                                filteredWines = wines
                            } else {
                                filteredWines = wines.filter {
                                    $0.name.lowercased().contains(searchText.lowercased())
                                }
                            }
                        }
                    
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(filteredWines, id:\.self) { wine in
                                WineRowStruct(wine: wine)
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                }
            }
            .background(AppColour.cYellow)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .onAppear {
            filterWines()
        }
    }
        
    // All wines appear first
    func filterWines() {
        if searchText.isEmpty {
            filteredWines = wines
        } else {
            filteredWines = wines.filter { wine in
                wine.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct MainMenuContentView: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    @State private var selectedIndex: Int = 0
    
    var selectedItem: BottomBarItem {
        bottomBarItemsWhenLogin[selectedIndex]
    }
    
    var body: some View {
        GeometryReader { geometry in
            cYellow.ignoresSafeArea()
            
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
                        .background(AppColour.cYellow)
                }
                .background(AppColour.cYellow)
            }
            .navigationBarBackButtonHidden(true)
        }
        .background(AppColour.cYellow)
        .navigationBarHidden(true)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(item: bottomBarItemsWhenLogin[1])
    }
}
