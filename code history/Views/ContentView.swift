//
//  ContentView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/01.
//

import SwiftUI
import WrappingStack

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

//struct ContentView: View {
//    var body: some View {
//        ZStack{
//            backgroundColor.ignoresSafeArea()
//            VStack {
//                Spacer()
//                    .frame(height: 100)
//                Text("How well do you know your coding Histroy!?")
//                    .padding()
//                    .foregroundColor(.black)
//                    .font(.largeTitle)
//                    .multilineTextAlignment(.center)
//                Spacer()
//                    .frame(height: 300)
//                GeometryReader { geometry in
//                    Button(action: {
//                        print("Clicked")
//                    }, label: {
//                        Text("**Give it a try!**")
//                    })
//                        .padding()
//                        .frame(width: geometry.size.width * 0.9, height: 60)
//                        .background(primaryColor)
//                        .foregroundColor(.black)
//                }
//            }
//        }
//    }
//}

struct ContentView: View {
    
    let primaryColor = Color(0x66D1D8)
    let backgroundColor = Color(0xD5B9DF)
    
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2)
    
    var body: some View {
        ZStack{
            backgroundColor.ignoresSafeArea()
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
        ContentView()
    }
}
