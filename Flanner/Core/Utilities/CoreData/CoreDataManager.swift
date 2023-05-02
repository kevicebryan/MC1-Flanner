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

  //  Util save function:
  func save() {
    do {
      try viewContext.save()
    } catch {
      viewContext.rollback()
      print(error.localizedDescription)
    }
  }

  // Admin Functions
  func seedAllData() {
    print("preparing seeding Tags")
    TagModel().seedAllTags()
    print("preparig seeding Tasks")
    TaskModel().seedAllTasks()
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

  func deleteAllData() {
    print("attempting to delete all User")
    deleteAllEntity(entityName: "User")
    print("attempting to delete all Task")
    deleteAllEntity(entityName: "Task")
    print("attempting to delete all Tags")
    deleteAllEntity(entityName: "Tag")
    save()
  }
}
