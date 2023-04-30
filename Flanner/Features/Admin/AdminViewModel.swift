//
//  AdminViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import Foundation

class AdminManager: ObservableObject {
  let cdm: CoreDataManager
  let tagM = TagModel()
  let taskM = TaskModel()

  var tags: [Tag]
  var tasks: [TaskViewModel]

  init() {
    cdm = CoreDataManager.shared
    tags = tagM.getAllTags()
    tasks = taskM.getAllTasks().map(TaskViewModel.init)
  }

  func refreshData() {
    tags = tagM.getAllTags()
    tasks = taskM.getAllTasks().map(TaskViewModel.init)
  }

  func seedInitialData() {
    cdm.seedAllData()
    refreshData()
  }

  func deleteAll() {
    cdm.deleteAllData()
    refreshData()
  }
}
