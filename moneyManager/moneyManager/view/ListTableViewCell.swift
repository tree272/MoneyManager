//
//  ListTableViewCell.swift
//  moneyManager
//
//  Created by 蘇琍 on 2021/5/13.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var categorizeLabel: UILabel!
    @IBOutlet var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //TODO:顯示單筆資料
    }

}
