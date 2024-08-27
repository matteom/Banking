//
//  StorageController.swift
//  Banking
//
//  Created by Matteo Manferdini on 31/01/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

class StorageController {
	private let accountsFileURL = URL.documentsDirectory
		.appendingPathComponent("Accounts")
		.appendingPathExtension("json")
	
	func save(_ accounts: [Account]) {
		guard let data = try? JSONEncoder().encode(accounts) else { return }
		try? data.write(to: accountsFileURL)
	}
	
	func fetchAccounts() -> [Account] {
		guard let data = try? Data(contentsOf: accountsFileURL) else { return [] }
		let accounts = try? JSONDecoder().decode([Account].self, from: data)
		return accounts ?? []
	}
}
