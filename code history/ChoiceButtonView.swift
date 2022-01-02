//
//  ChoiceButtonView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import Foundation
import SwiftUI

struct ChoiceButtonView: View {
    let question: Question
    let index: Int
    @State var buttonColor = Color(0xFFFFFF)
    
    var body: some View {
        Button(action: {
            print("Clicked \(index + 1)")
            buttonColor = index == question.correctAnswerIndex ? .green : .red
        }, label: {
            ChoiceTextView(choiceText: question.possibleAnswers[index], color: buttonColor)
        })
            .shadow(color: .black, radius: 0.5, x: 1, y: 1)
            .padding(10)
    }
}

struct ChoiceButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceButtonView(
            question: Question(
                questionText: "What was the first computer bug?",
                possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
                correctAnswerIndex: 2
            ),
            index: 0
        )
    }
}
