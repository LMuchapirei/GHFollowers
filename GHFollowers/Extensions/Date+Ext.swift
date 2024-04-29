//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 29/4/2024.
//

import Foundation

extension Date {
    func convertToMonthYearFormat()-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
