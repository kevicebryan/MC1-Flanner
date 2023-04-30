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
  var currUser: UserViewModel? = nil

  init() {
    getUserData()
  }

  func getUserData() {
    users = userModel.getAllUsers().map(UserViewModel.init)
    if !users.isEmpty {
      currUser = users[0]
    }
  }

  func isUserExist() -> Bool {
    if users.isEmpty {
      return false
    }
    return true
  }

  func addNewUser(username: String) {
    cdm.seedAllData()
    userModel.addUser(name: username)
    print("new user successfully added: \(username)")
  }
}

struct UserViewModel {
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
