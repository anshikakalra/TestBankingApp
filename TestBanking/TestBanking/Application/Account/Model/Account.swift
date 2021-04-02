//
//  Account.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import Foundation

enum ProductName: Decodable {
    case saving
    case spending
    case unKnown(value: String)
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let productName = try? container.decode(String.self)
        switch productName {
        case "Saving":
            self = .saving
        case "Spending":
            self = .spending
        default:
            self = .unKnown(value: productName ?? "unKnown")
        }
    }
}

struct Account:Decodable {
    let id: Int
    var currentBalance: Double
    var availableBalance: Double
    var productName: ProductName
}
