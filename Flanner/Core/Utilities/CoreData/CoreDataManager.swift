//
//  CoreDataManager.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import CoreData
import Foundation

class CoreDataManager {
  let persistentContainer: NSPersistentContainer
  static let shared = CoreDataManager()

  var viewContext: NSManagedObjectContext {
    return persistentContainer.viewContext
  }

  private init() {
    persistentContainer = NSPersistentContainer(name: "FlannerModel")
    persistentContainer.loadPersistentStores {
      _, error in if let error = error {
        fatalError("Unable to initialize Core Data Stack \(error)")
      }
    }
  }

  // Users
  func addUser(name: String) {
    guard let userEntity = NSEntityDescription.entity(forEntityName: "User", in: viewContext)
    else {
      return
    }
    let user = User(entity: userEntity, insertInto: viewContext)

    user.username = name
    user.tags = NSSet(array: getAllTags())
    save()
  }

  func getUser() -> User? {
    let req: NSFetchRequest<User> = User.fetchRequest()
    do {
      return try viewContext.fetch(req).first ?? nil
    } catch {
      print("Error Fetching User")
      return nil
    }
  }

  func updateUserTag(tagName: String, like: Bool = false, dislike: Bool = false) {
    let tag = getTagByName(name: tagName)
    if like {
      tag?.weight = 3
    }
    if dislike {
      tag?.weight = 1
    }
    if !like, !dislike {
      tag?.weight = 2
    }
  }

  // Tags --> note: Like= 3, B-Aja=2, Dislike=1
  func getAllTags() -> [Tag] {
    let req: NSFetchRequest<Tag> = Tag.fetchRequest()
    do {
      return try viewContext.fetch(req)
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
    guard let tagEntity = NSEntityDescription.entity(forEntityName: "Tag", in: viewContext)
    else {
      return
    }
//    let tagObj = NSManagedObject(entity: tagEntity, insertInto: viewContext)
    var newTag = Tag(entity: tagEntity, insertInto: viewContext)
    newTag.name = name
    newTag.color = color
    newTag.weight = Int32(weight)
    save()
    print("Added new tag: \(name)")
  }

  func getTagByName(name: String) -> Tag? {
    let req: NSFetchRequest<Tag>
    req = Tag.fetchRequest()
    req.predicate = NSPredicate(
      format: "name LIKE %@", name
    )
    do {
      return try viewContext.fetch(req).first
    } catch {
      print("Error Fetching Tag: \(name)")
      return nil
    }
  }

  // Tasks
  func seedAllTasks() {
    let tasks = getAllTasks()
    if tasks.isEmpty {
      for taskSeed in taskSeeds {
        addTask(name: taskSeed.name, tagNames: taskSeed.tagNames, detail: taskSeed.detail, img: taskSeed.img)
      }
    } else {
      print("Your tasks have been seeded before: \(tasks.count) existing tasks")
    }
  }

  func getTaskById(id: NSManagedObjectID) -> Task? {
    do {
      return try viewContext.existingObject(with: id) as? Task
    } catch {
      return nil
    }
  }

  func getAllTasks() -> [Task] {
    let req: NSFetchRequest<Task> = Task.fetchRequest()
    do {
      return try viewContext.fetch(req)
    } catch {
      print("Error Fetching Activites")
      return []
    }
  }

  func addTask(name: String, loc: String = "Jakarta", tagNames: [String], detail: String, img: String)
  {
    guard let taskEntity = NSEntityDescription.entity(forEntityName: "Task", in: viewContext)
    else {
      return
    }
    let task = Task(entity: taskEntity, insertInto: viewContext)
    task.name = name
    task.location = loc
    task.detail = detail
    task.image = img

    var tags: [Tag] = []
    for tagName in tagNames {
      if let currTag = getTagByName(name: tagName) {
        tags.append(currTag)
      }
    }
    task.tags = NSSet(array: tags)
    save()
  }

  func deleteTask(task: Task) {
    viewContext.delete(task)
    save()
  }

  func deleteAllEntity(entityName: String) {
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
    let deleteReq = NSBatchDeleteRequest(fetchRequest: fetchRequest)

    do {
      try viewContext.execute(deleteReq)
    } catch let error as NSError {
      print(error)
    }
  }

  // Admin Functions
  func seedAllData() {
    print("preparing seeding Tags")
    seedAllTags()
    print("preparig seeding Tasks")
    seedAllTasks()
  }

  func deleteAllData() {
    print("attempting to delete all User")
    deleteAllEntity(entityName: "User")
    print("attempting to delete all Task")
    deleteAllEntity(entityName: "Task")
    print("attempting to delete all Tags")
    deleteAllEntity(entityName: "Tag")
    save()
  }

  //  Util save function:
  func save() {
    do {
      try viewContext.save()
    } catch {
      viewContext.rollback()
      print(error.localizedDescription)
    }
  }
}
