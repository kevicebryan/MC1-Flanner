//
//  SnapCarousel.swift
//  Flanner
//
//  Created by Kevin Bryan on 20/04/23.
//

import SwiftUI

struct SnapCarousel<Content: View, T: Identifiable>: View {
  var content: (T) -> Content
  var list: [T]

  // Properties
  var spacing: CGFloat
  @Binding var index: Int

  init(spacing: CGFloat = 8,
       index: Binding<Int>, items: [T],
       @ViewBuilder content: @escaping (T) -> Content)
  {
    self.list = items
    self.spacing = spacing
    self._index = index
    self.content = content
  }

  func getIndex(item: T) -> Int {
    let index = list.firstIndex { currItem in
      currItem.id == item.id
    } ?? 0
    return index
  }

  func getScale(item: T, width: CGFloat) -> CGFloat {
    if getIndex(item: item) == currIdx { return 1.05 }
    return 0.95
  }

  // Offset
  @GestureState var offset: CGFloat = 0
  @State var currIdx: Int = 0

  var body: some View {
    VStack {
      GeometryReader {
        _ in
//        let width = proxy.size.width
        let width = 300.0 + spacing

        HStack(spacing: spacing) {
          ForEach(list) {
            item in
            let scale = getScale(item: item, width: width)
            content(item)
              .frame(width: width)
              .animation(.spring(), value: index == currIdx)
              .scaleEffect(
                CGSize(
                  width: scale,
                  height: scale
                )
              )
              .animation(.spring(), value: index == currIdx)
          }
        }.padding(.horizontal, spacing)
          .offset(
            x: CGFloat(
              CGFloat(currIdx) * -width)
              + offset
              + (currIdx == 0 ? spacing * 3 : spacing * 2.5)
          )
          .gesture(
            DragGesture().updating($offset, body: {
              value, out, _ in
              out = value.translation.width
            })
            .onEnded {
              value in
              let offsetX = value.translation.width
              let progress = -offsetX / width
              let roundIndex = progress.rounded()
              currIdx = max(min(currIdx + Int(roundIndex), list.count - 1), 0)
              currIdx = index
            }.onChanged {
              value in
              let offsetX = value.translation.width
              let progress = -offsetX / width
              let roundIndex = progress.rounded()
              index = max(min(currIdx + Int(roundIndex), list.count - 1), 0)
            }
          )
      }.animation(.easeInOut, value: offset == 0).padding(.bottom, 8)

      HStack(spacing: 4) {
        ForEach(dummyTasks.indices, id: \.self) {
          index in
          Rectangle().fill(Colors.turq.opacity(currIdx == index ? 0.8 : 0.1))
            .frame(width: currIdx == index ? 20 : 8, height: currIdx == index ? 5 : 4)
            .animation(.easeIn(duration: 0.2), value: currIdx == index)
            .cornerRadius(8)
        }
      }
    }.frame(maxHeight: 224)
  }
}

struct SnapCarousel_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
