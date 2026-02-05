//  HIITFitApp.swift
//  HIITFit
//  Created by Loi Ton on 1/26/26.

import SwiftUI

@main
struct HIITFitApp: App {
    @StateObject private var historyStore = HistoryStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(URL.documentsDirectory)
                }
                .environmentObject(historyStore)
                .alert(
                    "History",
                    isPresented: $historyStore.loadingError) {
                        Button("OK") { }
                    }
                    message: {
                        Text(
                            """
                            Unfortunately we can't load your past history.
                            Email support:
                            support@xyz.com
                            """)
                    }
        }
    }
}
