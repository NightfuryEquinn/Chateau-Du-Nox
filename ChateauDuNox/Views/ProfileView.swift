//
//  ProfileView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct ProfileView: View {
    // State Variables
    @State var showUpdateProfileView = false
    @State var isLogout = false
    
    // Binding Variables
    @Binding var isLogin: Bool
    
    var body: some View {
        VStack {
            Image("vineyard-cover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .edgesIgnoringSafeArea(.all)
                .padding(.bottom, 30)
            
            Text("Profile")
                .font(.custom("Didot", size: 44))
                .bold()
                .foregroundColor(AppColour.cBlack)
                .padding(.bottom, 15)
            
            ScrollView {
                Image("pp-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(100.0)
                    .padding(.bottom, 20)
                    .aspectRatio(contentMode: .fill)
                
                Text(userSessionName ?? "Unknown")
                    .font(.custom("Didot", size: 32))
                    .bold()
                    .foregroundColor(AppColour.cBlack)
                    .padding(.bottom, 40)
                
                VStack {
                    VStack {
                        Text("Email Address")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                            .bold()
                        
                        Text(userSessionEmail ?? "unknown@gmail.com")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 20)
                    
                    VStack {
                        Text("Contact Number")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                            .bold()
                        
                        Text(userSessionContact ?? "012xxx1122")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 20)
                    
                    VStack {
                        Text("Address")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                            .bold()
                        
                        Text(userSessionAddress ?? "0, Jalan Unknown, Taman Unknown, 00000 Unknown, Unknown Country")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 35)
                
                HStack(alignment: .center, spacing: 40.0) {
                    Button(action: {
                        print("Logout")
                        
                        obliterateUserSession()
                        
                        isLogin = false
                        self.isLogout = true
                    }) {
                        Text("Logout")
                            .font(.custom("Didot", size: 16))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(5)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cLightGreen)
                            .cornerRadius(50)
                    }
                    .background(
                        NavigationLink(destination: LoginContentView(isLogin: isLogin), isActive: $isLogout) {
                            EmptyView()
                        }
                    )
                    
                    Button(action: {
                        print("Edit")
                        
                        self.showUpdateProfileView = true
                    }) {
                        Text("Edit")
                            .font(.custom("Didot", size: 16))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(5)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cLightGreen)
                            .cornerRadius(50)
                    }
                    .padding(.vertical, 20)
                    .sheet(isPresented: $showUpdateProfileView) {
                        UpdateProfileView(showUpdateProfileView: $showUpdateProfileView)
                    }
                }
                .padding(.horizontal, 35.0)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isLogin: .constant(false))
    }
}
