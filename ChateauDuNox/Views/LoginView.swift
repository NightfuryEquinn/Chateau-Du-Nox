//
//  LoginView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI

struct LoginView: View {
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    
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
                    .font(Font.custom("Vollkorn-Regular", size: 24))
                    .foregroundColor(cBlack)
                    .padding(.bottom, 40)
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
