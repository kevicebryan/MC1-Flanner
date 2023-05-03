//
//  TagViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import CoreData
import Foundation

class TagListViewModel: ObservableObject {
  let tagModel = TagModel()

  @Published var tags: [TagViewModel] = []

  init() {
    getAllTags()
  }

  func getAllTags() {
    tags = tagModel.getAllTags().map(TagViewModel.init)
  }
}

struct TagViewModel: Identifiable {
  let tag: Tag

  var id: NSManagedObjectID {
    return tag.objectID
  }

  var name: String {
    return tag.name ?? "ANONYMOUS CATEGORY"
  }

  var color: String {
    return tag.color ?? "d9d9d9"
  }

  var emoji: String {
    return tag.emoji ?? "﹒"
  }

  var weight: Int {
    return Int(tag.weight)
  }
}
