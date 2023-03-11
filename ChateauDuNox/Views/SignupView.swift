//
//  SignupView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI

struct SignupView: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    @State private var newUsername = ""
    @State private var newPassword = ""
    @State private var newEmail = ""
    @State private var newContact = ""
    @State private var newAddress = ""
    
    @Binding var showSignupView: Bool
    
    var body: some View {
        GeometryReader { geometry in
            cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image("barbera-cover")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 20)
                    
                    Text("New Oenophile")
                        .font(.custom("Verdana", size: 36))
                        .bold()
                        .foregroundColor(cBlack)
                        .padding(.bottom, 60)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Username
                        Text("Username")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(cBlack)
                        
                        TextField("Enter username", text: $newUsername)
                            .font(.custom("Futura", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Password
                        Text("Password")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(cBlack)
                        
                        SecureField("Enter password", text: $newPassword)
                            .font(.custom("Futura", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Email Address
                        Text("Email Address")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(cBlack)
                        
                        TextField("Enter email address", text: $newEmail)
                            .font(.custom("Futura", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Contact Number
                        Text("Contact")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(cBlack)
                        
                        TextField("Enter contact", text: $newContact)
                            .font(.custom("Futura", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Address
                        Text("Address")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(cBlack)
                        
                        TextField("Enter address", text: $newAddress)
                            .font(.custom("Futura", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                    
                    Button(action: {
                        print("Register")
                    }) {
                        Text("Register")
                            .font(.custom("Verdana", size: 20))
                            .bold()
                            .foregroundColor(cYellow)
                            .padding(10)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(cDarkGreen)
                            .cornerRadius(50)
                    }
                    .padding(.horizontal, 120)
                    .padding(.bottom, 30)
                    
                    
                    Button(action: {
                        showSignupView = false
                    }) {
                        Text("I already have an account")
                            .font(.custom("Verdana", size: 14))
                            .foregroundColor(cBlack)
                    }
                    .onTapGesture {
                        showSignupView = false
                    }
                    .padding(.horizontal, 80)
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(showSignupView: .constant(false))
    }
}
