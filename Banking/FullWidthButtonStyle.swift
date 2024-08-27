//
//  FullWidthButtonStyle.swift
//  Groceries
//
//  Created by Matteo Manferdini on 07/02/24.
//

import SwiftUI

struct FullWidthButtonStyle: PrimitiveButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		Button(action: { configuration.trigger() }) {
			configuration.label
				.frame(maxWidth: .infinity)
		}
		.buttonStyle(.borderedProminent)
	}
}

extension PrimitiveButtonStyle where Self == FullWidthButtonStyle {
	static var fullWidth: FullWidthButtonStyle {
		FullWidthButtonStyle()
	}
}
