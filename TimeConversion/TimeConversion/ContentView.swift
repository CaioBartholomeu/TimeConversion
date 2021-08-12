//
//  ContentView.swift
//  TimeConversion
//
//  Created by Caio Bartholomeu on 11/08/21.
//
import SwiftUI

struct ContentView: View {
    @State private var number = ""
    @State private var selectedTime = 0
    var times = ["hour", "minute", "second"]
    
    @State private var hour   = 0
    @State private var minute:Int = 0
    @State private var second = 0
    
    func totalCalculation (){
        if times[selectedTime] == "hour" {
            hour = Int(number) ?? 0
            minute = Int(number)!*60
            second = Int(number)!*60*60
        }
        
        if times[selectedTime] == "minute" {
            hour   = Int(number)!/60
            minute = Int(number) ?? 0
            second = Int(number)!*60
        }
        
        if times[selectedTime] == "second" {
            hour   = Int(number)!/60/60
            minute = Int(number)!/60
            second = Int(number) ?? 0
        }
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    Section(header: Text("Choice")) {
                        Picker("Tip percentage", selection: $selectedTime) {
                            ForEach(0 ..< times.count) {
                                Text("\(self.times[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    TextField("Enter a number", text: $number).keyboardType(.decimalPad)
                    
                    Group{
                        Button("Calculate"){
                            if number != "" {
                                totalCalculation()
                            }
                        }
                    }
                                     
                    Text("hour:      \(hour)")
                    Text("minute:  \(minute)")
                    Text("second: \(second)")
                                
                }
                /*
                Section{
                    Text("WeSplit")
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(0 ..< 100){
                            Text("\($0) people")
                        }
                    }
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Text("$\(totalPerPerson)")
                }*/
            
        }
            .navigationBarTitle("Time Conversion", displayMode:.inline)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
