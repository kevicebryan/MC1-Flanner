//
//  FlannerApp.swift
//  Flanner
//
//  Created by Kevin Bryan on 17/04/23.
//

import SwiftUI

@main
struct FlannerApp: App {
  var body: some Scene {
    WindowGroup {
      InterestView(interestManager: InterestManager())
    }
  }
}
