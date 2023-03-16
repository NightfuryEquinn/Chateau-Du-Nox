//
//  HistoryView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack {
            Image("chateauLogo")
                .resizable()
                .scaledToFill()
                .frame(height: 10)
                .padding(.bottom, 75)
            
            Text("Order History")
                .font(.custom("Didot", size: 44))
                .bold()
                .foregroundColor(AppColour.cBlack)
                .padding(.bottom, 15)
            
            FilterBarStruct()
            
            ScrollView {
                LazyVStack {
                    Text("Lazy")
                }
            }
        }
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
