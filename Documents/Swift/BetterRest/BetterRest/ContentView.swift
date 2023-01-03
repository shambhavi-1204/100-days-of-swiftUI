//
//  ContentView.swift
//  BetterRest
//
//  Created by Shambhavi Jha on 03/01/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    @State private var bedTime = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    DatePicker("Select time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline.weight(.regular))
                        .textCase(.none)
                        .foregroundColor(.black)
                }
                
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline.weight(.regular))
                        .textCase(.none)
                        .foregroundColor(.black)

                }
                
                Section {
                    Stepper(coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }   header: {
                    Text("Daily coffee intake")
                        .font(.headline.weight(.regular))
                        .textCase(.none)
                        .foregroundColor(.black)
                }
                
                Section {
                    Text("Your ideal bedtime is \(calculateBedtime())")
                        .font(.title2.weight(.medium))
                }
            }
            .navigationTitle("Better Rest")
        }
    }
    
    func calculateBedtime() -> String {
                
        do {
            let config = MLModelConfiguration()
            let model = try sleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let bedTime = sleepTime.formatted(date: .omitted, time: .shortened)
            return bedTime
            
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
