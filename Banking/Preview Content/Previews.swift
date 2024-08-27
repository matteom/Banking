//
//  TestData.swift
//  Banking (SwiftUI)
//
//  Created by Matteo Manferdini on 01/04/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import Foundation

extension Account {
	static let preview = Account(
		name: "Test account",
		iban: .generateIBAN(),
		kind: .checking
	)
}

extension Transaction {
	static let preview = Transaction(
		amount: 123456,
		beneficiary: "Salary",
		date: Date()
	)
}
