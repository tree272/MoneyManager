//
//  DeleteDataTableViewCell.swift
//  moneyManager
//
//  Created by 蘇琍 on 2021/5/16.
//

import UIKit

class DeleteDataTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //TODO:show alert: "確定要刪除嗎？"
        
        let result = DatabaseModel().deleteAll()
        if result {
            //TODO:show alert: "刪除成功"
        }else{
            //TODO:show alert: "刪除失敗"
        }
        // Configure the view for the selected state
    }

}
