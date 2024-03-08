//
//  ContentView.swift
//  UnitConverter
//
//  Created by Gabrielle Dang on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var enteredData: Double = 0
    @State var currentUnit = "km"
    @State var selectedUnit = "ft"

    let unitValues = ["km", "ft", "yd", "mi"]
    
    var conversion: String {
        var conversion: Double = 0
        
        if currentUnit == selectedUnit {
            conversion = enteredData
        }
        
        if currentUnit == "km" && selectedUnit == "ft" {
            conversion = enteredData * 3280.84
        } else if currentUnit == "ft" && selectedUnit == "km" {
            conversion = enteredData / 3280.84
        }
        
        if currentUnit == "km" && selectedUnit == "yd" {
            conversion = enteredData * 1093.61
        } else if currentUnit == "yd" && selectedUnit == "km" {
            conversion = enteredData / 1093.61
        }
        
        if currentUnit == "km" && selectedUnit == "mi" {
            conversion = enteredData * 0.621371
        } else if currentUnit == "mi" && selectedUnit == "km" {
            conversion = enteredData / 0.621371
        }
        
        if currentUnit == "ft" && selectedUnit == "yd" {
            conversion = enteredData * 0.333333
        } else if currentUnit == "yd" && selectedUnit == "ft" {
            conversion = enteredData / 0.333333
        }
        
        if currentUnit == "ft" && selectedUnit == "mi" {
            conversion = enteredData * 0.000189394
        } else if currentUnit == "mi" && selectedUnit == "ft" {
            conversion = enteredData / 0.000189394
        }
        
        if currentUnit == "yd" && selectedUnit == "mi" {
            conversion = enteredData * 0.000568182
        } else if currentUnit == "mi" && selectedUnit == "yd" {
            conversion = enteredData / 0.000568182
        }
        
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert"){
                    TextField("0.00", value: $enteredData, format: .number)
                }
                Picker("Unit", selection: $currentUnit, content: {ForEach(unitValues, id: \.self) {
                    Text($0)
                }})
                .pickerStyle(.segmented)
                Section("To") {
                    Text(conversion)
                }
                Picker("Unit", selection: $selectedUnit, content: {ForEach(unitValues, id: \.self) {
                    Text($0)
                }})
                .pickerStyle(.segmented)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
