//
//  ForgotView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI
import CoreData

struct ForgotView: View {
    // Database
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var users: FetchedResults<User>
    
    // State Variables
    @State private var inEmail = ""
    @State private var inNewPassword = ""
    
    @State private var showCSAlert = false
    @State private var showUpdateAlert = false
    @State private var showInvalidAlert = false
    
    // Binding Variables
    @Binding var showForgotView: Bool
    
    var body: some View {
        GeometryReader { geometry in
            AppColour.cYellow.ignoresSafeArea()
            
            VStack {
                Image("riesling-cover")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 20)
                
                Text("Forgot Password")
                    .font(.custom("Didot", size: 36))
                    .bold()
                    .foregroundColor(AppColour.cBlack)
                    .padding(.bottom, 60)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Email Address")
                        .font(.custom("Avenir Next", size: 18))
                        .foregroundColor(AppColour.cBlack)
                    
                    TextField("Email Address", text: $inEmail)
                        .font(.custom("Avenir Next", size: 18))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .alert(isPresented: $showInvalidAlert) {
                            Alert(
                                title: Text("Email not found"),
                                message: Text("Email address does not exists."),
                                dismissButton: .default(Text("Okay"))
                            )
                        }
                    
                    Text("New Password")
                        .font(.custom("Avenir Next", size: 18))
                        .foregroundColor(AppColour.cBlack)
                    
                    SecureField("New Password", text: $inNewPassword)
                        .font(.custom("Avenir Next", size: 18))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 60)
                
                Button(action: {
                    if isValidEmail(email: inEmail) && checkEmailExists() {
                        forgotAuthentication(email: inEmail, newPassword: inNewPassword)
                        
                        showUpdateAlert = true
                    } else {
                        showInvalidAlert = true
                    }
                }) {
                    Text("Update")
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
                .alert(isPresented: $showUpdateAlert) {
                    Alert(
                        title: Text("Success"),
                        message: Text("Your password has been updated."),
                        dismissButton: .default(Text("Okay"), action: {
                            showForgotView = false
                        })
                    )
                }
                
                Button(action: {
                    showCSAlert = true
                }) {
                    Text("Contact Service")
                        .font(.custom("Didot", size: 14))
                        .foregroundColor(AppColour.cBlack)
                }
                .padding(.horizontal, 80)
                .padding(.bottom, 25)
                .alert(isPresented: $showCSAlert) {
                    Alert(
                        title: Text("Customer Service"),
                        message: Text("Please call us at 1300-44-0709."),
                        dismissButton: .default(Text("Okay"))
                    )
                }
            }
            .background(AppColour.cYellow)
        }
    }
    
    // Enable and disable button
    private func canAuthenticate() -> Bool {
        !self.inEmail.isEmpty && !self.inNewPassword.isEmpty
    }
    
    // Check for existing email address
    private func checkEmailExists() -> Bool {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "email == %@", inEmail)
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

struct ForgotView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotView(showForgotView: .constant(false))
    }
}
