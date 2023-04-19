//
//  ContentView.swift
//  Flanner
//
//  Created by Kevin Bryan on 17/04/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var activityListVM = ActivityListViewModel()

  func deleteActivity(at offsets: IndexSet) {
    offsets.forEach {
      index in
      let a = activityListVM.activites[index]
      activityListVM.delete(a)
    }
    activityListVM.getAllActivity()
  }

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!").foregroundColor(turq)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
