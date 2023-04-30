//
//  UserViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 28/04/23.
//

import Foundation

class UserManager: ObservableObject {
  let cdm = CoreDataManager.shared

  @Published var userData: User
  @Published var userTaskList: [TaskViewModel] = []
  @Published var userRecommendations: [TaskViewModel] = []

  init(userData: User, userTaskList: [TaskViewModel]) {
    self.userData = userData
    // self.userTaskList = cdm.getUserTasks().map(TaskViewModel.init)
//    self.userTaskList = cdm.getReommendation().map(TaskViewModel.init)
  }
}
