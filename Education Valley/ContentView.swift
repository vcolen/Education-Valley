//
//  ContentView.swift
//  Education Valley
//
//  Created by Victor Colen on 09/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var result = ""
    
    @State private var currentInitalValue = 1
    @State private var currentFinalValue = 10
    
    @State private var isShowingEndGame = false
    @State private var isShowingScore = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var currentQuestion = 0
    @State private var score = 0
    
    var initialValue: Int
    var finalValue: Int
    var numberOfQuestions: Int
    
    @State private var rotationAmount = 0.0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                Text("\(currentInitalValue) X \(currentFinalValue)?")
                    .font(.largeTitle)
                    .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 0, z: 1))
                
                TextField("Result", text: $result)
                    .padding()
                    .keyboardType(.numberPad)
                
                Button("Check Result") {
                    checkResult()
                }
                
                Text("Score: \(score) / \(numberOfQuestions)")
                    .font(.title2)
            }
            .alert(alertTitle, isPresented: $isShowingScore) {
                Button("Next Question") {
                    newQuestion()
                }
            } message: {
                Text(alertMessage)
            }
            
            .alert(alertTitle, isPresented: $isShowingEndGame) {
                NavigationLink("Play Again!", destination: MenuView())
                
            } message: {
                Text(alertMessage)
            }
        }
        .onAppear {
            currentInitalValue = Int.random(in: initialValue...finalValue)
            currentFinalValue = Int.random(in: initialValue...finalValue)
        }
    }
    
    func checkResult() {
        if Int(result) == currentInitalValue * currentFinalValue {
            alertTitle = "Nice job!"
            alertMessage = "You got it right"
            score += 1
        } else {
            alertTitle = "Oops, wrong answer"
            alertMessage = "Correct answer was \(currentInitalValue * currentFinalValue)"
        }
        
        isShowingScore = true
    }
    
    func newQuestion() {
        withAnimation {
            rotationAmount += 360
            currentFinalValue = Int.random(in: initialValue...finalValue)
            currentInitalValue = Int.random(in: initialValue...finalValue)
        }
        
        if currentQuestion < numberOfQuestions - 1{
            currentQuestion += 1
        } else {
            endGame()
        }
        result = ""
    }
    
    func endGame() {
        alertTitle = "The game has ended"
        alertMessage = "Your got \(score) out of \(numberOfQuestions) questions."
        isShowingEndGame = true
        
        currentQuestion = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(initialValue: 1, finalValue: 10, numberOfQuestions: 10)
    }
}
