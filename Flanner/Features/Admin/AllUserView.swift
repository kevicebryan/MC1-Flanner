//
//  AllUserView.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import SwiftUI

struct AllUserView: View {
  @ObservedObject var am: AdminManager

  var body: some View {
    VStack(alignment: .leading) {
      Text("All Users").font(.title).fontWeight(.heavy)
      ForEach(am.users, id: \.self.id) { user in
        HStack {
          Text(user.username)
        }
      }
      Spacer()
    }
  }
}

struct AllUserView_Previews: PreviewProvider {
  static var previews: some View {
    AdminView(am: AdminManager())
  }
}
