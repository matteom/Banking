//
//  AddButton.swift
//  Banking (SwiftUI)
//
//  Created by Matteo Manferdini on 03/04/2020.
//  Copyright © 2020 Matteo Manferdini. All rights reserved.
//

import SwiftUI

struct AddButton: View {
	let title: String
	let action: () -> Void

	var body: some View {
		Button(title, systemImage: "plus.circle.fill", action: action)
			.buttonStyle(.fullWidth)
			.controlSize(.extraLarge)
			.safeAreaPadding()
	}
}

#Preview {
	AddButton(title: "Add item", action: {})
}

