//
//  PaymentViewController.swift
//  moneyManager
//
//  Created by tree on 2021/5/7.
//

import UIKit

class PaymentViewController: UIViewController {

    let MAX_NUMBER: UInt = 9_999_999
    
    @IBOutlet weak var priceLabel: UILabel!
    var price: UInt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func checkNumberLimit(_ p: UInt) -> UInt {
        guard p < MAX_NUMBER else { return MAX_NUMBER }
        return p
    }
    
    func setPrice(_ p: UInt) {
        price = checkNumberLimit(p)
        priceLabel.text = "$"+String(price)
    }
    
    //MARK: - button action
    
    @IBAction func priceButtonPressed(_ sender: UIButton) {
        setPrice(UInt(sender.tag))
    }
    
    @IBAction func addPayment(_ sender: UIButton) {
    }
    
    @IBAction func cleanInput(_ sender: UIButton) {
        setPrice(0)
    }
    @IBAction func addThreeZero(_ sender: UIButton) {
        setPrice(price * 1000)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
