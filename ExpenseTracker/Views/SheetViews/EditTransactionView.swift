//
//  EditTransactionView.swift
//  ExpenseTracker
//
//  Created by Дима Кожемякин on 06.01.2024.
//

import SwiftUI

struct EditTransactionView: View {
    @State private var selectedDate: Date = Date()
    @Binding var transaction: Transaction
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Трата или прибыль")) {
                    TextField("Введите имя", text: $transaction.spendingOrProfit)
                }

                Section(header: Text("Имя транзакции")) {
                    TextField("Введите имя", text: $transaction.name)
                }

                Section(header: Text("Сумма потраченных средств")) {
                    TextField("Введите сумму", value: $transaction.money, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Редактирование транзакции")
            .navigationBarItems(
                leading: Button("Отмена") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Сохранить") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct EditTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        EditTransactionView(transaction: .constant(Transaction(name: "Example", money: 100, spendingOrProfit: "+")))
            .environmentObject(UserData())
    }
}
