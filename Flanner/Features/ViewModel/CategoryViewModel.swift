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
      Category(name: "Sport", symbol: "figure.run", tagName: "Sport"),
      Category(name: "Music", symbol: "music.quarternote.3", tagName: "Music"),
      Category(name: "Food", symbol: "fork.knife", tagName: "Food"),
      Category(name: "Travel", symbol: "airplane", tagName: "Travel"),
      Category(name: "Movie", symbol: "popcorn.fill", tagName: "Movie"),
      Category(name: "Art", symbol: "paintbrush.fill", tagName: "Art"),
      Category(name: "Gaming", symbol: "gamecontroller.fill", tagName: "Gaming"),
      Category(name: "Nature", symbol: "leaf.fill", tagName: "Nature"),
    ]
  }
}

var dummyCategory = Category(name: "Sport", symbol: "figure.run", tagName: "Sport")
