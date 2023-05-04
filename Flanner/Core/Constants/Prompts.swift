//
//  Prompts.swift
//  Flanner
//
//  Created by Kevin Bryan on 17/04/23.
//

import Foundation
import SwiftUI

struct Prompt { private init() {} }

extension Prompt {
  // MARK: This or That (Onboarding)

  static let thisOrThatPrompts = ["What's your family preferences?", "Which type of place do you want to visit?", "What would you prefer when planning a family outing?", "Where do you prefer to do go for vacation?", "What would you prefer to do with your family?"]

  static let thisOrThatChoices = [["Big Family Gatherings", "Simple & Intimate Activity"],
                                  ["Public Places", "Private Places"],
                                  ["New Places", "Old Places"],
                                  ["Nature", "City"],
                                  ["Active", "Relaxing"]]

  static let thisOrThatSymbols = [["figure.2.and.child.holdinghands", "person.2.fill"], ["person.3.fill", "person.line.dotted.person.fill"], ["house.lodge.fill", "building.columns.fill"], ["leaf.fill", "building.2.fill"], ["mic.and.signal.meter.fill", "book.fill"]]

  static let thisOrthatTags = [["Crowded", ""],
                               ["Public", "Private"],
                               ["Adrenaline", ""],
                               ["Nature", "Indoor"],
                               ["Sport", "Relaxing"]]

  static let planPrompts = ["Which place do you prefer today?",
                            "What do you feel like doing today?",
                            "Please choose your preference"]

  static let planChoices = [
    ["Indoor", "Outdoor"],
    ["I want to relax and chill", "I feel energized!"],
    ["Music", "Movie", "Art", "Nature", "Food"],
    ["Sport", "Music", "Nature", "Travel", "Game"],
  ]

  static let planTags = [
    ["Indoor", "Outdoor"],
    ["", ""],
    ["Music", "Movie", "Art", "Nature", "Food"],
    ["Sport", "Music", "Nature", "Travel", "Game"],
  ]

  // MARK: Default Images

  static let onBoardingImage = Image("onBoarding")
  static let planBridgeImage = Image("onBoarding")
  static let dummyImage = Image("dummyImage")
}

// extension Prompt {
//  struct Title {
//    private init() {}
//  }
// }
