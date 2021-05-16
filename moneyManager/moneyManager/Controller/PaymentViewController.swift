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
    var categorizeSelected = 0 //0 = 沒有選擇
    var selectingButton: UIButton?
    
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
        
        guard price > 0 else {
            //TODO: show alert"請輸入金額"
            return
        }
        guard categorizeSelected > 0 else {
            //TODO: show alert"類型有沒有點選"
            return
        }
        
        let adding = DatabaseModel().addAPayment(amount: price, categorize: categorizeSelected, tag: 1, infomation: "")
        if adding {
            print("success!")
            
        }else{
            print("something wrong")
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cleanInput(_ sender: UIButton) {
        setPrice(0)
    }
    @IBAction func addThreeZero(_ sender: UIButton) {
        setPrice(price * 1000)
    }
    
    @IBAction func categorizePressed(_ sender: UIButton) {
        
        selectingButton?.isSelected = false //把已點選的取消換現在要選的那顆
        
        categorizeSelected = sender.tag
        selectingButton = sender
        selectingButton?.isSelected = true
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
