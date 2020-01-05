//
//  ContentView.swift
//  weSplit
//
//  Created by Manhala on 2020-01-05.
//  Copyright © 2020 Mom Coded. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    let tipPercentages = [0, 10, 20, 30, 40]
    @State private var tipPercentage = 2
    var totalAmountPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) People")
                        }
                    }
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach(0 ..< self.tipPercentages.count) {
                                Text("\(self.tipPercentages[$0]) %")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalAmountPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
