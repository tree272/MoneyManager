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
    
    //檢查最大值
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
        //面額按鈕是累加計算
        setPrice(price + UInt(sender.tag))
    }
    
    @IBAction func addPayment(_ sender: UIButton) {
        let adding = DatabaseModel().addAPayment(amount: price, categorize: 1, tag: 1, infomation: "早餐")
        if adding {
            print("success!")
            dismiss(animated: true, completion: nil)
        }else{
            print("something wrong")
        }
        
        
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
