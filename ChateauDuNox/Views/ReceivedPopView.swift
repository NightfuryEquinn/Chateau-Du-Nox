//
//  ReceivedPopView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 18/03/2023.
//

import SwiftUI

struct ReceivedPopView: View {
    // Binding Variables
    @Binding var showReceivedPopView: Bool
    
    // Environment
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("Please ensure that you received your order.\nConfirm received?\n\nThis action can't be undone.")
                    .font(.custom("Avenir Next Medium", size: 22))
                    .foregroundColor(AppColour.cBlack)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 35.0)
                
                Button(action: {
                    print("Confirm")
                    
                    showReceivedPopView = false
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

struct ReceivedPopView_Previews: PreviewProvider {
    static var previews: some View {
        ReceivedPopView(showReceivedPopView: .constant(false))
    }
}
