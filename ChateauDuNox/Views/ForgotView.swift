//
//  ForgotView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI

struct ForgotView: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    @State private var email = ""
    @State private var newPassword = ""
    
    var body: some View {
        GeometryReader { geometry in
            cYellow.ignoresSafeArea()
            
            VStack {
                Image("riesling-cover")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 20)
                
                Text("Forgot Password")
                    .font(.custom("Verdana", size: 36))
                    .bold()
                    .foregroundColor(cBlack)
                    .padding(.bottom, 60)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Email Address")
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(cBlack)
                    
                    TextField("Email Address", text: $email)
                        .font(.custom("Futura", size: 18))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("New Password")
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(cBlack)
                    
                    SecureField("New Password", text: $newPassword)
                        .font(.custom("Futura", size: 18))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 60)
                
                Button(action: {
                    print("Update")
                }) {
                    Text("Update")
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
                    print("Contact Service")
                }) {
                    Text("Contact Service")
                        .font(.custom("Verdana", size: 14))
                        .foregroundColor(cBlack)
                }
                .padding(.horizontal, 80)
                .padding(.bottom, 30)
            }
            .background(cYellow)
        }
    }
}

struct ForgotView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotView()
    }
}
