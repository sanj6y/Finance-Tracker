//
//  Project1App.swift
//  Project1
//
//  Created by Laxya Kumar on 2/15/23.
//

import SwiftUI
// test
@main
struct Project1App: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}


