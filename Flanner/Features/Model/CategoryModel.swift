//
//  InterestModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 27/04/23.
//

import Foundation
import SwiftUI

struct Category {
  var name: String
  var symbol: String
  var property = "normal"
  var selected: Bool
  var tagName: String

  init(name: String, symbol: String, tagName: String) {
    self.name = name
    self.symbol = symbol
    self.selected = false
    self.tagName = tagName
  }
}

struct symbolInPreferencesView: View {
  var symbol: String

  var body: some View {
    switch symbol {
    case "gamecontroller.fill":
      Image(systemName: "\(symbol)")
        .font(.system(size: 65))
        .frame(width: 195, height: 160, alignment: .bottomLeading)
        .padding(.bottom, 6)
    default:
      Image(systemName: "\(symbol)")
        .font(.system(size: 65))
        .frame(width: 150, height: 150, alignment: .bottomLeading)
        .padding(.bottom, 6)
    }
  }
}
