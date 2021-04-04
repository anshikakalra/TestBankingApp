//
//  TransactionViewModel.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import Foundation

protocol TransactionDelegate: class {
    func transactionsSet()
}

class TransactionViewModel {
    
    //MARK: Variables
    var account: Account
    var transactions: [Transaction]
    weak var transactionDelegate: TransactionDelegate?
    
    //MARK: Initializers
    init(transactionDelegate: TransactionDelegate, account: Account) {
        self.transactionDelegate = transactionDelegate
        self.account = account
        self.transactions = []
        _ = loadTransactions(filename: "transactions_\(account.id)")
    }
    
    //MARK: API calls
    func loadTransactions(filename fileName: String = "transactions") -> [Transaction] {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                self.transactions = try jsonDecoder.decode(Transactions.self, from: data).transactions.sorted(by: { $0.date > $1.date
                })
                self.transactionDelegate?.transactionsSet()
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return []
    }
    
    func formatTransactionData(forTransaction transaction: Transaction) -> (date: String,
                                                            description: String,
                                                            amount: String,
                                                            runningBalance: String,
                                                            processingStatus: String) {
        let capitalizedStatus = transaction.processingStatus.description().capitalizingFirstLetter()
        let floatAmount = transaction.amount.convertStringToFloat() ?? 0
        let formattedDate = transaction.date.serializeDateFromServer()
        let prefix = floatAmount < 0 ? "Dr" : "Cr"
        let prefixedAmount = prefix + " \(abs(floatAmount))"
        return ("\(formattedDate)",
                "\(transaction.description)",
                "\(prefixedAmount)",
                "\(transaction.runningBalance ?? "")",
                "\(capitalizedStatus)")
    }
}

