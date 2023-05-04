//
//  OnboardingView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 25/04/23.
//

import SwiftUI

struct OnboardingView: View {
  @State var username: String = ""
  @ObservedObject var um: UserManager

  // TODO: Make Continue btn  disabled, until user has filled Username

  var body: some View {
    NavigationView {
      ZStack {
        Colors.turq
          .edgesIgnoringSafeArea(.all)
        VStack {
          ZStack {
            Ellipse()
              .foregroundColor(Colors.cream)
            Prompt.onBoardingImage.resizable()
              .frame(width: Size.screenWidth/1.5, height: Size.screenWidth/1.5)
              .offset(y: Size.screenHeight/4)
          }.frame(width: Size.screenWidth * 1.6, height: Size.screenHeight)
          Text("Welcome to Flanner!")
            .font(.system(size: 26))
            .bold()
            .foregroundColor(Colors.creamTint)
            .padding().padding(.top, 20)

          Text("Let's create fun and quality events together with Flanner!")
            .frame(width: Size.screenWidth/1.2)
            .multilineTextAlignment(.center)
            .fixedSize()
            .foregroundColor(Colors.creamTint)
            .padding().padding(.top, -28).opacity(0.7)

          Text("Insert your full name").foregroundColor(Colors.creamTint).fontWeight(.semibold).padding(.bottom, -8)

          TextField(
            "",
            text: $username
          )
          .multilineTextAlignment(.center)
          .textFieldStyle(.roundedBorder)
          .cornerRadius(15)
          .frame(width: Size.screenWidth/1.3, height: 48).preferredColorScheme(.light)

          if username == "" || username == " " {
            CustomButton(label: "Continue", isDisabled: true)
          } else {
            NavigationLink(destination: PreferencesView(
              categoryManager:
              CategoryManager(), um: um
            ).navigationBarBackButtonHidden(true)) {
              CustomButton(label: "Continue")
            }.simultaneousGesture(TapGesture().onEnded {
              um.setUsername(name: username)
              print("UM.Username:  \(um.username)")
            })
          }
        }
        .offset(y: -(Size.screenHeight/3.5))
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(um: UserManager())
  }
}
