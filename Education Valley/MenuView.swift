//
//  MenuView.swift
//  Education Valley
//
//  Created by Victor Colen on 09/12/21.
//

import SwiftUI

struct MenuView: View {
    @State private var numberOfQuestions = 10
    @State private var initalValue = 0
    @State private var finalValue = 10
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 50) {
                Stepper("How many questions? Current: \(numberOfQuestions)", value: $numberOfQuestions, in: 5...20, step: 5)
                
                Text("Choose the inital Value")
                Picker("Inital value", selection: $initalValue) {
                    ForEach(1..<101) {
                        Text(String($0))
                    }
                }
                
                Text("Choose the final Value")
                Picker("Final value", selection: $finalValue) {
                    ForEach(initalValue + 2..<101, id: \.self) {
                        Text(String($0))
                    }
                }
                
                NavigationLink("Start Game", destination: ContentView(initialValue: initalValue + 1, finalValue: finalValue, numberOfQuestions: numberOfQuestions))
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
