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
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            ScrollView {
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
                    
                    Image("pp-placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(100.0)
                        .padding(.bottom, 20)
                        .aspectRatio(contentMode: .fill)
                    
                    Text("Yelan")
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
                            
                            Text("yelan@gmail.com")
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
                            
                            Text("0126553221")
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
                            
                            Text("62, Jalan Liyue, Taman Teyvat, Genshin 98002, Hoyoverse")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(AppColour.cBlack)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 35)
                    
                    Button(action: {
                        print("Edit")
                        
                        self.showUpdateProfileView = true
                    }) {
                        HStack {
                            Spacer()
                            Text("Edit")
                                .font(.custom("Didot", size: 16))
                                .bold()
                                .foregroundColor(AppColour.cYellow)
                                .padding(5)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(AppColour.cLightGreen)
                                .cornerRadius(50)
                        }
                    }
                    .padding(.vertical, 20)
                    .padding(.leading, 250)
                    .padding(.trailing, 35)
                    .sheet(isPresented: $showUpdateProfileView) {
                        UpdateProfileView(showUpdateProfileView: $showUpdateProfileView)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .background(AppColour.cYellow)
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
