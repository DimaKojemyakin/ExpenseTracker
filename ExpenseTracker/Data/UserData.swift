//
//  UserData.swift
//  ExpenseTracker
//
//  Created by Дима Кожемякин on 06.01.2024.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var money: Double
    var spendingOrProfit: String
    
    // Реализация протокола Equatable
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.name == rhs.name && lhs.money == rhs.money
    }
}

class UserData: ObservableObject {
    @Published var user = User()
    
}

struct User: Identifiable {
    var id = UUID()
    var isRegistred = false
    var name = ""
    var surname = ""
    var passworx = ""
    var money = 2017
    var currency = "$"
    var colorMoney = Color.green
    var arrow = "↑"
    var transactions: [Transaction] = [
        Transaction(name: "Tinkoff", money: 2129, spendingOrProfit: "+"),
        Transaction(name: "Tinkoff", money: 2129, spendingOrProfit: "+"),
        Transaction(name: "Tinkoff", money: 2129, spendingOrProfit: "+"),
    ] {
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
