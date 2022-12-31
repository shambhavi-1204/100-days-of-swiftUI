//
//  ContentView.swift
//  unitConverter
//
//  Created by Shambhavi Jha on 31/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Celsius"
    @State private var inputValue = 0.0
    
    let units = ["Celsius","Fahrenheit","Kelvin"]
    
    var outputValue: Double {
        
        if inputUnit == outputUnit {
            return inputValue
        }
        
        if inputUnit == "Celsius" {
            return outputUnit == "Fahrenheit" ?
                inputValue * 1.8 + 32.0 : inputValue + 273.0
        }
        else if inputUnit == "Fahrenheit" {
            let temperature = (inputValue - 32.0) / 1.8
            return outputUnit == "Celsius" ?
                temperature : temperature + 273.0
        }
        else {
            let temperature = inputValue - 273
            return outputUnit == "Celsius" ?
                temperature : temperature * 1.8 + 32.0
        }
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Enter input value", value: $inputValue, format: .number)
                } header: {
                    Text("Input Unit")
                }
                
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(outputValue, format: .number)
                } header: {
                    Text("Output Unit")
                }
                
                
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
