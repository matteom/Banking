//
//  NewAccountView.swift
//  Banking (SwiftUI)
//
//  Created by Matteo Manferdini on 01/04/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import SwiftUI

struct NewAccountView: View {
	@Environment(StateController.self) private var stateController
	@Environment(\.dismiss) private var dismiss
	@State private var name: String = ""
	@State private var kind: Account.Kind = .checking

	var body: some View {
		Content(name: $name, kind: $kind)
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel", role: .cancel) {
						dismiss()
					}
				}
				ToolbarItem(placement: .primaryAction) {
					Button("Create") {
						stateController.addAccount(named: name, withKind: kind)
						dismiss()
					}
					.bold()
				}
			}
	}
}

private struct Content: View {
	@Binding var name: String
	@Binding var kind: Account.Kind

	var body: some View {
		Form {
			TextField("Account name", text: $name)
			Picker("Kind", selection: $kind) {
				ForEach(Account.Kind.allCases, id: \.self) { kind in
					Text(kind.rawValue).tag(kind)
				}
			}
		}
		.navigationBarTitle("New Account")
	}
}

#Preview {
	@Previewable @State var name = ""
	@Previewable @State var kind = Account.Kind.checking
	NavigationStack {
		Content(name: $name, kind: $kind)
	}
}
