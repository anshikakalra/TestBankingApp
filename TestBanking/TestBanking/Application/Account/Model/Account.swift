//
//  Account.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import Foundation

enum ProductName {
    case Saving
    case Spending
}

struct Account {
    let id: Int
    var currentBalance: Double
    var availableBalance: Double
    var productName: ProductName
}
