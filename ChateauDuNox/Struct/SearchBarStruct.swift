//
//  SearchBarStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import SwiftUI

struct SearchBarStruct: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Search", text: $text)
            .font(.custom("Avenir Next", size: 18))
            .foregroundColor(AppColour.cYellow)
            .background(AppColour.cLightGreen)
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
