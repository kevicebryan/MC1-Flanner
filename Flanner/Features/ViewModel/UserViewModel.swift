//
//  UserViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 28/04/23.
//

import CoreData
import Foundation

class UserManager: ObservableObject {
  let userModel = UserModel()
  let cdm = CoreDataManager.shared

  @Published var users: [UserViewModel] = []
  var username = "Anonymous"
  var currUser: UserViewModel? = nil

  init() {
    getUserData()
  }

  func addNewUser(name: String = "") {
    cdm.seedAllData()
    if username == "" {
      userModel.addUser(name: name)
    } else {
      userModel.addUser(name: username)
    }
    TaskListViewModel().getRecommendations()
  }

  func setUsername(name: String) {
    username = name
  }

  func getUserData() {
    users = userModel.getAllUsers().map(UserViewModel.init)
    if !users.isEmpty {
      currUser = users[0]
//      TaskListViewModel().getRecommendations()
    }
  }

  func isUserExist() -> Bool {
    if users.isEmpty {
      return false
    }
    return true
  }
}

struct UserViewModel: Identifiable {
  var user: User

  init(user: User) {
    self.user = user
  }

  var id: NSManagedObjectID {
    return user.objectID
  }

  var username: String {
    return user.username ?? ""
  }
}
