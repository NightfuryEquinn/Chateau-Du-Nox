//
//  HistoryItemStruct.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 18/03/2023.
//

import SwiftUI

struct HistoryItemStruct {
    let wine: String
    let customer: String
    let bottleImage: String
    let orderedDate: Date
    let deliveredDate: Date?
    
    var address: String
    var quantity: Int
    var totalPrice: Double
}
