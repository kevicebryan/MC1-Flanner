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

  func updateTagWeight(tagName: String, like: Bool = false, dislike: Bool = false) {
    print("Updating User tag --> \(tagName)")
    guard let tag = getTagByName(name: tagName)
    else {
      print("didn't get the get!")
      return
    }
    if like {
      print("Setting \(tagName) to 3")
      tag.weight = 3
    }
    if dislike {
      print("Setting \(tagName) to 1")
      tag.weight = 1
    }
    if !like && !dislike {
      tag.weight = 2
    }
    cdm.save()
  }

  func seedAllTags() {
    let tags = getAllTags()
    if tags.isEmpty {
      for tagSeed in tagSeeds {
        addTag(name: tagSeed.name, color: tagSeed.color, emoji: tagSeed.emoji)
      }
      print("SEEDED All Tags")
    } else {
      print("Your tags have been seeded before: \(tags.count) existing tags")
    }
  }

  func addTag(name: String, color: String, emoji: String, weight: Int = 2) {
    let tagEntry = NSEntityDescription.insertNewObject(forEntityName: "Tag", into: cdm.viewContext)
    tagEntry.setValue(UUID(), forKey: "id")
    tagEntry.setValue(Int32(2), forKey: "weight")
    tagEntry.setValue(emoji, forKey: "emoji")
    tagEntry.setValue(name, forKey: "name")
    tagEntry.setValue(color, forKey: "color")
    cdm.save()
    print("Added new tag: \(name)")
  }
}
