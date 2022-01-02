//
//  QuestionView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import SwiftUI
import WrappingStack

struct QuestionView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    let question: Question
    
    var body: some View {
        VStack {
            Text(question.questionText)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            WrappingHStack(id: \.self) {
                ForEach(0..<question.possibleAnswers.count, id: \.self) { answerIndex in
                    ChoiceButtonView(question: question, answerIndex: answerIndex)
                }
            }
            Spacer()
            if viewModel.guessWasMade && viewModel.choiceConfirmed {
                Text(viewModel.displayRestultText)
            }
            Spacer()
            if viewModel.guessWasMade {
                GeometryReader { geometry in
                    Button(action: {
                        viewModel.choiceConfirmed ? viewModel.displayNextScreen() : viewModel.confirmChoice()
                    }) {
                        BottomButtonTextView(str: viewModel.choiceConfirmed ? "Next" : "Confirm", geometry: geometry)
                    }
                    .shadow(color: .black, radius: 2, x: 0.5, y: 0.5)
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Game().currentQuestion)
            .environmentObject(GameViewModel())
    }
}
