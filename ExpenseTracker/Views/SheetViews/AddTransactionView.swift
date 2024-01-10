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
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Трата или прибыль")) {
                    TextField("Введите имя", text: $spendOrProfit)
                }
                
                Section(header: Text("Имя транзакции")) {
                    TextField("Введите имя", text: $name)
                }
                
                Section(header: Text("Сумма потраченных средств")) {
                    TextField("Введите сумму", value: $money, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Add new transition")
            .navigationBarItems(leading: HStack{
                Button("Cancle", action: {
                    saveNewTransacton(spendOrPrefit: spendOrProfit, name: name, money: Double(money))
                })
            }, trailing: HStack{
                Button("Save", action: {
                    
                })

            })
        }
    }
    private func saveNewTransacton(spendOrPrefit: String, name: String, money: Double) {
        guard !spendOrProfit.isEmpty && !name.isEmpty && money == 0 else {
            userData.user.transactions.append(Transaction(name: name, money: money, spendingOrProfit: spendOrProfit))
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
