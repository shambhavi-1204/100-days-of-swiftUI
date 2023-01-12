//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Shambhavi Jha on 12/01/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    //Identifiable required a unique ID to be present
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
