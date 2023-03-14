//
//  Wine.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 13/03/2023.
//

import Foundation

struct Wine: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Double
    let phrase: String
    let content: String
    let rating: Decimal
    let bottleImage: String
    let coverImage: String
}
