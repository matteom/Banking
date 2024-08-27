//
//  NewTransactionView.swift
//  Banking (SwiftUI)
//
//  Created by Matteo Manferdini on 01/04/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import SwiftUI

struct NewTransactionView: View {
	let account: Account
	@Environment(StateController.self) private var stateController
	@Environment(\.dismiss) private var dismiss
	@State private var amount: String = ""
	@State private var beneficiary: String = ""
	
	var body: some View {
		Content(amount: $amount, beneficiary: $beneficiary)
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel", role: .cancel) {
						dismiss()
					}
				}
				ToolbarItem(placement: .primaryAction) {
					Button("Send") {
						let amount = (Int(self.amount) ?? 0) * 100
						stateController.addTransaction(
							withAmount: amount,
							beneficiary: beneficiary,
							to: account
						)
						dismiss()
					}
					.bold()
				}
			}
	}
}

private struct Content: View {
	@Binding var amount: String
	@Binding var beneficiary: String

	var body: some View {
		Form {
			LabeledContent {
				TextField(0.centsFormatted, text: $amount)
					.multilineTextAlignment(.trailing)
					.keyboardType(.decimalPad)
			} label: {
				Text("Amount")
			}
			TextField("Beneficiary name", text: $beneficiary)
		}
		.navigationBarTitle("New Transaction")
	}
}

#Preview {
	@Previewable @State var amount = ""
	@Previewable @State var beneficiary = ""
	NavigationStack {
		Content(amount: $amount, beneficiary: $beneficiary)
	}
}
