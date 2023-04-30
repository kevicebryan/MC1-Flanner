//
//  User.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import CoreData
import Foundation

class UserModel: ObservableObject {
  let cdm = CoreDataManager.shared

  func addUser(name: String) {
    guard let userEntity = NSEntityDescription.entity(forEntityName: "User", in: cdm.viewContext)
    else {
      return
    }
    let user = User(entity: userEntity, insertInto: cdm.viewContext)

    user.id = UUID()
    user.username = name
    user.tags = NSSet(array: TagModel().getAllTags())
    cdm.save()
  }

  func getAllUsers() -> [User] {
    let req: NSFetchRequest<User> = User.fetchRequest()
    do {
      return try cdm.viewContext.fetch(req)
    } catch {
      print("Error Fetching Tags")
      return []
    }
  }

  func getUser() -> User? {
    let req: NSFetchRequest<User> = User.fetchRequest()
    do {
      return try cdm.viewContext.fetch(req).first ?? nil
    } catch {
      print("Error Fetching User")
      return nil
    }
  }

  func updateUserTag(tagName: String, like: Bool = false, dislike: Bool = false) {
    guard let tag = TagModel().getTagByName(name: tagName) else {
      return
    }
    if like {
      tag.weight = 3
    }
    if dislike {
      tag.weight = 1
    }
    if !like, !dislike {
      tag.weight = 2
    }
    cdm.save()
  }
}
