//
//  ContentView.swift
//  iExpense
//
//  Created by Shambhavi Jha on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    
    //`expenses` will be shared across multiple views + complex data
    //using @StateObject here as it's being created here
    @StateObject private var expenses = Expenses()
    //using @State as its a simple bool and will only be used in this view
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
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

                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()

                        Text(item.amount, format: .currency(code: item.currency))
                    }
                }
                .onDelete(perform: removeItems)
                
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
