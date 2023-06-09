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
    
    @State private var cardHolderName = ""
    
    @State private var showAddressView = false
    @State private var showErrorAlert = false
    
    // Binding Variables
    @Binding var showPaymentView: Bool
    
    @Binding var historyItems: [HistoryItemStruct]
    
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
                                .padding(.vertical, 10.0)
                            
                            Image("mastercard")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 25)
                                .padding(.vertical, 10.0)
                        }
                        .padding(35.0)
                        .background(AppColour.cDarkGreen)
                        .cornerRadius(10.0)
                    }
                    .padding(.horizontal, 35.0)
                    .padding(.bottom, 30.0)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Card Number")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)

                        TextField("xxxx xxxx xxxx xxxx", text: $cardNumber)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: cardNumber, perform: { value in
                                let regex = "^\\d{4} \\d{4} \\d{4} \\d{4}$"
                                let predicate = NSPredicate(format:"SELF MATCHES %@", regex)

                                isCardNumberValid = predicate.evaluate(with: cardNumber)
                            })

                        Text("CVV")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)

                        SecureField("CVV", text: $cvv)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: cvv, perform: { value in
                                let regex = "^\\d{3,4}$"
                                let predicate = NSPredicate(format:"SELF MATCHES %@", regex)

                                isCVVValid = predicate.evaluate(with: cvv)
                            })

                        Text("Expiration Date")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)

                        TextField("Expiration Date", text: $expirationDate)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: expirationDate, perform: { value in
                                let regex = "^(0[1-9]|1[0-2])/(\\d{2})$"
                                let predicate = NSPredicate(format:"SELF MATCHES %@", regex)

                                isExpirationDateValid = predicate.evaluate(with: expirationDate)
                            })

                        Text("Card Holder Name")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)

                        TextField("Card Holder Name", text: $cardHolderName)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
                    
                    Button(action: {
                        if isCardNumberValid && isCVVValid && isExpirationDateValid {
                            self.showAddressView = true
                        } else {
                            showErrorAlert = true
                        }
                    }) {
                        Text("Proceed")
                            .font(.custom("Didot", size: 20))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(10)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cDarkGreen)
                            .cornerRadius(50)
                    }
                    .padding(.horizontal, 120)
                    .padding(.bottom, 40)
                    .sheet(isPresented: $showAddressView) {
                        AddressView(showAddressView: $showAddressView, showPaymentView: $showPaymentView, historyItems: $historyItems)
                    }
                    .alert(isPresented: $showErrorAlert) {
                        Alert(
                            title: Text("Invalid fields or empty fields."),
                            message: Text("Please ensure that your card number, CVV, expiration date and card holder name are entered correctly."),
                            dismissButton: .default(Text("Okay"))
                        )
                    }
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
        let historyItem = HistoryItemStruct(
            wine: "Default Wine",
            customer: "Default Customer",
            bottleImage: "Default Image",
            orderedDate: Date(),
            deliveredDate: nil,
            address: "Default Address",
            quantity: 0,
            totalPrice: 0
        )
        
        PaymentView(showPaymentView: .constant(false), historyItems: .constant([historyItem]))
    }
}
