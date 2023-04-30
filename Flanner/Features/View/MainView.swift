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
      ContentView()
    } else {
      OnboardingView(um: um)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
