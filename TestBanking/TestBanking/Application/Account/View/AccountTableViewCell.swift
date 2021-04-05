//
//  AccountTableViewCell.swift
//  TestBanking
//
//  Created by Anshika on 02/04/21.
//

import UIKit


class AccountTableViewCell: UITableViewCell {
    
    //MARK: variables
    @IBOutlet weak var accountIdLabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var availableBalanceLabel: UILabel!
    
    //MARK: view life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(account: (id: String,
                             type: String,
                             currentBalance: String,
                             availableBalance: String)) {
        accountIdLabel.text = account.id
        accountTypeLabel.text = account.type
        currentBalanceLabel.text = account.currentBalance
        availableBalanceLabel.text = account.availableBalance
    }

}
