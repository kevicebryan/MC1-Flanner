//
//  InterestViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 27/04/23.
//

import Foundation

class InterestManager: ObservableObject {
  @Published var interests: [Interest]
  var selectedInterested: Int = 0

  init() {
    self.interests = [
      Interest(name: "Sport", symbol: "figure.run"),
      Interest(name: "Music", symbol: "music.quarternote.3"),
      Interest(name: "Food", symbol: "fork.knife"),
      Interest(name: "Travel", symbol: "airplane"),
      Interest(name: "Movie", symbol: "popcorn"),
      Interest(name: "Art", symbol: "paintpalette"),
      Interest(name: "Gaming", symbol: "gamecontroller"),
      Interest(name: "Nature", symbol: "leaf"),
    ]
  }
}

var dummyInterest = Interest(name: "Sport", symbol: "figure.run")
