//
//  CarouselCard.swift
//  Flanner
//
//  Created by Kevin Bryan on 20/04/23.
//

import SwiftUI

struct CarouselCard: View {
  let task: DummyTask

  var body: some View {
    ZStack {
      Color.red
      Image(task.image).resizable().scaledToFill()
      VStack(alignment: .leading) {
        Spacer()
        Text(task.name).foregroundColor(.white).fontWeight(.bold).font(.largeTitle).lineLimit(1)
        Text(task.location).foregroundColor(.white).fontWeight(.regular).font(.caption)
      }.padding(.bottom, 8).frame(maxWidth: 300).padding(.leading, -16).multilineTextAlignment(.leading)
    }.frame(width: 300, height: 200).cornerRadius(12)
  }
}

struct CarouselCard_Previews: PreviewProvider {
  static var previews: some View {
    CarouselCard(task: dummyTasks[0])
  }
}
