//
//  Transaction.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import Foundation

enum ProcessingStatus: Decodable {
    case posted
    case pending
    case unKnown(value: String)
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let productName = try? container.decode(String.self)
        switch productName {
        case "POSTED":
            self = .posted
        case "PENDING":
            self = .pending
        default:
            self = .unKnown(value: productName ?? "unKnown")
        }
    }
    
    func description() -> String{
        switch self {
        case .posted:
            return "Posted"
        case .pending:
            return "Pending"
        default:
            return "Unknown"
        }
    }
}

struct Transactions: Decodable {
    var transactions: [Transaction]
}

struct Transaction: Decodable {
    let date: String
    let description: String
    let amount: String
    let runningBalance: String?
    let processingStatus: ProcessingStatus
}
