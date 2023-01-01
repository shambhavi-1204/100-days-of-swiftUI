//
//  ContentView.swift
//  WeSplit
//
//  Created by Shambhavi Jha on 30/12/22.
//

import SwiftUI

struct ContentView: View {

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [5,10,15,20,25,0]

    var totalAmount: Double {
        let totalTip = checkAmount * Double(tipPercentage) / 100
        return checkAmount + totalTip
    }
    
    var sharePerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return totalAmount / Double(peopleCount)
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount",  value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .foregroundColor(tipPercentage==0 ? .red : .black)
                } header: {
                    Text("Grand Total")
                }
                
                Section {
                    Text(sharePerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
