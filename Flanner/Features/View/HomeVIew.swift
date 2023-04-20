//
//  HomeView.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import SwiftUI

struct HomeView: View {
  @State var currIdx: Int = 0

  var body: some View {
    VStack {
      HStack(spacing: 0) {}

      SnapCarousel(index: $currIdx, items: dummyTasks) {
        task in
        GeometryReader {
          _ in
          CarouselCard(task: task)
        }
      }.padding(.vertical, 40)
    }.frame(maxHeight: .infinity, alignment: .top)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
