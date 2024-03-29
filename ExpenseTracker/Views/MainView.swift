import SwiftUI

struct MainView: View {
    @EnvironmentObject var userData: UserData
    @State private var isActiveSheetAddMoney = false
    @State private var selectedTransaction: Transaction?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData.user.transactions) { transaction in
                    HStack {
                        Spacer()
                        Text("\(transaction.spendingOrProfit)").foregroundColor(.green)
                        Spacer()
                        Divider()
                        Spacer()
                        Text(transaction.name)
                        Spacer()
                        Divider()
                        Spacer()
                        Text(String(Int(transaction.money)))
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedTransaction = transaction
                    }
                }
            }
            .sheet(item: $selectedTransaction) { transaction in
                if let index = userData.user.transactions.firstIndex(of: transaction) {
                    EditTransactionView(
                        transaction: userData.user.transactions[index],
                        updateTransaction: { updatedTransaction in
                            userData.user.transactions[index] = updatedTransaction
                        }
                    )
                    .interactiveDismissDisabled()
                    .onDisappear {
                        selectedTransaction = nil
                    }
                }
            }

            .sheet(isPresented: $isActiveSheetAddMoney){
                
            }
            .navigationTitle("ExpenseTracker")
            .navigationBarItems(leading: HStack {
                
                Button(action: { isActiveSheetAddMoney = true }) {
                    Image(systemName: "plus.app")
                }
            }, trailing: HStack {
                Button(action: {}){
                    Text("\(userData.user.arrow)").font(.title2).fontWeight(.bold).foregroundColor(user)
                    Text("\(Int(userData.user.totalMoney))\(userData.user.currency)").font(.title2).fontWeight(.bold)
                }
            })
        }
        .navigationBarBackButtonHidden()
    }
    private func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // или другой формат по вашему выбору
        return formatter.string(from: date)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserData())
    }
}
