//
//  Transaction.swift
//  Banking
//
//  Created by Matteo Manferdini on 28/01/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

struct Transaction: Identifiable, Hashable {
	let id = UUID()
	let amount: Int
	let beneficiary: String
	let date: Date
}

extension Transaction: Codable {
	enum CodingKeys: CodingKey {
		case id
		case amount
		case beneficiary
		case date
	}
}
