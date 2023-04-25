//
//  DummyData.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import Foundation
import SwiftUI

struct DummyTask: Hashable, Identifiable {
  let id = UUID()
  var name: String = "Long Task Name"
  var location: String = "The Breeze, BSD City"
  var image: String = "dummyImage"
  var tags: [DummyTag] = [DummyTag(), DummyTag()]
}

struct DummyTag: Hashable, Identifiable {
  let id = UUID()
  var name: String = "👋 Tag"
  var color: String = "00A4B4"
}

let dummyTasks = [DummyTask(), DummyTask(), DummyTask()]

let dummyTags = [DummyTag(), DummyTag(), DummyTag()]
