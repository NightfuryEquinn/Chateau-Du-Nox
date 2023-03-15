//
//  FormatChecker.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 15/03/2023.
//

import CoreData

func isValidEmail(email: String) -> Bool {
    // Use a regular expression to validate the email format
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    
    return emailPredicate.evaluate(with: email)
}

func isValidContact(contact: String) -> Bool {
    // Use a regular expression to validate the Malaysia phone format
    let contactRegex = "^\\d{10,12}$"
    let contactPredicate = NSPredicate(format:"SELF MATCHES %@", contactRegex)
    
    return contactPredicate.evaluate(with: contact)
}
