//
//  ProfileView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct ProfileView: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    var body: some View {
        GeometryReader { geometry in
            cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image("vineyard-cover")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .ignoresSafeArea()
                        .padding(.bottom, 30)
                    
                    Text("Profile")
                        .font(.custom("Didot", size: 44))
                        .bold()
                        .foregroundColor(cBlack)
                        .padding(.bottom, 30)
                    
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
                        .foregroundColor(cBlack)
                        .padding(.bottom, 40)
                    
                    VStack {
                        VStack {
                            Text("Email Address")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(cBlack)
                                .bold()
                            
                            Text("yelan@gmail.com")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(cBlack)
                        }
                        .padding(.bottom, 20)
                        
                        VStack {
                            Text("Contact Number")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(cBlack)
                                .bold()
                            
                            Text("0126553221")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(cBlack)
                        }
                        .padding(.bottom, 20)
                        
                        VStack {
                            Text("Address")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(cBlack)
                                .bold()
                            
                            Text("62, Jalan Liyue, Taman Teyvat, Genshin 98002, Hoyoverse")
                                .font(.custom("Avenir Next", size: 18))
                                .foregroundColor(cBlack)
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 35)
                    
                    Button(action: {
                        print("Edit")
                    }) {
                        HStack {
                            Spacer()
                            Text("Edit")
                                .font(.custom("Didot", size: 16))
                                .bold()
                                .foregroundColor(cYellow)
                                .padding(5)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(cLightGreen)
                                .cornerRadius(50)
                        }
                    }
                    .padding(.vertical, 20)
                    .padding(.leading, 250)
                    .padding(.trailing, 35)
                }
            }
        }
        .background(cYellow)
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
