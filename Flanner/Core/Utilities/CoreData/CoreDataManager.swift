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

//  CRUD Activity -- g kepake harusny...
  func getActivitybyId(id: NSManagedObjectID) -> Activity? {
    do {
      return try viewContext.existingObject(with: id) as? Activity
    } catch {
      return nil
    }
  }

  func getAllActivity() -> [Activity] {
    let req: NSFetchRequest<Activity> = Activity.fetchRequest()

    do {
      return try viewContext.fetch(req)
    } catch {
      print("Error Fetching Activites")
      return []
    }
  }

  func addActivity(text: String) {
    let newActivity = Activity(context: viewContext)
    newActivity.name = text
  }

  func deleteActivity(activity: Activity) {
    viewContext.delete(activity)
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
