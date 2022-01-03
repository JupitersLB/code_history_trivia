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
    
    var gameIsOver: Bool {
        game.isOver
    }
    
    var correctGuesses: Int {
        game.guessCount.correct
    }
   
    var incorrectGuesses: Int {
        game.guessCount.incorrect
    }
    
    var answerSquence: [Color] {
        var colors: [Color] = []
        for (question, guess) in game.guesses {
            if question.correctAnswerIndex == guess {
                colors.append(GameColor.correctGuess)
            } else {
                colors.append(GameColor.incorrectGuess)
            }
        }
        return colors
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
             if guessedIndex != optionIndex {
                 return GameColor.buttonColor
             } else if guessedIndex == currentQuestion.correctAnswerIndex && isConfirmed {
                 return GameColor.correctGuess
             } else if guessedIndex != currentQuestion.correctAnswerIndex && isConfirmed {
                 return GameColor.incorrectGuess
             } else if guessedIndex == optionIndex {
                 return GameColor.selectedGuess
             }
             else {
                 return GameColor.selectedGuess
             }
         } else {
             return GameColor.buttonColor
         }
     }
}
