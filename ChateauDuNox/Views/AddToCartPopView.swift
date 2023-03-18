//
//  AddToCartPopView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 18/03/2023.
//

import SwiftUI

struct AddToCartPopView: View {
    // Binding Variables
    @Binding var showAddToCartView: Bool
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("Are you sure to add this wine to your cart?\nYou can check your cart to increase or decrease the quantity you wished to purchase.")
                    .font(.custom("Avenir Next Medium", size: 22))
                    .foregroundColor(AppColour.cBlack)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 35.0)
                
                Button(action: {
                    print("Confirm")
                    
                    showAddToCartView = false
                }) {
                    Text("Confirm")
                        .font(.custom("Avenir Next", size: 18))
                        .bold()
                        .foregroundColor(AppColour.cYellow)
                        .padding(5)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(AppColour.cLightGreen)
                        .cornerRadius(50)
                }
                .padding(.horizontal, 70.0)
            }
            .frame(maxHeight: .infinity)
        }
        .background(AppColour.cYellow)
    }
}

struct AddToCartPopView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartPopView(showAddToCartView: .constant(false))
    }
}
