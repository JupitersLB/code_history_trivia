//
//  ContentView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/01.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack{
            GameColor.backgroundColor.ignoresSafeArea()
            VStack {
                QuestionView(question: viewModel.currentQuestion)
                Text(viewModel.questionProgressText)
            }
            .navigationBarHidden(true)
            .environmentObject(viewModel)
        }
        .background(
            NavigationLink(
                destination: ScoreView(
                    viewModel: ScoreViewModel(
                        correctGuesses: viewModel.correctGuesses,
                        incorrectGuesses: viewModel.incorrectGuesses
                    ),
                    starColors: viewModel.answerSquence
                ),
                isActive: .constant(viewModel.gameIsOver),
                label: {EmptyView()}
            )
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
