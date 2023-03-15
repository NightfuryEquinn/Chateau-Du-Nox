//
//  MainMenuView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI
import BottomBar_SwiftUI

struct GuestMenuView: View {
    // Bottom Bar Items
    let bottomBarItems: [BottomBarItem] = [
        BottomBarItem(icon: "person.crop.circle", title: "Login", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
        BottomBarItem(icon: "house", title: "Main Menu", color: Color(red: 103/255, green: 132/255, blue: 56/255))
    ]
    
    // Binding Variables
    @Binding var isLoginViewActive: Bool
    @Binding var isGuestMenuViewActive: Bool
    @Binding var selectedIndex: Int
    
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
                    
                    BottomBar(selectedIndex: self.$selectedIndex, items: bottomBarItems)
                        .padding(.horizontal, 60)
                        .onChange(of: selectedIndex) { index in
                            if index == 1 {
                                isGuestMenuViewActive = true
                                isLoginViewActive = false
                                self.selectedIndex = 1
                                
                            } else {
                                isGuestMenuViewActive = false
                                isLoginViewActive = true
                                self.selectedIndex = 0
                            }
                        }
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
    private func filterWines() {
        if searchText.isEmpty {
            filteredWines = wines
        } else {
            filteredWines = wines.filter { wine in
                wine.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct GuestMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GuestMenuView(isLoginViewActive: .constant(false), isGuestMenuViewActive: .constant(false), selectedIndex: .constant(0))
    }
}
