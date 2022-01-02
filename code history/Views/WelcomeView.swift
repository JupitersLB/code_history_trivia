//
//  WelcomeView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack{
                GameColor.backgroundColor.ignoresSafeArea()
                VStack {
                    Spacer()
                        .frame(height: 100)
                    Text("How well do you know your coding Histroy!?")
                        .padding()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: 300)
                    GeometryReader { geometry in
                        NavigationLink(
                            destination: GameView(),
                            label: {
                                StartGameTextView(str: "Give it a try!", geometry: geometry)
                            }
                        )
                            
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
