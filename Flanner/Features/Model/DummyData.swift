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
  var location: String = "Ada Location"
  var image: String = "dummyImage"
  var tags: [DummyTag] = [DummyTag(), DummyTag()]
}

struct DummyRecord: Hashable, Identifiable {
  let id = UUID()
  var name: String = "Long Task Name"
  var location: String = "Ada Location"
  var image: String = "dummyImage"
  var tags: [DummyTag] = [DummyTag(), DummyTag()]
  var reviewed: Bool = false
  var done: Bool = false
  var rating: Int = 0
}

struct DummyTag: Hashable, Identifiable {
  let id = UUID()
  var name: String = "👋 Tag"
  var color: String = "00A4B4"
}

let dummyTasks = [DummyTask(), DummyTask(), DummyTask()]

let dummyTags = [DummyTag(), DummyTag(), DummyTag()]

let dummyRecords = [DummyRecord(), DummyRecord(), DummyRecord()]
