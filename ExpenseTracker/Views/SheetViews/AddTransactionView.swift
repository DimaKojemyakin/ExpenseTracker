//
//  AddTransactionView.swift
//  ExpenseTracker
//
//  Created by Дима Кожемякин on 07.01.2024.
//

import SwiftUI

struct AddTransactionView: View {
    
    @Binding var isActive: Bool
    
    @State private var spendOrProfit = ""
    @State private var name = ""
    @State private var money = 0
    @State private var isActiveAlert = false
    
    @EnvironmentObject private var userData: UserData
    @Binding var selectedUser: User?  // Добавлено свойство selectedUser
    
    var body: some View {
        NavigationView {
            Form {
                // Остальной код не изменился

                // ...

            }
            .navigationTitle("Add new transition")
            .navigationBarItems(
                leading: HStack {
                    Button("Cancel", action: {
                        saveNewTransaction()
                    })
                },
                trailing: HStack {
                    Button("Save", action: {
                        saveNewTransaction()
                    })
                }
            )
        }
    }
    
    private func saveNewTransaction() {
        guard let selectedUser = selectedUser else {
            return
        }
        
        guard !spendOrProfit.isEmpty && !name.isEmpty && money <= 0 else {
            selectedUser.transactions.append(Transaction(name: name, money: Double(money), spendingOrProfit: spendOrProfit))
            isActive = false
            return
        }

        isActiveAlert.toggle()
    }
}


#Preview {
    AddTransactionView(isActive: .constant(true))
        .environmentObject(UserData())
}
