//
//  Int+Cents.swift
//  Banking
//
//  Created by Matteo Manferdini on 27/08/24.
//

import Foundation

extension Int {
	var centsFormatted: String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		return formatter.string(from: NSNumber(value: Float(self) / 100 )) ?? ""
	}
}
