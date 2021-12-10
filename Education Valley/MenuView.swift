//
//  MenuView.swift
//  Education Valley
//
//  Created by Victor Colen on 09/12/21.
//

import SwiftUI

struct MenuView: View {
    @State private var numberOfQuestions = 10
    @State private var initalValue = 2
    @State private var finalValue = 10

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.red, .orange], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 30) {
                    ZStack {
                        LinearGradient(colors: [.red, .orange], startPoint: .bottom, endPoint: .top)
                        Stepper("Questions: \(numberOfQuestions)", value: $numberOfQuestions, in: 5...20, step: 5)
                            .padding()
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .cornerRadius(25)
                    .padding()
                    
                    ZStack {
                        LinearGradient(colors: [.red, .orange], startPoint: .bottom, endPoint: .top)
                        HStack {
                            Text("Starting from ")
                                .font(.title)
                                .foregroundColor(.white)
                            Picker("Minimal value", selection: $initalValue) {
                                ForEach(2..<12) {
                                    Text(String($0))
                                }
                            }
                            
                            Text(" to ")
                                .foregroundColor(.white)
                                .font(.title)
                            Picker("Max value", selection: $finalValue) {
                                ForEach(initalValue + 3..<13, id: \.self) {
                                    Text(String($0))
                                }
                            }
                        }
                        .padding()
                    }
                    .cornerRadius(25)
                    .padding()
                    
                    NavigationLink("Start Game", destination: ContentView(initialValue: initalValue + 2, finalValue: finalValue <= initalValue ? initalValue + 3 : finalValue, numberOfQuestions: numberOfQuestions))
                        .font(.title)
                }
                .navigationTitle("Education Valley")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
