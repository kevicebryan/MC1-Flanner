//
//  Task.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import CoreData
import Foundation

class TaskModel: ObservableObject {
  let cdm = CoreDataManager.shared

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
      return try cdm.viewContext.existingObject(with: id) as? Task
    } catch {
      return nil
    }
  }

  func getAllTasks() -> [Task] {
    let req: NSFetchRequest<Task> = Task.fetchRequest()
    do {
      return try cdm.viewContext.fetch(req)
    } catch {
      print("Error Fetching Activites")
      return []
    }
  }

  func getTaskTag(task: Task) {
    let tags: [Tag]

//    for tag in task.tags {
//      tags.append()
//    }
  }

  func addTask(name: String, loc: String = "", tagNames: [String], detail: String, img: String) {
    guard let taskEntity = NSEntityDescription.entity(forEntityName: "Task", in: cdm.viewContext)
    else {
      return
    }
    let task = Task(entity: taskEntity, insertInto: cdm.viewContext)
    task.id = UUID()
    task.name = name
    task.location = loc
    task.detail = detail
    task.image = img

    task.reviewed = false
    task.done = false
    task.reviewed = false

    var tags: [Tag] = []
    for tagName in tagNames {
      if let currTag = TagModel().getTagByName(name: tagName) {
        tags.append(currTag)
      }
    }
    task.tags = NSSet(array: tags)
    cdm.save()
  }

  func deleteTask(task: Task) {
    cdm.viewContext.delete(task)
    cdm.save()
  }
}
