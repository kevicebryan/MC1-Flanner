//
//  Tag.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import CoreData
import Foundation

class TagModel: ObservableObject {
  let cdm = CoreDataManager.shared

  func getAllTags() -> [Tag] {
    let req: NSFetchRequest<Tag> = Tag.fetchRequest()
    do {
      return try cdm.viewContext.fetch(req)
    } catch {
      print("Error Fetching Tags")
      return []
    }
  }

  func seedAllTags() {
    let tags = getAllTags()
    if tags.isEmpty {
      for tagSeed in tagSeeds {
        addTag(name: tagSeed.name, color: tagSeed.color)
      }
      print("SEEDED All Tags")
    } else {
      print("Your tags have been seeded before: \(tags.count) existing tags")
    }
  }

  func addTag(name: String, color: String, weight: Int = 2) {
    let tagEntry = NSEntityDescription.insertNewObject(forEntityName: "Tag", into: cdm.viewContext)
    tagEntry.setValue(UUID(), forKey: "id")
    tagEntry.setValue(Int32(2), forKey: "weight")
    tagEntry.setValue(name, forKey: "name")
    tagEntry.setValue(color, forKey: "color")
    cdm.save()
    print("Added new tag: \(name)")
  }

  func getTagByName(name: String) -> Tag? {
    let req: NSFetchRequest<Tag>
    req = Tag.fetchRequest()
    req.predicate = NSPredicate(
      format: "name LIKE %@", name
    )
    do {
      return try cdm.viewContext.fetch(req).first
    } catch {
      print("Error Fetching Tag: \(name)")
      return nil
    }
  }
}
