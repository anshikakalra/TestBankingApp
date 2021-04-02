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
    
    func description() -> String{
        switch self {
        case .saving:
            return "Saving"
        case .spending:
            return "Spending"
        default:
            return "Unknown"
        }
    }
}

struct Accounts: Decodable {
    let accounts: [Account]
}

struct Account:Decodable {
    let id: Int
    var currentBalance: Double
    var availableBalance: Double
    let productName: ProductName
}
