//
//  UserViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 28/04/23.
//

import Foundation

class UserManager: ObservableObject {
  let userModel = UserModel()

  @Published var userData: User?
  @Published var userTaskList: [TaskViewModel] = []
  @Published var userRecommendations: [TaskViewModel] = []

  init() {
    getUserData()
  }

  func getUserData() {
    userData = userModel.getUser()
  }

  func isUserExist() -> Bool {
    if userData == nil {
      return false
    } else {
      return true
    }
  }

  func addNewUser(username: String) {
    userModel.addUser(name: username)
    print("new user successfully added: \(username)")
  }
}
