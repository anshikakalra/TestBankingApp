//
//  TransactionTableViewController.swift
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}

//MARK: Tableview delegate and datasource methods
extension TransactionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionViewModel?.transactions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.accountCell.rawValue,
                                                       for: indexPath) as? TransactionTableViewCell,
              let transactionViewModel = transactionViewModel else {
            return UITableViewCell()
        }
        let transaction = transactionViewModel.transactions[indexPath.row]
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



