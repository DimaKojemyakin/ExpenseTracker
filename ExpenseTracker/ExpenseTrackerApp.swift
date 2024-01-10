//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Дима Кожемякин on 06.01.2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var userData = UserData()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(userData)
        }
    }
}
