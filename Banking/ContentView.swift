//
//  ContentView.swift
//  Banking
//
//  Created by Matteo Manferdini on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			AccountsView()
				.navigationDestination(for: Account.self) { account in
					TransactionsView(account: account)
				}
		}
    }
}
