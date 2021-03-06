//
//  AccountsViewController.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import UIKit

class AccountsViewController: UIViewController {
    
    //MARK: variables
    @IBOutlet weak var tableView: UITableView!
    var accountViewModel: AccountViewModel?
    
    
    //MARK: view life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        accountViewModel = AccountViewModel(accountDelegate: self)
    }
}

//MARK: Tableview delegate and datasource methods
extension AccountsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountViewModel?.accounts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.accountCell.rawValue,
                                                       for: indexPath) as? AccountTableViewCell,
              let accountViewModel = accountViewModel else {
            return UITableViewCell()
        }
        let account = accountViewModel.accounts[indexPath.row]
        cell.setUpCell(account: accountViewModel.formatAccountData(forAccount: account))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: SegueIdentitifiers.accountToTransactionSegue.rawValue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexpath = self.tableView.indexPathForSelectedRow?.row else { return  }
        let account = accountViewModel?.accounts[indexpath]
        let transactionViewController = segue.destination as? TransactionViewController
        transactionViewController?.account = account
    }
}

//MARK: accountDelegate methods
extension AccountsViewController: AccountDelegate {
    func accountsSet() {
        print("Account data loaded")
        tableView.reloadData()
    }
}

