//
//  StartVIew.swift
//  ExpenseTracker
//
//  Created by Дима Кожемякин on 06.01.2024.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        NavigationView {
            LogVIew()
        }
    }
}

#Preview {
    StartView()
        .environmentObject(UserData())
}
