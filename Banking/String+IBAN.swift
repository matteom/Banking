//
//  String+IBAN.swift
//  Banking
//
//  Created by Matteo Manferdini on 27/08/24.
//

import Foundation

extension String {
	var ibanFormatted: String {
		var remaining = Substring(self)
		var chunks: [Substring] = []
		while !remaining.isEmpty {
			chunks.append(remaining.prefix(4))
			remaining = remaining.dropFirst(4)
		}
		return chunks.joined(separator: " ")
	}

	static func generateIBAN() -> String {
		let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		let digits = "0123456789"
		return random(length: 2, from: letters)
		+ random(length: 2, from: digits)
		+ random(length: 4, from: letters)
		+ random(length: 12, from: digits)
	}

	private static func random(length: Int, from characters: String) -> String {
		String((0 ..< length).map { _ in characters.randomElement()! })
	}
}
