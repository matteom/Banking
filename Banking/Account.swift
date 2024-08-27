//
//  Account.swift
//  Banking
//
//  Created by Matteo Manferdini on 28/01/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

struct Account: Codable, Identifiable, Hashable {
	let name: String
	let iban: String
	let kind: Kind
	private(set) var transactions: [Transaction]

	enum Kind: String, Codable, CaseIterable {
		case checking, savings, investment
	}

	var id: String { iban }
	
	var balance: Int {
		var balance = 0
		for transaction in transactions {
			balance += transaction.amount
		}
		return balance
	}
	
	init(name: String, iban: String, kind: Kind) {
		self.name = name
		self.kind = kind
		self.iban = iban
		self.transactions = [
			Transaction(amount: 2000_00, beneficiary: "Initial Balance", date: Date())
		]
	}
	
	mutating func add(_ transaction: Transaction) {
		transactions.append(transaction)
	}
}
