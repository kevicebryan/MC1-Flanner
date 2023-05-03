//
//  SeederData.swift
//  Flanner
//
//  Created by Kevin Bryan on 29/04/23.
//

import CoreData
import Foundation

let cdm = CoreDataManager.shared

public struct tagSeed {
  var name: String
  var color: String
  var emoji: String
}

public struct taskSeed {
  var name: String
  var detail: String
  var img: String
  var loc: String
  var tagNames: [String]
}

public let tagSeeds = [tagSeed(name: "Indoor", color: "EA996A", emoji: "🚪"),
                       tagSeed(name: "Outdoor", color: "1F7C88", emoji: "🏕️"),
                       tagSeed(name: "Music", color: "1F7C88", emoji: "🎶"),
                       tagSeed(name: "Art", color: "D38800", emoji: "🎨"),
                       tagSeed(name: "Sport", color: "D66828", emoji: "🏎️"),
                       tagSeed(name: "Game", color: "015560", emoji: "🎮"),
                       tagSeed(name: "Food", color: "EA996A", emoji: "🍽️"),
                       tagSeed(name: "Movie", color: "D66828", emoji: "🍿"),
                       tagSeed(name: "Adrenaline", color: "D66828", emoji: "🎢"),
                       tagSeed(name: "Nature", color: "4AAAB6", emoji: "🍃"),
                       tagSeed(name: "Travel", color: "8BD1D8", emoji: "✈️"),
                       tagSeed(name: "Crowded", color: "F3A923", emoji: "👫"),
                       tagSeed(name: "Relaxing", color: "4AAAB6", emoji: "🧘"),
                       tagSeed(name: "Private", color: "4AAAB6", emoji: "🔒")]

public let taskSeeds = [
  taskSeed(name: "Watch Movie",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["Movie", "Indoor", "Games"]),
  taskSeed(name: "SportOutdoor",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["Travel", "Indoor", "Adrenaline"]),
  taskSeed(name: "SportOutdoor",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["Sport", "Outdoor", "Adrenaline"]),
  taskSeed(name: "SportOutdoor",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["Sport", "Outdoor", "Adrenaline"]),
  taskSeed(name: "SportOutdoor",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["Sport", "Outdoor", "Adrenaline"]),
  taskSeed(name: "SportOutdoor",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["Sport", "Outdoor", "Adrenaline"]),
  taskSeed(name: "Picnic",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["", "", ""]),
  taskSeed(name: "Picnic",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["", "", ""]),
  taskSeed(name: "Picnic",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["", "", ""]),
  taskSeed(name: "Picnic",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["", "", ""]),
  taskSeed(name: "Picnic",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["", "", ""]),
  taskSeed(name: "Picnic",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["", "", ""]),
]
