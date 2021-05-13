//
//  ViewController.swift
//  moneyManager
//
//  Created by tree on 2021/5/3.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet weak var totalLabel: UILabel!
    var dataModel = DatabaseModel()
    var todayPayment : [Payment]!
    var listTableViewController : ListTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTodayAmount()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //container view內的table view controller

        if segue.identifier == "showAccountList"{
            listTableViewController = segue.destination as? ListTableViewController
            
        }
    }
    
    @IBAction func unwindToVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        loadTodayAmount()
    }
    
    
    func loadTodayAmount() {
        
        
        todayPayment = dataModel.fetchTodayPayment()
        
        var countAmount = 0
        for p in todayPayment {
            countAmount += Int(p.amount ?? "0") ?? 0
        }
        totalLabel.text = "$ \(countAmount)"
        
        listTableViewController?.paymentList = dataModel.fetchTodayPayment()
        listTableViewController?.tableView.reloadData()
    }
    
    
    //MARK: -Button action

    @IBAction func addPayment(_ sender: Any) {
    }
    
    @IBAction func addIncome(_ sender: Any) {
    }
    
    
    
}

