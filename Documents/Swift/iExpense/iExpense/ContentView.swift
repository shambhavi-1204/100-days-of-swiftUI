//
//  ContentView.swift
//  iExpense
//
//  Created by Shambhavi Jha on 11/01/23.
//

import SwiftUI

struct ExpenseView: View {
    
    var item: ExpenseItem
    
    var body: some View {
        HStack {
            
            if item.amount < 10 {
                Image(systemName: "square.fill")
                    .foregroundColor(.purple)
            }
            else if item.amount < 100 {
                Image(systemName: "square.fill")
                    .foregroundColor(.blue)
            }
            else {
                Image(systemName: "square.fill")
                    .foregroundColor(.pink)
            }
            
            Text(item.name)
            
            Spacer()
            
            Text(item.amount, format: .currency(code: item.currency))
        }
    }
}

struct ContentView: View {
    
    //`expenses` will be shared across multiple views + complex data
    //using @StateObject here as it's being created here
    @StateObject private var expenses = Expenses()
    //using @State as its a simple bool and will only be used in this view
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            ExpenseView.init(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Business") {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            ExpenseView.init(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
