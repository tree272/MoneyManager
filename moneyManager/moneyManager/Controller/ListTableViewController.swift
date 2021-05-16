//
//  ListTableViewController.swift
//  moneyManager
//
//  Created by tree on 2021/5/11.
//

import UIKit

class ListTableViewController: UITableViewController {

    // TODO:讓記帳種類可以自訂
    let defaultCategorize = ["飲食","家用","服飾","交通","學習","娛樂","醫療","日用","斜槓","雜貨","寵物","社交","旅遊","備用","其他"] //對應tag:1~15
    var paymentList: [Payment]?
    var IncomeList : [Income]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //清單是空則回傳1
        if let list = paymentList {
            return list.count > 0 ? list.count : 1
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        
        if let list = paymentList {
            if list.count > 0 {
                let c = Int(paymentList?[indexPath.row].categorize ?? 0)
                if c == 0 {
                    cell.categorizeLabel.text = ""
                }
                else{
                    cell.categorizeLabel.text = defaultCategorize[c-1]
                }
                //TODO: 實作tag功能後更換
                cell.tagLabel.text = ""
                let str = paymentList?[indexPath.row].amount ?? ""
                cell.amountLabel?.text = "$ " + str
            }else{
                //今天還沒有記帳的話，顯示沒有資料
                cell.categorizeLabel.text = ""
                cell.tagLabel.text = ""
                cell.amountLabel?.textAlignment = .center
                cell.amountLabel?.text = "今天還沒記帳喔！"
                
            }
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
}
