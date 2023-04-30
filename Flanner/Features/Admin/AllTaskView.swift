//
//  AllTaskView.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import SwiftUI

struct AllTaskView: View {
  @ObservedObject var am: AdminManager

  var body: some View {
    VStack {
      Text("All Tasks").font(.title)
      ForEach(am.tasks, id: \.self.id) { task in
        VStack { Text(task.name ?? "---")
        }
      }
    }
  }
}

struct AllTaskView_Previews: PreviewProvider {
  static var previews: some View {
    AdminView()
  }
}
