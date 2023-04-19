//
//  TaskListViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import CoreData
import Foundation

class TaskListViewModel: ObservableObject {
  var name: String = ""
  @Published var activites: [TaskViewModel] = []

  func getAllTask() {
    activites = CoreDataManager.shared.getAllTask().map(TaskViewModel.init)
  }

  func delete(_ task: TaskViewModel) {
    let currTask = CoreDataManager.shared.getTaskById(id: task.id)

    if let currTask = currTask {
      CoreDataManager.shared.deleteTask(task: currTask)
    }
  }

  func save() {
    let task = Task(context: CoreDataManager.shared.viewContext)
    task.name = name
    CoreDataManager.shared.save()
  }
}

struct TaskViewModel {
  let task: Task

  var id: NSManagedObjectID {
    return task.objectID
  }

  var name: String {
    return task.name ?? ""
  }
}
