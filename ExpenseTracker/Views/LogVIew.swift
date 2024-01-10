//
//  LogVIew.swift
//  ExpenseTracker
//
//  Created by Дима Кожемякин on 06.01.2024.
//

import SwiftUI

struct LogVIew: View {
    @State private var userName = ""
    @State private var password = ""
    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    Section(header: Text("")){
                        TextField("Enter your username", text: $userName)
                    }
                    Section(header: Text("")){
                        TextField("Enter your password", text: $password)
                    }
                }
                Button("Done", action: {}).buttonStyle(BorderedButtonStyle())
                
                
            }
            .navigationTitle("Log in")
            
        }
    }
}

#Preview {
    LogVIew()
}
