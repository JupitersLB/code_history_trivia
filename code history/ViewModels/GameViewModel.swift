//
//  GameViewModel.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
 
    @Published private var game = Game()
     
    var currentQuestion: Question {
        game.currentQuestion
    }
        
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
    
    var guessWasMade: Bool {
        if let _ = game.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    
    var displayRestultText: String {
        if let guessedIndex = game.guesses[currentQuestion] {
            if (guessedIndex == currentQuestion.correctAnswerIndex) {
                return "Correct"
            } else {
                return "Incorrect"
            }
        } else {
            return "Incorrect"
        }
    }
    
    var choiceConfirmed: Bool {
        game.choiceConfirmed
    }
    
    func confirmChoice() {
        game.confirmChoice(isConirmed: true)
    }
    
    func resetChoice() {
        game.confirmChoice(isConirmed: false)
    }
    
    func makeGuess(atIndex index: Int) {
        game.makeGuessForCurrentQuestion(atIndex: index)
    }
    
    func displayNextScreen() {
        game.updateGameStatus()
        resetChoice()
    }
    
    func color(forOptionIndex optionIndex: Int, isConfirmed: Bool) -> Color {
         if let guessedIndex = game.guesses[currentQuestion] {
             if guessedIndex != optionIndex && !isConfirmed {
                 return GameColor.buttonColor
             } else if guessedIndex == currentQuestion.correctAnswerIndex && isConfirmed && optionIndex == currentQuestion.selectedGuess {
                 return GameColor.correctGuess
             } else if guessedIndex != currentQuestion.correctAnswerIndex && isConfirmed && optionIndex == currentQuestion.selectedGuess {
                 return GameColor.incorrectGuess
             } else if isConfirmed {
                 return GameColor.buttonColor
             }
             else {
                 return GameColor.selectedGuess
             }
         } else {
             return GameColor.buttonColor
         }
     }
}
