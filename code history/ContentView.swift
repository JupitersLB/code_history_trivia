//
//  ContentView.swift
//  code history
//
//  Created by Liam Baker on 2022/01/01.
//

import SwiftUI

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

let primaryColor = Color(0x66D1D8)
let backgroundColor = Color(0xD5B9DF)

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
    var body: some View {
        ZStack{
            backgroundColor.ignoresSafeArea()
            VStack {
                Text("What is the name of the developer who wrote Ruby?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                VStack {
                    HStack{
                        Button(action: {
                            print("Clicked 1")
                        }, label: {
                            Text("Answer 1")
                        })
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .thin))
                        Button(action: {
                            print("Clicked 2")
                        }, label: {
                            Text("Answer 2")
                        })
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .thin))
                    }
                    HStack{
                        Button(action: {
                            print("Clicked 3")
                        }, label: {
                            Text("Answer 3")
                        })
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .thin))
                        Button(action: {
                            print("Clicked 4")
                        }, label: {
                            Text("Answer 4")
                        })
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .thin))
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
