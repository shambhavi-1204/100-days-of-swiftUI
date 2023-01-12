//
//  AddView.swift
//  iExpense
//
//  Created by Shambhavi Jha on 12/01/23.
//

import SwiftUI

struct AddView: View {
    
    //complex data + shared across views
    @ObservedObject var expenses: Expenses
    //shared through the whole app
    @Environment(\.dismiss) var dismiss
    
    //all are simple properties use will only be used in this particular view
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @AppStorage("currency") private var currency = "USD"
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("My Currency", text: $currency)
                
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
