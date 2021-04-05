//
//  AccountViewModel.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import Foundation

protocol AccountDelegate: class {
    func accountsSet()
}

class AccountViewModel {
    
    //MARK: Variables
    var accounts: [Account]
    weak var accountDelegate: AccountDelegate?
    
    //MARK: Initializers
    init(accountDelegate: AccountDelegate) {
        self.accountDelegate = accountDelegate
        self.accounts = []
        _ = loadAccounts()
    }
    
    //MARK: API calls
    func loadAccounts(filename fileName: String = "accounts") -> [Account] {

        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                self.accounts =  try JSONDecoder().decode(Accounts.self, from: data).accounts
                self.accountDelegate?.accountsSet()
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return []
    }
    
    func formatAccountData(forAccount account: Account) -> (id: String,
                                                            type: String,
                                                            currentBalance: String,
                                                            availableBalance: String) {
        return ("\(account.id)",
                "\(account.productName.description())",
                "\(account.currentBalance)",
                "\(account.availableBalance)")
    }
}
