//
//  StartGameTextView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import SwiftUI

struct StartGameTextView: View {
    let str: String
    let geometry: GeometryProxy
    
    var body: some View {
        HStack{
            Spacer()
            Text("**\(str)**")
                .padding()
                .frame(width: geometry.size.width * 0.9, height: 60)
                .background(GameColor.primaryColor)
                .foregroundColor(.black)
                .cornerRadius(50)
            Spacer()
        }
    }
}

struct StartGameTextView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            StartGameTextView(str: "Give it a Try!", geometry: geometry)
        }
    }
}
