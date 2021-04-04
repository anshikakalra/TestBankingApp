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
        loadTransactions(forAccount: account)
    }
    
    //MARK: API calls
    func loadTransactions(filename fileName: String = "transactions_098765", forAccount account: Account) -> [Transaction] {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                self.transactions = try JSONDecoder().decode(Transactions.self, from: data).transactions
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
        return ("\(transaction.date)",
                "\(transaction.processingStatus.description())",
                "\(transaction.runningBalance)",
                "\(transaction.amount)",
                "\(transaction.description)")
    }
}

