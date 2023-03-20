//
//  UpdateProfileView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import SwiftUI

struct UpdateProfileView: View {
    // State Variables
    @State private var editPassword = UserDefaults.standard.string(forKey: "userSessionPassword") ?? ""
    @State private var editEmail = UserDefaults.standard.string(forKey: "userSessionEmail") ?? ""
    @State private var editContact = UserDefaults.standard.string(forKey: "userSessionContact") ?? ""
    @State private var editAddress = UserDefaults.standard.string(forKey: "userSessionAddress") ?? ""
    
    // Binding Variables
    @Binding var showUpdateProfileView: Bool
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image("vineyard-cover")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 20)
                    
                    Text("Edit Profile")
                        .font(.custom("Didot", size: 36))
                        .bold()
                        .foregroundColor(AppColour.cBlack)
                        .padding(.bottom, 60)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Password")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        SecureField("Password", text: $editPassword)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Email Address")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        TextField("Email Address", text: $editEmail)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Contact Number")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        TextField("Contact Number", text: $editContact)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Address")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        TextField("Address", text: $editAddress)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                }
                
                Button(action: {
                    print("Edit Update")
                    
                    if isValidEmail(email: editEmail) {
                        if isValidContact(contact: editContact) {
                            print("Edited and Updated")
                            
                            updateUserInfo(password: editPassword, email: editEmail, contact: editContact, address: editAddress)
                            
                            showUpdateProfileView = false
                        } else {
                            print("Invalid contact")
                        }
                    } else {
                        print("Invalid email")
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Update")
                            .font(.custom("Didot", size: 16))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(5)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cLightGreen)
                            .cornerRadius(50)
                    }
                }
                .padding(.bottom, 20)
                .padding(.leading, 250)
                .padding(.trailing, 35)
                .disabled(!self.canAuthenticate())
            }
            .background(AppColour.cYellow)
        }
    }
    
    // Enable and disable button
    private func canAuthenticate() -> Bool {
        !self.editPassword.isEmpty && !self.editEmail.isEmpty && !self.editContact.isEmpty && !self.editAddress.isEmpty
    }
}

struct UpdateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileView(showUpdateProfileView: .constant(false))
    }
}
