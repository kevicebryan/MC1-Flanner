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
  let userM = UserModel()

  var tags: [TagViewModel]
  var tasks: [TaskViewModel]
  var users: [UserViewModel]

  init() {
    cdm = CoreDataManager.shared

    users = userM.getAllUsers().map(UserViewModel.init)
    tags = tagM.getAllTags().map(TagViewModel.init)
    tasks = taskM.getAllTasks().map(TaskViewModel.init)
  }

  func refreshData() {
    users = userM.getAllUsers().map(UserViewModel.init)
    tags = tagM.getAllTags().map(TagViewModel.init)
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
