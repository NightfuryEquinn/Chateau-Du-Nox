//
//  PaymentView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 16/03/2023.
//

import SwiftUI

struct PaymentView: View {
    // State Variables
    @State private var cardNumber = ""
    @State private var isCardNumberValid = false
    
    @State private var cvv = ""
    @State private var isCVVValid = false
    
    @State private var expirationDate = ""
    @State private var isExpirationDateValid = false
    
    // Binding Variables
    @Binding var showPaymentView: Bool
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image("cellar-cover")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 30)
                    
                    Text("Payment")
                        .font(.custom("Didot", size: 44))
                        .bold()
                        .foregroundColor(AppColour.cBlack)
                        .padding(.bottom, 15)
                    
                    HStack {
                        HStack(alignment: .center, spacing: 15.0) {
                            Image("visa")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 25)
                                
                            
                            Image("mastercard")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 25)
                        }
                        .background(AppColour.cDarkGreen)
                        .padding(35.0)
                    }
                    .padding(35.0)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
        .background(AppColour.cYellow)
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(showPaymentView: .constant(false))
    }
}
