//
//  LoginView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI
import BottomBar_SwiftUI

// Bottom Bar Items
let bottomBarItems: [BottomBarItem] = [
    BottomBarItem(icon: "person.crop.circle", title: "Login", color: Color(red: 103/255, green: 132/255, blue: 56/255)),
    BottomBarItem(icon: "house", title: "Main Menu", color: Color(red: 103/255, green: 132/255, blue: 56/255))
]

struct LoginView: View {
    // State Boolean
    @State var showSignupView = false
    @State var showForgotView = false
    
    @State var isLoginViewActive = false
    @State var isGuestMenuViewActive = false
    
    @State var isAuthenticated = false
    @State var isLogin = false
    
    // State Variables
    @State private var inUsername = ""
    @State private var inPassword = ""
    
    var body: some View {
        VStack {
            Image("pinot-noir-cover")
                .resizable()
                .scaledToFill()
                .frame(height: 225)
                .clipped()
                .ignoresSafeArea()
            
            Text("Chateau Du Nox")
                .font(.custom("Didot", size: 44))
                .bold()
                .foregroundColor(AppColour.cBlack)
                .padding(.bottom, 50)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Username")
                    .font(.custom("Avenir Next", size: 18))
                    .foregroundColor(AppColour.cBlack)
                
                TextField("Enter username", text: $inUsername)
                    .font(.custom("Avenir Next", size: 18))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Password")
                    .font(.custom("Avenir Next", size: 18))
                    .foregroundColor(AppColour.cBlack)
                
                SecureField("Enter password", text: $inPassword)
                    .font(.custom("Avenir Next", size: 18))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 50)
            
            Button(action: {
                print("Login")
                
                print(userAuthentication(username: inUsername, password: inPassword))
                
                if(userAuthentication(username: inUsername, password: inPassword)) {
                    self.authenticate()
                }
            }) {
                Text("Login")
                    .font(.custom("Didot", size: 20))
                    .bold()
                    .foregroundColor(AppColour.cYellow)
                    .padding(10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(AppColour.cDarkGreen)
                    .cornerRadius(50)
            }
            .padding(.horizontal, 120)
            .padding(.bottom, 20)
            .disabled(!self.canAuthenticate())
            .background(
                NavigationLink(destination: MainMenuContentView(), isActive: self.$isAuthenticated) {
                    EmptyView()
                }
            )
            
            VStack {
                Button(action: {
                    self.showSignupView = true
                }) {
                    Text("Register")
                        .font(.custom("Didot", size: 14))
                        .foregroundColor(AppColour.cBlack)
                }
                .sheet(isPresented: $showSignupView) {
                    SignupView(showSignupView: $showSignupView)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    self.showForgotView = true
                }) {
                    Text("Forgot Password")
                        .font(.custom("Didot", size: 14))
                        .foregroundColor(AppColour.cBlack)
                }
                .sheet(isPresented: $showForgotView) {
                    ForgotView(showForgotView: $showForgotView)
                }
                .padding(.bottom, 10)
            }
        }
        .navigationBarHidden(true)
    }
    
    // Enable and disable button
    private func canAuthenticate() -> Bool {
        !self.inUsername.isEmpty && !self.inPassword.isEmpty
    }
    
    private func authenticate() {
        self.isAuthenticated = true
    }
}

struct LoginContentView: View {
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
                        LoginView()
                    case 1:
                        GuestMenuView()
                    default:
                        EmptyView()
                    }
                    
                    BottomBar(selectedIndex: $selectedIndex, items: bottomBarItems)
                        .background(AppColour.cYellow)
                        .padding(.horizontal, 60.0)
                }
                .background(AppColour.cYellow)
            }
            .navigationBarBackButtonHidden(true)
        }
        .background(AppColour.cYellow)
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
