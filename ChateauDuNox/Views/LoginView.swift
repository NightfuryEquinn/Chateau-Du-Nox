//
//  LoginView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI

struct LoginView: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    // Boolean for View Switching
    @State var showSignupView = false
    @State var showForgotView = false
    
    @State private var inUsername = ""
    @State private var inPassword = ""
    
    var body: some View {
        GeometryReader { geometry in
            cYellow.ignoresSafeArea()
            
            VStack {
                Image("pinot-noir-cover")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 20)
                
                Text("Chateau Du Nox")
                    .font(.custom("Verdana", size: 36))
                    .bold()
                    .foregroundColor(cBlack)
                    .padding(.bottom, 60)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Username")
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(cBlack)
                    
                    TextField("Enter username", text: $inUsername)
                        .font(.custom("Futura", size: 18))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Password")
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(cBlack)
                    
                    SecureField("Enter password", text: $inPassword)
                        .font(.custom("Futura", size: 18))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 60)
                
                Button(action: {
                    print("Login")
                    
                    print(userAuthentication(username: inUsername, password: inPassword))
                }) {
                    Text("Login")
                        .font(.custom("Verdana", size: 20))
                        .bold()
                        .foregroundColor(cYellow)
                        .padding(10)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(cDarkGreen)
                        .cornerRadius(50)
                }
                .padding(.horizontal, 120)
                .padding(.bottom, 60)
                
                HStack {
                    Button(action: {
                        self.showSignupView = true
                    }) {
                        Text("Register")
                            .font(.custom("Verdana", size: 14))
                            .foregroundColor(cBlack)
                    }
                    .sheet(isPresented: $showSignupView) {
                        SignupView(showSignupView: $showSignupView)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.showForgotView = true
                    }) {
                        Text("Forgot Password")
                            .font(.custom("Verdana", size: 14))
                            .foregroundColor(cBlack)
                    }
                    .sheet(isPresented: $showForgotView) {
                        ForgotView()
                    }
                }
                .padding(.horizontal, 80)
            }
            .background(cYellow)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
