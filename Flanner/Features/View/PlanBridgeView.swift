//
//  PlanBridgeView.swift
//  Flanner
//
//  Created by Nidya Anifa on 02/05/23.
//

import SwiftUI

struct PlandBridgeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Colors.turq
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    
                    Image("dummyImage")
                        .resizable()
                        .frame(width: 279, height: 279)
                    Text("Let’s Plan Your Activity!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Colors.cream)
                        .font(.system(size: 28))
                    Text("Fill in the questions below to generate the best activity to your current mood and preferences")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(Colors.cream)
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                    NavigationLink(destination: ThisOrThatView()
                    ) {CustomButton(label: "START")
                        }
                    }
                }
            }
        }
    }

struct PlandBridgeView_Previews: PreviewProvider {
    static var previews: some View {
        PlandBridgeView()
    }
}