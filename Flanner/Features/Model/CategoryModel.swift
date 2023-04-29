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
  var selected: Bool

  init(name: String, symbol: String) {
    self.name = name
    self.symbol = symbol
    self.selected = false
  }

  mutating func toggleSelected() {
    self.selected = !self.selected
  }
//  var tag
}


