//
//  CrateView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 14/03/2023.
//

import SwiftUI

struct CrateView: View {
    // State Variables
    @State var quantity: Int = 1
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image("barrel-cover")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 30)
                    
                    Text("My Cart")
                        .font(.custom("Didot", size: 44))
                        .bold()
                        .foregroundColor(AppColour.cBlack)
                        .padding(.bottom, 15)
                    
                    VStack {
                        VStack {
                            HStack {
                                Image("pinot-noir-bottle")
                                    .resizable()
                                    .frame(width: 60.0, height: 175.0)
                                    .cornerRadius(10.0)
                                    .aspectRatio(contentMode: .fill)
                                    .padding(.trailing, 20)
                                
                                VStack {
                                    Text("Pinot Noir")
                                        .font(.custom("Didot", size: 24))
                                        .bold()
                                        .foregroundColor(AppColour.cYellow)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("RM135")
                                        .font(.custom("Didot", size: 20))
                                        .padding(.bottom, 10)
                                        .foregroundColor(AppColour.cYellow)
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack {
                                        Button(action: {
                                            // Increase quantity
                                            self.quantity += 1
                                        }) {
                                            Image(systemName: "plus")
                                                .foregroundColor(AppColour.cLightGreen)
                                                .background(AppColour.cYellow)
                                                .padding(5)
                                                .cornerRadius(10.0)
                                        }
                                        
                                        Text("\(quantity)")
                                            .font(.custom("Didot", size: 20))
                                            .padding(.bottom, 10)
                                            .foregroundColor(AppColour.cYellow)
                                        
                                        Button(action: {
                                            // Decrease quantity
                                            if self.quantity > 1 {
                                                self.quantity -= 1
                                            }
                                        }) {
                                            Image(systemName: "minus")
                                                .foregroundColor(AppColour.cLightGreen)
                                                .background(AppColour.cYellow)
                                                .padding(5)
                                                .cornerRadius(10.0)
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    Button(action: {
                                        print("Remove")
                                    }) {
                                        HStack {
                                            Spacer()
                                            Text("Remove")
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
                                    .padding(.leading, 75)
                                    .padding(.trailing, 35)
                                }
                            }
                        }
                        .padding(20)
                    }
                    .background(AppColour.cDarkGreen)
                    .cornerRadius(10.0)
//                    .padding(.horizontal, 35)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .background(AppColour.cYellow)
        .navigationBarHidden(true)

    }
}

struct CrateView_Previews: PreviewProvider {
    static var previews: some View {
        CrateView()
    }
}
