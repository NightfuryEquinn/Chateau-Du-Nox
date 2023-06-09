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
    // State Variables
    @State var showSignupView = false
    @State var showForgotView = false
    
    @State var isLoginViewActive = false
    @State var isGuestMenuViewActive = false
    
    @State var isAuthenticated = false
    
    @State private var showErrorAlert = false
    
    @State private var inUsername = ""
    @State private var inPassword = ""
    
    // Binding Variables
    @Binding var isLogin: Bool
    
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
                if(userAuthentication(username: inUsername, password: inPassword)) {
                    self.authenticate()
                    
                    createUserSession(username: inUsername, password: inPassword)
                    
                    isLogin = true
                } else {
                    showErrorAlert = true
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
                NavigationLink(destination: MainMenuContentView(isLogin: $isLogin), isActive: self.$isAuthenticated) {
                    EmptyView()
                }
            )
            .alert(isPresented: $showErrorAlert) {
                Alert(
                    title: Text("Invalid Username or Password"),
                    message: Text("The username does not existing or password is incorrect. Please try again."),
                    dismissButton: .default(Text("Okay"))
                )
            }
            
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
    // State Variables
    @State private var selectedIndex: Int = 0
    @State var isLogin = false
    
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
                        LoginView(isLogin: $isLogin)
                    case 1:
                        GuestMenuView(isLogin: $isLogin)
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
        LoginView(isLogin: .constant(false))
    }
}
