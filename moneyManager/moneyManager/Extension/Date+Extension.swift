//
//  Date+Extension.swift
//  moneyManager
//
//  Created by tree on 2021/5/12.
//

import Foundation

extension Date{
    func getCurrentLocationDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
}
