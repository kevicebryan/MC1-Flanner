//
//  AdminView.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import SwiftUI

struct AdminView: View {
  @StateObject var am = AdminManager()

  var body: some View {
    NavigationView {
      VStack {
        Text("Admin View").fontWeight(.heavy).font(.largeTitle)
        HStack {
          Button {
            print("Seeding Datas")
            am.seedInitialData()
            print("Successfully Seeded All Tags & Tasks")
          } label: {
            VStack {
              Text("Seed Datas")
            }.foregroundColor(.green)
          }.buttonStyle(.bordered)
          Spacer()
          Button {
            print("Deleting All Datas")
            am.deleteAll()
            print("Deleted All Datas")
          } label: {
            VStack {
              Text("Delete All Records")
            }.foregroundColor(.red)
          }.buttonStyle(.bordered)
        }.padding(32)

        HStack(spacing: 32) {
          NavigationLink(destination: AllTagsView(am: am)) {
            Text("View Tags").foregroundColor(.blue)
          }
          NavigationLink(destination: AllTaskView(am: am)) {
            Text("View Tasks")
          }

          NavigationLink(destination: AllUserView(am: am)) {
            Text("View Users")
          }

        }.padding(.horizontal, 16)

        if !am.users.isEmpty {
          NavigationLink(destination: RecommendationsView()) {
            Text("Go to Recommendations").foregroundColor(.purple).padding(.top, 32)
          }
        }
        Spacer()
      }.padding(.top, 100)
    }
  }
}

struct AdminView_Previews: PreviewProvider {
  static var previews: some View {
    AdminView()
  }
}
