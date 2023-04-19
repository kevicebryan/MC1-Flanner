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

//  CRUD Task -- g kepake harusny...
  func getTaskById(id: NSManagedObjectID) -> Task? {
    do {
      return try viewContext.existingObject(with: id) as? Task
    } catch {
      return nil
    }
  }

  func getAllTask() -> [Task] {
    let req: NSFetchRequest<Task> = Task.fetchRequest()
    do {
      return try viewContext.fetch(req)
    } catch {
      print("Error Fetching Activites")
      return []
    }
  }

  func addTask(text: String) {
    let newActivity = Task(context: viewContext)
    newActivity.name = text
  }

  func deleteTask(task: Task) {
    viewContext.delete(task)
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
