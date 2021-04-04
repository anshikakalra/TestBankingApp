//
//  TransactionTableViewCell.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    //MARK: Variables
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var processingStatusLabel: UILabel!
    
    //MARK: view life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: setup transaction cell
    func setUpCell(transaction: (date: String,
                                 description: String,
                                 amount: String,
                                 runningBalance: String,
                                 processingStatus: String)) {
        dateLabel.text = transaction.date
        processingStatusLabel.text = transaction.processingStatus
        amountLabel.text = transaction.amount
        descriptionLabel.text = transaction.description
    }

}
