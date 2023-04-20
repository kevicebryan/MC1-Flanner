//
//  Carousel.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import SwiftUI

struct Carousel: View {
  init() {}

  func getScale(proxy: GeometryProxy) -> CGFloat {
    let midPoint: CGFloat = 125
    let viewFrame = proxy.frame(in: CoordinateSpace.global)
    var scale: CGFloat = 1.0
    let deltaXAnimationThreshold: CGFloat = 125

    let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
    if diffFromCenter < deltaXAnimationThreshold {
      scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
    }
    return scale
  }

  var body: some View {
    ScrollViewReader {
      value in
      ScrollView(.horizontal) {
        HStack(spacing: 40) {
          ForEach(dummyTasks, id: \.self.id) {
            dummyTask in GeometryReader {
              proxy in
              let scale = getScale(proxy: proxy)
              CarouselCard(task: dummyTask)
                .scaleEffect(CGSize(width: scale, height: scale))
                .shadow(radius: 5)
                .padding(.top, 24)
            }.frame(width: 300, height: 280)
          }
        }.padding(.horizontal, 40)
      }
      HStack {
        ForEach(dummyTasks, id: \.self.id) { task in
          Button("o") {
            withAnimation {
              value.scrollTo(task.id, anchor: .trailing)
            }
          }
        }
      }
    }
  }
}

struct Carousel_Previews: PreviewProvider {
  static var previews: some View {
    Carousel()
  }
}
