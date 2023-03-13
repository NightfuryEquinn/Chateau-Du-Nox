//
//  Wine.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 13/03/2023.
//

import Foundation

struct Wine: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let phrase: String
    let content: String
    let rating: Decimal
}
