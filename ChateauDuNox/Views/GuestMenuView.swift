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
    
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    // Binding Variables
    @Binding var isLoginViewActive: Bool
    @Binding var isGuestMenuViewActive: Bool
    @Binding var selectedIndex: Int
    
    // Wines Data
    let wines = WineData.wineData
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                cYellow.ignoresSafeArea()
                
                VStack {
                    Image("chateauLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 10)
                        .padding(.bottom, 75)
                    
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(wines, id:\.self) { wine in
                                WineRow(wine: wine)
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
            .background(cYellow)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

struct WineRow: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    // State Variables
    @State var showWineDetails = false
    
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
                    .foregroundColor(cBlack)
                
                Text(wine.phrase)
                    .font(.custom("Avenir Next", size: 14))
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
                    .foregroundColor(cBlack)
                    .multilineTextAlignment(.leading)
                
                Text(String(format: "RM%.0f", wine.price))
                    .font(.custom("Didot", size: 20))
                    .padding(.bottom, 10)
                    .foregroundColor(cBlack)
                
                HStack {
                    Button(action: {
                        print("More")
                        
                        self.showWineDetails = true
                    }) {
                        Text("More")
                            .font(.custom("Didot", size: 16))
                            .bold()
                            .foregroundColor(cYellow)
                            .padding(5)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(cDarkGreen)
                            .cornerRadius(50)
                    }
                    .padding(.trailing, 100)
                    .padding(.vertical, 10)
                    .sheet(isPresented: $showWineDetails) {
                        WineDetails(wine: wine)
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct GuestMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GuestMenuView(isLoginViewActive: .constant(false), isGuestMenuViewActive: .constant(false), selectedIndex: .constant(0))
    }
}
