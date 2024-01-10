import SwiftUI

struct EditTransactionView: View {
    @State private var editedTransaction: Transaction
    var updateTransaction: (Transaction) -> Void
    @Environment(\.presentationMode) var presentationMode

    init(transaction: Transaction, updateTransaction: @escaping (Transaction) -> Void) {
        _editedTransaction = State(initialValue: transaction)
        self.updateTransaction = updateTransaction
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Трата или прибыль")) {
                    TextField("Введите имя", text: $editedTransaction.spendingOrProfit)
                }

                Section(header: Text("Имя транзакции")) {
                    TextField("Введите имя", text: $editedTransaction.name)
                }

                Section(header: Text("Сумма потраченных средств")) {
                    TextField("Введите сумму", value: $editedTransaction.money, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Редактирование транзакции")
            .navigationBarItems(
                leading: Button("Отмена") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Сохранить") {
                    updateTransaction(editedTransaction)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct EditTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTransaction = Transaction(name: "Example", money: 100, spendingOrProfit: "+")
        EditTransactionView(transaction: sampleTransaction) { _ in }
    }
}
