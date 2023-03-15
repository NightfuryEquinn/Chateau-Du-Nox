//
//  SignupView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI
import CoreData

struct SignupView: View {
    // Database
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var users: FetchedResults<User>
    
    // State Variables
    @State private var newUsername = ""
    @State private var newPassword = ""
    @State private var newEmail = ""
    @State private var newContact = ""
    @State private var newAddress = ""
    
    // State Bool
    @State private var usernameExists = false
    @State private var emailExists = false
    
    // Binding Variables
    @Binding var showSignupView: Bool
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image("barbera-cover")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom, 20)
                    
                    Text("New Oenophile")
                        .font(.custom("Didot", size: 36))
                        .bold()
                        .foregroundColor(AppColour.cBlack)
                        .padding(.bottom, 60)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Username
                        Text("Username")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        TextField("Enter username", text: $newUsername)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Password
                        Text("Password")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        SecureField("Enter password", text: $newPassword)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Email Address
                        Text("Email Address")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        TextField("Enter email address", text: $newEmail)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Contact Number
                        Text("Contact")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        TextField("Enter contact", text: $newContact)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        // Address
                        Text("Address")
                            .font(.custom("Avenir Next", size: 18))
                            .foregroundColor(AppColour.cBlack)
                        
                        TextField("Enter address", text: $newAddress)
                            .font(.custom("Avenir Next", size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                    
                    Button(action: {
                        if checkUsernameExists() {
                            print("Username exist")
                        } else if checkEmailExists() {
                            print("Email exist")
                        } else {
                            addUser()
                            
                            showSignupView = false
                        }
                    }) {
                        Text("Register")
                            .font(.custom("Didot", size: 20))
                            .bold()
                            .foregroundColor(AppColour.cYellow)
                            .padding(10)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(AppColour.cDarkGreen)
                            .cornerRadius(50)
                    }
                    .padding(.horizontal, 120)
                    .padding(.bottom, 30)
                    .disabled(!self.canAuthenticate())
                    
                    Button(action: {
                        showSignupView = false
                    }) {
                        Text("I already have an account")
                            .font(.custom("Didot", size: 14))
                            .foregroundColor(AppColour.cBlack)
                    }
                    .onTapGesture {
                        showSignupView = false
                    }
                    .padding(.horizontal, 80)
                    .padding(.bottom, 30)
                }
            }
        }
    }
    
    // Save New User
    private func addUser() {
        let user = User(context: viewContext)
        
        user.name = newUsername
        user.password = newPassword
        user.email = newEmail
        user.contact = newContact
        user.address = newAddress
        
        do {
            try viewContext.save()
            
            print("New User")
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
    
    // Check for existing username
    private func checkUsernameExists() -> Bool {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "name == %@", newUsername)
        request.fetchLimit = 1
        
        do {
            let users = try viewContext.fetch(request)
            return !users.isEmpty
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
            return false
        }
    }
    
    // Check for existing email address
    private func checkEmailExists() -> Bool {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "email == %@", newEmail)
        request.fetchLimit = 1
        
        do {
            let users = try viewContext.fetch(request)
            return !users.isEmpty
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
            return false
        }
    }
    
    // Enable and disable button
    private func canAuthenticate() -> Bool {
        !self.newUsername.isEmpty && !self.newPassword.isEmpty && !self.newEmail.isEmpty && !self.newContact.isEmpty && !self.newAddress.isEmpty
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(showSignupView: .constant(false))
    }
}
