//
//  TransactionViewController.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import UIKit

class TransactionViewController: UIViewController {
    
    //MARK: Variables
 
    @IBOutlet weak var tableView: UITableView!
    var transactionViewModel: TransactionViewModel?
    var account: Account!
    
    //MARK: view life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionViewModel = TransactionViewModel(transactionDelegate: self, account: account)
    }
}

//MARK: Tableview delegate and datasource methods
extension TransactionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (transactionViewModel?.transactions.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.accountCell.rawValue,
                                                           for: indexPath) as? AccountTableViewCell else {
                return UITableViewCell()
            }
            cell.setUpCell(account: (id: account.id,
                                     type: account.productName.description(),
                                     currentBalance: account.currentBalance,
                                     availableBalance: account.availableBalance))
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.transactionCell.rawValue,
                                                       for: indexPath) as? TransactionTableViewCell,
              let transactionViewModel = transactionViewModel else {
            return UITableViewCell()
        }
        let transaction = transactionViewModel.transactions[indexPath.row - 1]
        cell.setUpCell(transaction: transactionViewModel.formatTransactionData(forTransaction: transaction))
        return cell
    }
    
    
}

//MARK: TransactionDelegate methods
extension TransactionViewController: TransactionDelegate {
    func transactionsSet() {
        tableView.reloadData()
    }
}



