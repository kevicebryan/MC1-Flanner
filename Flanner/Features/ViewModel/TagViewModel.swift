//
//  TagViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import CoreData
import Foundation

struct TagViewModel {
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
}
