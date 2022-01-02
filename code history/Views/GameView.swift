//
//  ContentView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/01.
//

import SwiftUI
import WrappingStack

struct GameView: View {
    
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2)
    
    var body: some View {
        ZStack{
            GameColor.backgroundColor.ignoresSafeArea()
            VStack {
                Text(question.questionText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                WrappingHStack(id: \.self) {
                    ForEach(0..<question.possibleAnswers.count, id: \.self) { answerIndex in
                        ChoiceButtonView(question: question, index: answerIndex)
                    }
                }
                Spacer()
                Text("1/10")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
