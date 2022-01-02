//
//  ChoiceTextView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import Foundation
import SwiftUI

struct ChoiceTextView: View {
    let choiceText: String
    
    var body: some View {
        Text(choiceText)
            .frame(width: 125)
            .padding()
            .foregroundColor(.black)
            .font(.system(size: 18, weight: .thin))
    }
}

struct ChoiceTextView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceTextView(choiceText: Game().currentQuestion.possibleAnswers[0])
    }
}
