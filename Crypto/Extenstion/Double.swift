//
//  Double.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import Foundation

extension Double{
    
    
    /// Converts a Double into a Currency with 2 decimal places
        /// ```
        /// Convert 1234.56 to $1,234.56
        /// ```
        private var currencyFormatter2: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.numberStyle = .currency
            //formatter.locale = .current // <- default value
            //formatter.currencyCode = "usd" // <- change currency
            //formatter.currencySymbol = "$" // <- change currency symbol
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return formatter
        }
    
        /// Converts a Double into a Currency as a String with 2 decimal places
       /// ```
       /// Convert 1234.56 to "$1,234.56"
       /// ```
       func asCurrencyWith2Decimals() -> String {
           let number = NSNumber(value: self)
           return currencyFormatter2.string(from: number) ?? "$0.00"
       }
    
    
    /// Converts a Double into string representation
        /// ```
        /// Convert 1.2345 to "1.23"
        /// ```
        func asNumberString() -> String {
            return String(format: "%.2f", self)
        }
        
        /// Converts a Double into string representation with percent symbol
        /// ```
        /// Convert 1.2345 to "1.23%"
        /// ```
        func asPercentString() -> String {
            return asNumberString() + "%"
        }
}
