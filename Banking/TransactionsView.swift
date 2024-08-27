//
//  AccountView.swift
//  Banking (SwiftUI)
//
//  Created by Matteo Manferdini on 01/04/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import SwiftUI

struct TransactionsView: View {
	let account: Account
	@Environment(StateController.self) private var stateController
	@State private var isAddingTransaction: Bool = false

	var body: some View {
		if let account = stateController[iban: account.iban] {
			Content(account: account) {
				isAddingTransaction = true
			}
			.sheet(isPresented: $isAddingTransaction) {
				NavigationStack {
					NewTransactionView(account: account)
				}
			}
		}
	}
}

private struct Content: View {
	let account: Account
	let addTransactionAction: () -> Void

	var body: some View {
		List(transactions) { transaction in
			Row(transaction: transaction)
		}
		.safeAreaInset(edge: .bottom) {
			AddButton(title: "New Transaction", action: addTransactionAction)
		}
		.navigationBarTitle(account.name)
	}

	var transactions: [Transaction] {
		account.transactions
			.sorted(using: KeyPathComparator(\.date, order: .reverse))
	}
}

#Preview {
	NavigationStack {
		Content(account: .preview, addTransactionAction: {})
	}
}

private struct Row: View {
	let transaction: Transaction

	var body: some View {
		VStack(alignment: .leading, spacing: 4.0) {
			HStack {
				Text(transaction.beneficiary)
					.font(.headline)
				Spacer()
				Text(transaction.amount.centsFormatted)
					.font(.headline)
			}
			Text(transaction.date.formatted(date: .long,  time: .shortened))
				.font(.subheadline)
				.foregroundColor(.secondary)
		}
	}
}

#Preview("Row") {
	List {
		Row(transaction: .preview)
	}
}
