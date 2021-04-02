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
    }
    
    //MARK: API calls
    func loadAccounts(filename fileName: String = "accounts") -> [Account] {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                self.accounts = try JSONDecoder().decode([Account].self, from: data)
                self.accountDelegate?.accountsSet()
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return []
    }
}
