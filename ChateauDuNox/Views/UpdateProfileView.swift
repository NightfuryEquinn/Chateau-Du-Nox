//
//  UpdateProfileView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import SwiftUI
import CoreData

struct UpdateProfileView: View {
    // Database
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var users: FetchedResults<User>
    
    // State Variables
    @State private var editPassword = UserDefaults.standard.string(forKey: "userSessionPassword") ?? ""
    @State private var editEmail = UserDefaults.standard.string(forKey: "userSessionEmail") ?? ""
    @State private var editContact = UserDefaults.standard.string(forKey: "userSessionContact") ?? ""
    @State private var editAddress = UserDefaults.standard.string(forKey: "userSessionAddress") ?? ""
    
    @State private var showUpdateAlert = false
    @State private var showEmailAlert = false
    @State private var showInvalidAlert = false
    
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
                            .alert(isPresented: $showEmailAlert) {
                                Alert(
                                    title: Text("Email Exists"),
                                    message: Text("Email address has already been taken."),
                                    dismissButton: .default(Text("Okay"))
                                )
                            }
                        
                        Text("Contact Number")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        TextField("Contact Number", text: $editContact)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .alert(isPresented: $showInvalidAlert) {
                                Alert(
                                    title: Text("Invalid Phone or Email Address"),
                                    message: Text("Please confirm that your phone number is between 10 - 11 digits and your email address is correct."),
                                    dismissButton: .default(Text("Okay"))
                                )
                            }
                        
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
                    if isValidEmail(email: editEmail) {
                        if isValidContact(contact: editContact) {
                            if !checkEmailExists() {
                                updateUserInfo(password: editPassword, email: editEmail, contact: editContact, address: editAddress)
                                
                                showUpdateAlert = true
                            } else {
                                showEmailAlert = true
                            }
                        } else {
                            showInvalidAlert = true
                        }
                    } else {
                        showInvalidAlert = true
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
                .alert("Update Success", isPresented: $showUpdateAlert) {
                    Button("Okay", action: {
                        showUpdateProfileView = false
                    })
                }
            }
            .background(AppColour.cYellow)
        }
    }
    
    // Enable and disable button
    private func canAuthenticate() -> Bool {
        !self.editPassword.isEmpty && !self.editEmail.isEmpty && !self.editContact.isEmpty && !self.editAddress.isEmpty
    }
    
    // Check for existing email address
    private func checkEmailExists() -> Bool {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "email == %@", editEmail)
        request.fetchLimit = 1
        
        do {
            let users = try viewContext.fetch(request)
            
            return !users.isEmpty
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
            return false
        }
    }
}

struct UpdateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileView(showUpdateProfileView: .constant(false))
    }
}
