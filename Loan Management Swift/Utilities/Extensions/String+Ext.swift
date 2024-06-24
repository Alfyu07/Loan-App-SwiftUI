//
//  String+Ext.swift
//  Loan Management Swift
//
//  Created by Wahyu Alfandi on 24/06/24.
//

import Foundation

extension String {
    func monthName() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        dateFormatter.dateFormat = "MMMM"
        let monthName = dateFormatter.string(from: date)
        return monthName
    }
    
    func formattedFullDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        dateFormatter.dateFormat = "dd MMM yyyy"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    func toRupiahFormat() -> String? {
        guard let number = Int(self) else {
            return nil
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR"
        formatter.currencySymbol = "Rp"
        formatter.locale = Locale(identifier: "id_ID")
        formatter.maximumFractionDigits = 0
        
        if let formattedString = formatter.string(from: NSNumber(value: number)) {
            return formattedString
        }
        
        return nil
    }
}
