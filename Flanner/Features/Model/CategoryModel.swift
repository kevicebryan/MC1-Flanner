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
  var tagName: String

  init(name: String, symbol: String, tagName: String) {
    self.name = name
    self.symbol = symbol
    self.selected = false
    self.tagName = tagName
  }

  mutating func toggleSelected() {
    self.selected = !self.selected
  }

  func updateUserTag() {
    UserModel().updateUserTag(tagName: self.tagName, like: true)
  }
}
