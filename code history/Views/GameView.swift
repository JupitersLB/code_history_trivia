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
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
