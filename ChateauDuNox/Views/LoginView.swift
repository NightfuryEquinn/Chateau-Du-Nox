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
    @State private var showSignupView = false
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        GeometryReader { geometry in
            cYellow.ignoresSafeArea()
            
            VStack {
                Image("pinot-noir-cover")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 40)
                
                
                Text("Chateau Du Nox")
                    .font(.custom("Vollkorn-Regular", size: 40))
                    .foregroundColor(cBlack)
                    .padding(.bottom, 40)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Username")
                        .font(.headline)
                        .foregroundColor(cBlack)
                    
                    TextField("Enter username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(cBlack)
                    
                    SecureField("Enter password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
                
                Button(action: {
                    print("Login")
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(cYellow)
                        .padding(16)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(cDarkGreen)
                        .cornerRadius(50)
                }
                .padding(.horizontal, 120)
                .padding(.bottom, 40)
                
                HStack {
                    Button(action: {
                        self.showSignupView = true
                    }) {
                        Text("Register")
                            .font(.subheadline)
                            .foregroundColor(cBlack)
                    }
                    .sheet(isPresented: $showSignupView) {
                        SignupView()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("To Forgot Password")
                    }) {
                        Text("Forgot Password")
                            .font(.subheadline)
                            .foregroundColor(cBlack)
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
