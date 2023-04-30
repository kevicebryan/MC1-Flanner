//
//  TaskListViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import CoreData
import Foundation

class TaskListViewModel: ObservableObject {
  let taskModel = TaskModel()

  @Published var tasks: [TaskViewModel] = []
  @Published var recommendations: [TaskViewModel] = []

  init() {
    getAllTask()
  }

  func getAllTask() {
    tasks = taskModel.getAllTasks().map(TaskViewModel.init)
  }

  func getRecommendations() {
//    recommendations = CoreDataManager.shared.getRecommendations().map(TaskViewModel.init)
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

  var image: String {
    return task.image ?? "defaultTaskImage"
  }

  var detail: String {
    return task.detail ?? "There ar currently no details"
  }

  var location: String {
    return task.location ?? ""
  }

  var tags: [Tag] {
    return task.tags?.allObjects as! [Tag]
  }
}
