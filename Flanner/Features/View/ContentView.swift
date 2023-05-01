//
//  ContentView.swift
//  Flanner
//
//  Created by Kevin Bryan on 28/04/23.
//

import SwiftUI

struct ContentView: View {
  @State var selectedIndex = 0
  @State var isPlanning = false

  // MARK: Tab Bar Data

  let tabBarDataList = [
    tabBarData(lable: "Home", img: "house"),
    tabBarData(lable: "Plan", img: "circle.circle"),
    tabBarData(lable: "Activity", img: "list.bullet.clipboard")
  ]

  var body: some View {
    VStack(spacing: -5) {
      ZStack {
        // MARK: FULL SCREEN VIEW

        Spacer()
          .fullScreenCover(isPresented: $isPlanning) {
            VStack(alignment: .leading) {
              HStack {
                Button {
                  isPlanning.toggle()
                } label: {
                  Image(systemName: "xmark").font(.system(size: 24, weight: .semibold)).foregroundColor(.black)
                }
              }.padding(.horizontal).padding(.vertical, 4)
              PreferencesView(categoryManager: CategoryManager())
            }
          }

        // MARK: OTHER VIEWS

        switch selectedIndex {
        case 0: HomeView()
        case 2: OnboardingView(um: UserManager())
        default:
          Text("Page not Found!")
        }
      }.animation(.spring(), value: selectedIndex)

      Spacer()

      // MARK: Custom Tab Bar

      Divider()
      HStack(alignment: .center) {
        ForEach(0 ..< 3) {
          idx in
          Spacer()
          Button {
            if idx == 1 {
              isPlanning.toggle()
              return
            }
            selectedIndex = idx
          } label: {
            VStack(alignment: .center) {
              Image(systemName: tabBarDataList[idx].img).font(.system(size: 20, weight: .semibold)).frame(width: 24, height: 24)
                .padding(.top, 8)
              Text(tabBarDataList[idx].lable).font(.caption2).multilineTextAlignment(.center)
            }.frame(width: 50).foregroundColor(selectedIndex == idx ? Colors.turq : .gray.opacity(0.5))
              .padding(.bottom, -12)
              .animation(.easeOut, value: selectedIndex)
          }

          Spacer()
        }
      }.background(.thinMaterial)
        .ignoresSafeArea(.all)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct tabBarData: Identifiable {
  var id = UUID()
  var lable: String
  var img: String
}
