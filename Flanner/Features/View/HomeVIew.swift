//
//  HomeView.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import SwiftUI

struct HomeView: View {
  @State var currIdx: Int = 0
  @ObservedObject var um: UserManager
//  @StateObject var tlvm = TaskListViewModel()
//  var recommendations: [TaskViewModel]
  // total 6 recommendation --> 3 untuk carousel, 3 untuk card

  init(um: UserManager) {
    self.um = um
//    tlvm.getRecommendations()
//    recommendations = tlvm.recommendations
    um.getUserData()
//    print(recommendations)
  }

  var body: some View {
    NavigationView {
      VStack {
        HStack(spacing: 0) {
          Text("Welcome \(um.currUser?.username ?? "") 👋").font(.title2).fontWeight(.bold)
          Spacer()
        }.padding(.horizontal, 32).padding(.top, 16)

        SnapCarousel(index: $currIdx, items: dummyTasks) {
          task in
          GeometryReader {
            _ in
            CarouselCard(task: task)
          }
        }.padding(.vertical).padding(.top, -8)

        HStack {
          Text("Recommended Activities For You 👇").multilineTextAlignment(.leading)
            .fontWeight(.semibold)
          Spacer()
        }.padding(.horizontal, 32)

        ScrollView(showsIndicators: false) {
          VStack(spacing: 0) {
            HomeCardView()
            HomeCardView()
            HomeCardView()
          }.padding(.horizontal)
        }.frame(maxWidth: .infinity, maxHeight: 480)
      }
    }.frame(maxHeight: .infinity, alignment: .top).navigationBarBackButtonHidden(true)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(um: UserManager())
  }
}
