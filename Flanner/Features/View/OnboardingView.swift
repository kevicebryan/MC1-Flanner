//
//  OnboardingView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 25/04/23.
//

import SwiftUI

struct OnboardingView: View {
    @State var username: String = ""
    var body: some View {
        NavigationView {
            
            ZStack {
                Colors.turq
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        Ellipse()
                            .foregroundColor(Colors.cream)
                        Image("onBoarding").resizable()
                            .frame(width: Size.screenWidth/1.5, height: Size.screenWidth/1.5)
                            .offset(y: Size.screenHeight/4)
                    }.frame(width: Size.screenWidth*1.6, height: Size.screenHeight)
                    Text("Welcome to Your Flanner!")
                        .font(.system(size: 26))
                        .bold()
                        .foregroundColor(Colors.lYellow)
                        .padding()
                    
                    Text("Let's create fun and quality events together with Flanner!")
                        .frame(width: Size.screenWidth/1.2)
                        .multilineTextAlignment(.center)
                        .fixedSize()
                        .foregroundColor(Colors.lYellow)
                        .padding()
                    
                    
                    
                    Text("Username").foregroundColor(Colors.lYellow)
                    TextField(
                        "",
                        text: $username
                    )
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(15)
                    .frame(width: Size.screenWidth/1.3)
                    
                    
                    
                    NavigationLink(destination: PreferencesView()){
                        Text("Continue")
                            .foregroundColor(.white)
                    }
                    .frame(width: 150, height: 40, alignment: .center)
                    .background(Colors.dYellow)
                    .cornerRadius(20, antialiased: true)
                    .padding()
                }
                .offset(y: -(Size.screenHeight/3.5))
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}