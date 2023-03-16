//
//  CartItemStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 16/03/2023.
//

import SwiftUI

struct CartItemStruct {
    let name: String
    let bottleImage: String
    
    var basePrice: Double
    var quantity: Int
    
    var taxPrice: Double {
        return basePrice * Double(quantity) * 0.26
    }
    
    var totalPrice: Double {
        return (basePrice * Double(quantity)) + taxPrice
    }
}
