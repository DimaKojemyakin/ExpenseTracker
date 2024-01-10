import Foundation
import SwiftUI

struct Transaction: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var money: Double
    var spendingOrProfit: String
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.name == rhs.name && lhs.money == rhs.money
    }
}

struct User: Identifiable {
    var id = UUID()
    var isRegistered = false
    var name = ""
    var userName = ""
    var surname = ""
    var password = ""
    var money = 2017
    var currency = "$"
    var colorMoney = Color.green
    var arrow = "↑"
    var transactions: [Transaction] = [] {
        didSet {
            updateTotalMoney()
        }
    }

    var totalMoney: Double = 0

    init() {
        updateTotalMoney()
    }

    mutating func updateTotalMoney() {
        let total = transactions.reduce(0) { $0 + ($1.spendingOrProfit == "+" ? $1.money : -$1.money) }
        totalMoney = Double(total)
    }
}

class UserData: ObservableObject {
    @Published var users: [User] = []

    func getCurrentUser() -> User? {
        return users.first
    }

    func addTransaction(for user: User, name: String, money: Double, spendingOrProfit: String) {
        guard var currentUser = users.first(where: { $0.id == user.id }) else {
            return
        }

        currentUser.transactions.append(Transaction(name: name, money: money, spendingOrProfit: spendingOrProfit))
        updateUser(currentUser)
    }

    func addUser(_ user: User) {
        users.append(user)
    }

    func updateUser(_ user: User) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index] = user
        }
    }

    func deleteUser(_ user: User) {
        users.removeAll { $0.id == user.id }
    }

    func updateTransactions(_ transactions: [Transaction], forUser user: User) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index].transactions = transactions
        }
    }
}
