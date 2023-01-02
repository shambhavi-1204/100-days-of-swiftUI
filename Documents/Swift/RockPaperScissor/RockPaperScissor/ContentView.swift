//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Shambhavi Jha on 01/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var possibleMoves = ["Rock","Paper","Scissor"]
    @State private var gameMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    @State private var roundScore = 0
    
    @State private var showingScore = false
    @State private var showingGameOver = true
    
    var shouldWinTitle: String {
        let winOrLose = shouldWin ? "win" : "lose"
        return "You have to \(winOrLose)"
    }
    
    @State private var numberOfTurns = 0
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue,.red]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                                
                Text("Rock Paper Scissors")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack {
                    
                    VStack {
                        Text("Game picked \(possibleMoves[gameMove])")
                            .padding()
                        Text(shouldWinTitle)
                    }
                    .font(.title.weight(.semibold))
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 300)
                    .padding(20)
                    
                    VStack {
                        ForEach(0..<3) { number in
                            Button(possibleMoves[number]) {
                                buttonTapped(number)
                            }
                        }
                        .font(.largeTitle.weight(.semibold))
                        .frame(width: 150)
                        .padding(20)
                        .background(.black)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    .padding(20)
                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Text("Your score is \(totalScore)")
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(totalScore)")
        }
//        .alert("Game over", isPresented: $showingGameOver) {
//            Button("Restart", action: restartGame)
//        } message: {
//            Text("Your final score is \(totalScore)")
//        }
    }
    
    func buttonTapped(_ playerMove: Int) {
        
        if gameMove == playerMove {
            roundScore = -1
        }
        else if gameMove == 0 {
            roundScore = playerMove == 1 ? 1 : 0
        }
        else if gameMove == 1 {
            roundScore = playerMove == 0 ? 0 : 1
        }
        else {
            roundScore = playerMove == 0 ? 1 : 0
        }

        if !shouldWin {
            if roundScore == 0 {
                roundScore = 1
            }
            if roundScore == 1 {
                roundScore = 0
            }
        }
        
        totalScore += roundScore
        numberOfTurns += 1
        
        if roundScore == -1 {
            scoreTitle = "It's a tie"
            totalScore += 1
        } else {
            scoreTitle = roundScore == 0 ? "Wrong" : "Correct"
        }
        
        showingScore = true
        showingGameOver = numberOfTurns == 3 ? true : false
    }
    
    func askQuestion() {
        gameMove = Int.random(in: 0...2)
        shouldWin.toggle()
        roundScore = 0
    }
    
//    func restartGame() {
//        totalScore = 0
//        roundScore = 0
//        numberOfTurns = 0
//        showingGameOver.toggle()
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
