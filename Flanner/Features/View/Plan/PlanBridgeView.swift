//
//  PlanBridgeView.swift
//  Flanner
//
//  Created by Nidya Anifa on 02/05/23.
//

import SwiftUI

struct PlandBridgeView: View {
  var body: some View {
    ZStack {
      Colors.turq
        .edgesIgnoringSafeArea(.all)
      VStack {
        Spacer()

        Prompt.planBridgeImage
          .resizable()
          .frame(width: 279, height: 279)
        Text("Let’s Plan Your Activity!")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(Colors.cream)
          .font(.system(size: 28)).padding(.top, 20).padding(.bottom, 1)
        Text("Fill in the questions below to generate the best activity to your current mood and preferences")
          .fontWeight(.regular)
          .font(.system(size: 12))
          .foregroundColor(Colors.creamTint)
          .multilineTextAlignment(.center)
          .frame(width: 300)

        NavigationLink(destination: ThisOrThatView(um: UserManager())
        ) { CustomButton(label: "Start", width: 280)
        }
        .padding(.top, 20)
        Spacer()
      }
    }
  }
}

struct PlandBridgeView_Previews: PreviewProvider {
  static var previews: some View {
    PlandBridgeView()
  }
}