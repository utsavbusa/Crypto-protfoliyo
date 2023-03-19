//
//  CryptoApp.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import SwiftUI

@main
struct CryptoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
