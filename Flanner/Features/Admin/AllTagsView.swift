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
    VStack(alignment: .leading) {
      Text("All Tags").font(.title).fontWeight(.heavy)
      ForEach(am.tags, id: \.self.id) { tag in
        HStack {
          Text(tag.emoji)
          Text(tag.name)
          Text("\(tag.weight)").font(.caption2)
        }.foregroundColor(Color(hex: tag.color)).padding(.all, 2)
      }
      Spacer()
    }
  }
}

struct AllTagsView_Previews: PreviewProvider {
  static var previews: some View {
    AdminView()
  }
}
