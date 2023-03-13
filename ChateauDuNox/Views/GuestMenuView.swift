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
    
//    let bottomBarItemsWhenLogin: [BottomBarItem] = [
//        BottomBarItem(icon: "person.crop.circle", title: "Profile", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
//        BottomBarItem(icon: "house", title: "Main Menu", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
//        BottomBarItem(icon: "shippingbox", title: "Crate", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
//        BottomBarItem(icon: "cart", title: "Order", color: Color(red: 103/255, green: 132/255, blue: 56/255))
//    ]
    
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)

    // Binding Variables
    @Binding var isLoginViewActive: Bool
    @Binding var isGuestMenuViewActive: Bool
    @Binding var selectedIndex: Int
    
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
                            HStack(spacing: 16) {
                                Image("pinot-noir-bottle")
                                    .resizable()
                                    .frame(width: 60.0, height: 175.0)
                                    .cornerRadius(10.0)
                                    .aspectRatio(contentMode: .fill)
                                    .padding(.trailing, 10)
                                    .foregroundColor(cBlack)
                                
                                VStack(alignment: .leading, spacing: 4.0) {
                                    Text("Pinot Noir")
                                        .font(.custom("Didot", size: 24))
                                        .bold()
                                        .foregroundColor(cBlack)
                                    
                                    Text("Suitable for oenophile who prefer fruity flavor")
                                        .font(.custom("Avenir Next", size: 14))
                                        .padding(.bottom, 20)
                                        .foregroundColor(cBlack)
                                    
                                    Text("RM 135")
                                        .font(.custom("Didot", size: 20))
                                        .padding(.bottom, 30)
                                        .foregroundColor(cBlack)
                                    
                                    HStack {
                                        Button(action: {
                                            print("More")
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
                                    }
                                }
                            }
                            .padding(.vertical, 8)
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

//struct WineRow: View {
//    let wine: Wine
//
//    var body: some View {
//        HStack(spacing: 16) {
//            Image("pinot-noir-bottle")
//                .resizable()
//                .frame(width: 60.0, height: 150.0)
//                .cornerRadius(10.0)
//                .aspectRatio(contentMode: .fill)
//
//            VStack(alignment: .leading, spacing: 4.0) {
//                Text("Pinot Noir")
//                    .font(.custom("Didot", size: 24))
//
//                Text("Suitable for oenophile who prefer fruity flavor")
//                    .font(.custom("Avenir Next", size: 14))
//
//                Text("RM 135")
//                    .font(.custom("Didot", size: 24))
//
//                HStack {
//                    Button(action: {
//                        print("More")
//                    }) {
//                        Text("More")
//                            .font(.custom("Didot", size: 20))
//                    }
//
//                    Button(action: {
//                        print("Add")
//                    }) {
//                        Text("Add")
//                            .font(.custom("Didot", size: 20))
//                    }
//                }
//            }
//        }
//    }
//}

struct GuestMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GuestMenuView(isLoginViewActive: .constant(false), isGuestMenuViewActive: .constant(false), selectedIndex: .constant(0))
    }
}
