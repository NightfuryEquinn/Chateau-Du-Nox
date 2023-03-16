//
//  MainMenuView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 13/03/2023.
//

import SwiftUI
import BottomBar_SwiftUI

let bottomBarItemsWhenLogin: [BottomBarItem] = [
    BottomBarItem(icon: "person.crop.circle", title: "Profile", color: AppColour.cLightGreen),
    BottomBarItem(icon: "house", title: "Main Menu", color: AppColour.cLightGreen),
    BottomBarItem(icon: "shippingbox", title: "Crate", color: AppColour.cLightGreen),
    BottomBarItem(icon: "cart", title: "Order", color: AppColour.cLightGreen)
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
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
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
    @State private var selectedIndex: Int = 0
    
    var selectedItem: BottomBarItem {
        bottomBarItemsWhenLogin[selectedIndex]
    }
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
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
