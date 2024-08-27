//
//  ContentView.swift
//  Banking (SwiftUI)
//
//  Created by Matteo Manferdini on 11/03/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import SwiftUI

struct AccountsView: View {
	@Environment(StateController.self) private var stateController
	@State private var isAddingAccount = false

	var body: some View {
		@Bindable var stateController = stateController
		Content(accounts: $stateController.accounts) {
			isAddingAccount = true
		}
		.sheet(isPresented: $isAddingAccount) {
			NavigationStack {
				NewAccountView()
			}
		}
    }
}

private struct Content: View {
	@Binding var accounts: [Account]
	let addAccountAction: () -> Void

	var body: some View {
		List($accounts, editActions: [.delete, .move]) { $account in
			NavigationLink(value: account) {
				Row(account: account)
			}
		}
		.safeAreaInset(edge: .bottom) {
			AddButton(title: "Add Account", action: addAccountAction)
		}
		.navigationBarTitle("Accounts")
		.toolbar {
			ToolbarItem(placement: .primaryAction) {
				EditButton()
			}
		}
	}
}

#Preview {
	NavigationStack {
		Content(accounts: .constant([.preview]), addAccountAction: {})
	}
}

private struct Row: View {
	let account: Account

	var body: some View {
		VStack(alignment: .leading, spacing: 4.0) {
			HStack {
				Text(account.name)
					.font(.headline)
				Spacer()
				Text(account.balance.centsFormatted)
					.font(.headline)
			}
			Text("\(account.kind.rawValue.capitalized) account")
				.font(.subheadline)
				.foregroundColor(.secondary)
			Text(account.iban.ibanFormatted)
				.font(.caption)
				.foregroundColor(.secondary)
		}
		.padding(.vertical, 8.0)
	}
}

#Preview("Row") {
	List {
		Row(account: .preview)
	}
}
