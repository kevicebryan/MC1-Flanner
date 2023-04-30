//
//  AllTagsView.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import SwiftUI

struct AllTagsView: View {
  @ObservedObject var am: AdminManager

  var body: some View {
    VStack {
      Text("All Tags").font(.title)
      ForEach(am.tags, id: \.self.id) { tag in
        VStack {
          Text(tag.name ?? "---")
        }
      }
    }
  }
}

struct AllTagsView_Previews: PreviewProvider {
  static var previews: some View {
    AdminView()
  }
}
