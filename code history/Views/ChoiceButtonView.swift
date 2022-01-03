//
//  ChoiceButtonView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import Foundation
import SwiftUI

struct ChoiceButtonView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    let question: Question
    let answerIndex: Int
    
    var body: some View {
        Button(action: {
            viewModel.makeGuess(atIndex: answerIndex)
        }) {
            ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
        }
            .background(viewModel.color(forOptionIndex: answerIndex, isConfirmed: viewModel.choiceConfirmed))
            .cornerRadius(50)
            .shadow(color: .black, radius: 0.5, x: 1, y: 1)
            .padding(10)
            .disabled(viewModel.guessWasMade)
    }
}

struct ChoiceButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceButtonView(
            question: Game().currentQuestion,
            answerIndex: Game().currentQuestionIndex
        )
            .environmentObject(GameViewModel())
    }
}
