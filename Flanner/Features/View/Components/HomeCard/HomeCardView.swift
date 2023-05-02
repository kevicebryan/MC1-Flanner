//
//  HomeCardView.swift
//  Flanner
//
//  Created by Kevin Bryan on 25/04/23.
//

import SwiftUI

struct HomeCardView: View {
  var img: Image
  var title: String
  var detail: String
  var tags: [DummyTag]

  init() {
    img = Image("dummyImage")
    title = "012345678912"
    detail = "This is the card descripÍtion, fill out information regarding the corresponding task here This is the card descripÍtion, fill out information regarding the corresponding task here."
    tags = dummyTags
  }

  var body: some View {
    HStack(spacing: 16) {
      // Image
      img.resizable().frame(width: 100, height: 100)
        .cornerRadius(16).scaledToFill()
        .padding(.vertical, 8)
        .padding(.leading, 16)
      // Info
      VStack(alignment: .leading) {
        Text(title).font(
          title.count >= 12 ? .title2 : .title
        ).fontWeight(.bold)
        Text(detail).opacity(0.6).fontWeight(.light).font(.caption2).lineLimit(3, reservesSpace: true)
        HStack {
          ForEach(tags) { tag in
            Text(tag.name).font(.caption2).fontWeight(.light).frame(width: 60).padding(1).overlay {
              RoundedRectangle(cornerRadius: 2).stroke(Color(hex: tag.color))
            }.opacity(0.8)
          }
        }
      }.padding(.all, 8).padding(.leading, -16).frame(width: 195).padding(.trailing, 16).padding(.leading, 4)
    }.background(.white).cornerRadius(20).frame(width: 351, height: 132)
      .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 20)
//      .overlay {
//        RoundedRectangle(cornerRadius: 8).stroke(Color.black).opacity(0.2)
//      }
  }
}

struct HomeCardView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(um: UserManager())
  }
}
