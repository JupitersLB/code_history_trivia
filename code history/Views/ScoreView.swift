//
//  ScoreView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/03.
//

import SwiftUI
import WrappingStack

struct ScoreView: View {
    let viewModel: ScoreViewModel
    let starColors: [Color]
    
    var body: some View {
        
        ZStack{
            GameColor.backgroundColor.ignoresSafeArea()
            VStack{
                Spacer()
                    .frame(height: 200)
                HStack{
                    Text("Final Score:")
                    Text(viewModel.displayPercentage)
                        .font(.largeTitle)
                }
                Spacer()
                    .frame(height: 100)
                WrappingHStack(id: \.self) {
                    ForEach(0..<starColors.count, id: \.self) { idx in
                        Image(systemName: "star.fill")
                            .renderingMode(.template)
                            .foregroundColor(starColors[idx])
                    }
                }
                Spacer()
                GeometryReader { geometry in
                    NavigationLink(
                        destination: GameView(),
                        label: {
                            BottomButtonTextView(str: "Give it a try!", geometry: geometry)
                        }
                    )
                }
                    .frame(maxWidth: .infinity, maxHeight: 60)
            }
                .foregroundColor(.black)
                .navigationBarHidden(true)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(
            viewModel: ScoreViewModel(
                correctGuesses: GameViewModel().correctGuesses,
                incorrectGuesses: GameViewModel().incorrectGuesses
            ),
            starColors: GameViewModel().answerSquence
        )
    }
}
