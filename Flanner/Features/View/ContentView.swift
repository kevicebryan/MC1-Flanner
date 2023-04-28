//
//  ContentView.swift
//  Flanner
//
//  Created by Kevin Bryan on 28/04/23.
//

import SwiftUI



struct ContentView: View {
  @State var isShown = false
  var body: some View {
    HStack {
      Spacer()
      VStack{
        Image(systemName: "house")
        Text("Home")
      }
      Spacer()
      
      Button{
        isShown.toggle()
      } label: {
        VStack{
          Image(systemName: "list.clipboard.fill")
          Text("Plan")
        }
      }.sheet(isPresented: $isShown, content: {
        InterestView(interestManager: InterestManager())
      })
      Spacer()
      VStack{
        Image(systemName: "person.crop.circle.fill")
        Text("Activity")
      }
      Spacer()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
