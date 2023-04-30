//
//  AdminViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import Foundation

class AdminManager: ObservableObject {
  let cm: CoreDataManager
  var tags: [Tag]
  var tasks: [Task]

  init() {
    cm = CoreDataManager.shared
    tags = cm.getAllTags()
    tasks = cm.getAllTasks()
  }

  func refreshData() {
    tags = cm.getAllTags()
    tasks = cm.getAllTasks()
  }

  func seedInitialData() {
    cm.seedAllData()
    refreshData()
  }

  func deleteAll() {
    cm.deleteAllData()
    refreshData()
  }
}
