//
//  Prompts.swift
//  Flanner
//
//  Created by Kevin Bryan on 17/04/23.
//

import Foundation



struct Prompt { private init() {} }

extension Prompt {
//    static let noHistory = "No History"
    static let thisOrThatPrompts = ["What's your family preferences?", "Which type of place do you want to visit?", "What would you prefer when planning a family outing?", "Where do you prefer to do go for vacation?", "What would you prefer to do with your family?"]

    static let thisOrThatChoices = [["Big Family Gatherings", "Simple & Intimate Activity"], ["Public Places", "Private Places"], ["New Places", "Old Places"], ["Nature", "City"], ["Active", "Relaxing"]]
    
    static let thisOrThatSymbols = [["figure.2.and.child.holdinghands", "person.2.fill"], ["person.3.fill", "person.line.dotted.person.fill"], ["house.lodge.fill", "building.columns.fill"], ["leaf.fill", "building.2.fill"], ["mic.and.signal.meter.fill", "book.fill"]]
}

extension Prompt {
    struct Title {
//        static let segment = "Segment"
//        static let calculator = "Calculator"
//        static let history = "History"
//        static let bodyMassIndex = "Body Mass Index"
//        static let weight = "Weight (kg)"
//        static let height = "Height (cm)"
//        static let yourBodyMassIndex = "Your Body Mass Index"
//        static let time = "Time"
//        static let result = "BMI Result"
//        static let scale = "Scale"
//
        private init() {}
    }
}

extension Prompt {
    struct Button {
        static let saveToHistory = "Save to history"
        
        private init() {}
    }
}
