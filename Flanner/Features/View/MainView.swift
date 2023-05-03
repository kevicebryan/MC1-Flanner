//
//  MainView.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import SwiftUI

struct MainView: View {
  @StateObject var um: UserManager = .init()

  var body: some View {
    if um.isUserExist() {
      ContentView(um: um)
    } else {
      OnboardingView(um: um).onAppear {
        CoreDataManager.shared.deleteAllData()
        CoreDataManager.shared.seedAllData()
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
