//
//  CarouselCard.swift
//  Flanner
//
//  Created by Kevin Bryan on 20/04/23.
//

import SwiftUI

struct CarouselCard: View {
  let task: TaskViewModel

  var body: some View {
    ZStack {
      Colors.turqShade

      Image(task.image).resizable().scaledToFill().frame(height: 245)
      VStack(spacing: 0) {
        Spacer()
        LinearGradient(colors: [.black.opacity(0.85), .black.opacity(0.75), .black.opacity(0.2), .white.opacity(0)], startPoint: .bottom, endPoint: .top).frame(height: 80).padding(.bottom, 12)
      }

      VStack(alignment: .leading) {
        Spacer()
        NavigationLink(destination: ActivityDetailView(task: task).navigationBarBackButtonHidden(true)) {
          Text(" \(task.name)")
            .foregroundColor(Colors.creamTint).fontWeight(.bold).font(.largeTitle).lineLimit(1)
        }
        if task.location != "" && !task.location.isEmpty {
          Text(task.location).foregroundColor(Colors.creamTint).fontWeight(.regular).font(.caption)
        }
      }.padding(.bottom, 10).padding(.leading)
        .frame(maxWidth: 330, maxHeight: 220, alignment: .leading)
//          .padding(.leading, -48)

    }.frame(width: 300, height: 220).cornerRadius(12)
  }
}

struct CarouselCard_Previews: PreviewProvider {
  static var previews: some View {
//    CarouselCard(task: dummyTasks[0])
    CarouselCard(task: AdminManager().tasks[0])
  }
}
