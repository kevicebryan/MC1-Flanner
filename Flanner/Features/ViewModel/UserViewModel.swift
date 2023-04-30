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

  var user: User?
//  var userVM: UserViewModel
//  var userTaskList: [TaskViewModel] = []
//  var userRecommendations: [TaskViewModel] = []

  init() {
    user = userModel.getUser()
    if user != nil {
//      userVM = UserViewModel(user: user!)
    }
  }

  func getUserData() {
    user = userModel.getUser()
    if user != nil {
//      userVM = UserViewModel(user: user!)
    }
  }

  func isUserExist() -> Bool {
    if user == nil {
      return false
    } else {
      return true
    }
  }

  func addNewUser(username: String) {
    cdm.seedAllData()
    userModel.addUser(name: username)
    print("new user successfully added: \(username)")
    user = userModel.getUser()
//    userVM = UserViewModel(user: user!)
  }
}

struct UserViewModel {
  var user: User?

  init(user: User) {
    self.user = user
  }

  var id: NSManagedObjectID {
    return user!.objectID
  }

  var username: String {
    return user?.username ?? ""
  }
}
