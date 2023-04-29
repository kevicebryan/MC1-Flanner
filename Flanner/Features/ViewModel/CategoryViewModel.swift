//
//  CategoryViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 27/04/23.
//

import Foundation

class CategoryManager: ObservableObject {
  @Published var categories: [Category]
  var selectedCategory: Int = 0

  init() {
      self.categories = [
      Category(name: "Sport", symbol: "figure.run"),
      Category(name: "Music", symbol: "music.quarternote.3"),
      Category(name: "Food", symbol: "fork.knife"),
      Category(name: "Travel", symbol: "airplane"),
      Category(name: "Movie", symbol: "popcorn"),
      Category(name: "Art", symbol: "paintpalette"),
      Category(name: "Gaming", symbol: "gamecontroller"),
      Category(name: "Nature", symbol: "leaf"),
    ]
  }
}

var dummyCategory = Category(name: "Sport", symbol: "figure.run")
