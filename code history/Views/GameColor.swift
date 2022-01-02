//
//  GameColor.swift
//  code history
//
//  Created by Liam Baker on 2022/01/02.
//

import Foundation
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

struct GameColor {
    static let primaryColor = Color(0x66D1D8)
    static let backgroundColor = Color(0xD5B9DF)
    static let buttonColor = Color(.white)
    static let selectedGuess = Color(0x9BDAE8)
    static let incorrectGuess = Color(0xF42222)
    static let correctGuess = Color(0x76D866)
}
