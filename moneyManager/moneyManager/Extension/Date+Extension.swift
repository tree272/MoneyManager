//
//  Date+Extension.swift
//  moneyManager
//
//  Created by tree on 2021/5/12.
//

import Foundation

extension Date{
    
    func getCurrentTimeByFormatter(format: String) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
    
    
    func getCurrentLocationDate() -> String {
        return getCurrentTimeByFormatter(format: "yyyy/MM/dd HH:mm:ss")
    }
    
    func getTodatDate() -> String {
        return getCurrentTimeByFormatter(format: "yyyy/MM/dd")
    }
    
}
