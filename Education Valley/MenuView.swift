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
                Color.mainBackground
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 30) {
                    
                    Stepper("\(numberOfQuestions) questions ", value: $numberOfQuestions, in: 5...20, step: 5)
                        .padding()
                        .background(.secondBackground)
                        .cornerRadius(25)
                        .padding()
                    
                    HStack {
                        Text("Lowest number: ")
                        Picker("Minimal value", selection: $initalValue) {
                            ForEach(2..<12) {
                                Text(String($0))
                            }
                        }
                    }
                    .padding()
                    .background(.secondBackground)
                    .cornerRadius(25)
                    .padding()
                    
                    HStack {
                        Text("Highest Number:")
                        Picker("Max value", selection: $finalValue) {
                            ForEach(initalValue + 3..<13, id: \.self) {
                                Text(String($0))
                            }
                        }
                    }
                    .padding()
                    .background(.secondBackground)
                    .cornerRadius(25)
                    .padding()
                    
                    NavigationLink {
                        ContentView(initialValue: initalValue + 2, finalValue: finalValue <= initalValue ? initalValue + 3 : finalValue, numberOfQuestions: numberOfQuestions)
                    } label: {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Start Game")
                        }
                        .padding()
                        .background(.secondBackground)
                        .cornerRadius(25)
                        .frame(maxWidth: .infinity)
                        
                    }
                    
                }
                .navigationTitle("Education Valley")
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
