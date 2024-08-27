//
//  BankingApp.swift
//  Banking
//
//  Created by Matteo Manferdini on 27/08/24.
//

import SwiftUI

@main
struct BankingApp: App {
	@State private var stateController = StateController()

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(stateController)
        }
    }
}
