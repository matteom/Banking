//
//  Date+Transaction.swift
//  Banking
//
//  Created by Matteo Manferdini on 28/08/24.
//

import Foundation

extension Date {
	var transactionFormatted: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		return formatter.string(from: self)
	}
}
