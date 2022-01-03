//
//  ScoreViewModel.swift
//  code history
//
//  Created by Liam Baker on 2022/01/03.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
 
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
    
    var displayPercentage: String {
        "\(percentage)%"
    }
}
