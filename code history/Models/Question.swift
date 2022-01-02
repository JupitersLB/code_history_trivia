//
//  Question.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import Foundation

struct Question: Hashable {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    var selectedGuess: Int
    
    static var allQuestions = [
        Question(
            questionText: "Who invented the World Wide Web?",
            possibleAnswers: [
                "Steve Jobs",
                "Linus Torvalds",
                "Bill Gates",
                "Tim Berners-Lee"
            ],
            correctAnswerIndex: 3,
            selectedGuess: 0
        ),
        Question(
            questionText: "What was the first object oriented programming language?",
            possibleAnswers: [
                "Simula",
                "Python",
                "Swift",
                "C"
            ],
            correctAnswerIndex: 0,
            selectedGuess: 0
        )
    ]
    
    mutating func updateSelectedGuess(atIndex index: Int) {
        selectedGuess = index
    }

}
