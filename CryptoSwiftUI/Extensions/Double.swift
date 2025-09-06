//
//  Double.swift
//  CryptoSwiftUI
//
//  Created by Arman on 6/9/25.
//

import Foundation
extension Double{
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "%"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func asCurrencyWith6Deimals() -> String {
        return currencyFormatter.string(from: NSNumber(value: self)) ?? "$0.00"
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}

