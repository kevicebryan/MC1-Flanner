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
    title = "123456789"
    detail = "This is the card descripÍtion, fill out information regarding the corresponding task here This is the card descripÍtion, fill out information regarding the corresponding task here."
    tags = dummyTags
  }

  var body: some View {
    HStack(spacing: 16) {
      // Image
      img.resizable().frame(width: 112, height: 112)
        .cornerRadius(16).scaledToFill()
        .padding(.vertical, 8)
        .padding(.leading, 20)
      // Info
      VStack(alignment: .leading) {
        Text(title).font(
          title.count >= 10 ? .title : .largeTitle
        ).fontWeight(.bold)
        Text(detail).opacity(0.8).fontWeight(.light).font(.footnote).lineLimit(3, reservesSpace: true)
        HStack {
          ForEach(tags) { tag in
            Text(tag.name).font(.caption2).fontWeight(.light).frame(width: 60).padding(1).overlay {
              RoundedRectangle(cornerRadius: 2).stroke(Color(hex: tag.color))
            }.opacity(0.8)
          }
        }
      }.padding(.all, 8).padding(.leading, -16).frame(width: 200).padding(.trailing, 20)
    }.background(.white).cornerRadius(20).frame(width: 361, height: 132)
      .shadow(color: Color.black.opacity(0.1), radius: 4, x: 4, y: 6)
//      .overlay {
//        RoundedRectangle(cornerRadius: 8).stroke(Color.black).opacity(0.2)
//      }
  }
}

struct HomeCardView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
