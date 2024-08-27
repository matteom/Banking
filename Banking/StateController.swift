//
//  StateController.swift
//  Banking
//
//  Created by Matteo Manferdini on 28/01/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

@Observable class StateController {
	var accounts: [Account]

	subscript(iban iban: String) -> Account? {
		guard let index = accounts.firstIndex(where: { $0.iban == iban }) else { return nil }
		return accounts[index]
	}

	private let storageController = StorageController()
	
	init() {
		self.accounts = storageController.fetchAccounts()
	}
	
	func addAccount(named name: String, withKind kind: Account.Kind) {
		let account = Account(name: name, iban: .generateIBAN(), kind: kind)
		accounts.append(account)
		storageController.save(accounts)
	}
	
	func addTransaction(withAmount amount: Int, beneficiary: String, to account: Account) {
		guard let index = accounts.firstIndex(of: account) else { return }
		let transaction = Transaction(amount: amount, beneficiary: beneficiary, date: Date())
		accounts[index].add(transaction)
		storageController.save(accounts)
	}
}
