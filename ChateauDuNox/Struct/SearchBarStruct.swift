//
//  SearchBarStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import SwiftUI

struct SearchBarStruct: View {
    // Custom Colors
    let cBlack = Color(red: 0.14, green: 0.17, blue: 0.20)
    let cYellow = Color(red: 238.0/255.0, green: 235.0/255.0, blue: 209.0/255.0)
    let cDarkGreen = Color(red: 68/255, green: 88/255, blue: 39/255)
    let cLightGreen = Color(red: 103/255, green: 132/255, blue: 56/255)
    
    @Binding var text: String
    
    var body: some View {
        TextField("Search", text: $text)
            .font(.custom("Avenir Next", size: 18))
            .foregroundColor(cYellow)
            .background(cLightGreen)
            .padding(.vertical, 20)
            .padding(.horizontal, 35)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
    }
}

struct SearchBarStruct_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        SearchBarStruct(text: $searchText)
    }
}
