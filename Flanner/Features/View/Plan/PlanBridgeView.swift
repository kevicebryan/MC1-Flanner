//
//  PlanBridgeView.swift
//  Flanner
//
//  Created by Nidya Anifa on 02/05/23.
//

import SwiftUI

struct PlandBridgeView: View {
  @State var isAnswering: Bool = false
  @Binding var showPlanBridge: Bool

  var body: some View {
    NavigationView {
      ZStack {
        Spacer().fullScreenCover(isPresented: $isAnswering) {
          PlanView(showView: $showPlanBridge, isAnswering: $isAnswering)
        }

        Colors.turq
          .edgesIgnoringSafeArea(.all)
        VStack {
          Spacer()

          ZStack {
            Circle()
              .fill(Colors.turqTint).frame(width: 280, height: 280)
            Circle()
              .fill(Colors.lBlue).frame(width: 200, height: 200)
            Prompt.planBridgeImage
              .resizable()
              .frame(width: 279, height: 279)
          }.frame(width: 279, height: 279)

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

          Button {
            isAnswering = true

          } label: {
            CustomButton(label: "Start", width: 280).padding(.top, 20)
          }

          Spacer()
        }
      }
    }
  }
}

struct PlandBridgeView_Previews: PreviewProvider {
  static var previews: some View {
    PlandBridgeView(showPlanBridge: .constant(false))
  }
}
