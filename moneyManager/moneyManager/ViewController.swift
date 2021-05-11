//
//  ViewController.swift
//  moneyManager
//
//  Created by tree on 2021/5/3.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listTable: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: -table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath)
        cell.textLabel?.text = "0"
        return cell
        
    }
    
    //MARK: -Button action

    @IBAction func addPayment(_ sender: Any) {
    }
    
    @IBAction func addIncome(_ sender: Any) {
    }
    
    
    
}

