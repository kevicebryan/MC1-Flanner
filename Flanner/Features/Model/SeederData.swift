//
//  SeederData.swift
//  Flanner
//
//  Created by Kevin Bryan on 29/04/23.
//

import Foundation

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

public let tagSeeds = [tagSeed(name: "Indoor", color: "5C5258", emoji: ""),
                       tagSeed(name: "Outdoor", color: "91F760", emoji: ""),
                       tagSeed(name: "Music", color: "FD5D9E", emoji: ""),
                       tagSeed(name: "Art", color: "5DFDBC", emoji: ""),
                       tagSeed(name: "Sport", color: "F04444", emoji: ""),
                       tagSeed(name: "Game", color: "#6C5DFD", emoji: ""),
                       tagSeed(name: "Food", color: "F77B60", emoji: ""),
                       tagSeed(name: "Movie", color: "C760F7", emoji: ""),
                       tagSeed(name: "Adrenaline", color: "D19949", emoji: ""),
                       tagSeed(name: "Nature", color: "2A904F", emoji: ""),
                       tagSeed(name: "Travel", color: "60DCF7", emoji: ""),
                       tagSeed(name: "Crowded", color: "5DFDBC", emoji: ""),
                       tagSeed(name: "Private", color: "EEFD5D", emoji: "")]

public let taskSeeds = [
  taskSeed(name: "Watch Movie",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["Movie", "Indoor"]),
  taskSeed(name: "Picnic",
           detail: "the quick brown fox jumps over the lazy dog",
           img: "", loc: "", tagNames: ["Food", "Outdoor", "Private"])
]
