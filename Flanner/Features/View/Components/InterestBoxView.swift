//
//  InterestBoxView.swift
//  Flanner
//
//  Created by Kevin Bryan on 27/04/23.
//

import SwiftUI

struct InterestBoxView: View {
  @EnvironmentObject var interestManager: InterestManager
  @Binding var interest: Interest

  var body: some View {
    if interestManager.selectedInterested < 5 || interest.selected {
      VStack {
        Image(systemName: "\(interest.symbol)").font(.system(size: 48)).frame(width: 48, height: 48).padding(.bottom, 6)
        Text("\(interest.name)")
      }.frame(width: 130, height: 130).background(
        !interest.selected ? Colors.lBlue : Colors.turq).cornerRadius(16)
        .foregroundColor(!interest.selected ? Colors.turq : Colors.cream)
        .shadow(color: Color.black.opacity(!interest.selected ? 0 : 0.2), radius: 4, x: 4, y: 6)
        .onTapGesture {
          interest.toggleSelected()
          if interest.selected {
            interestManager.selectedInterested += 1
          } else {
            interestManager.selectedInterested -= 1
          }
          print("Selected Interst:")
          print(interestManager.self.selectedInterested)
        }.animation(.easeIn(duration: 0.2), value: interest.selected)
    } else {
      VStack {
        Image(systemName: "\(interest.symbol)").font(.system(size: 48)).frame(width: 48, height: 48).padding(.bottom, 6).opacity(0.7)
        Text("\(interest.name)").opacity(0.7)
      }.frame(width: 130, height: 130).background(
        Colors.lBlue).cornerRadius(16)
        .foregroundColor(Colors.turq)
        .shadow(color: Color.black.opacity(!interest.selected ? 0 : 0.2), radius: 4, x: 4, y: 6)
        .opacity(0.7)
      //        .onTapGesture {
      //          interest.toggleSelected()
      //          if interest.selected {
      //            interestManager.selectedInterested += 1
      //          } else {
      //            interestManager.selectedInterested -= 1
      //          }
      //          print("Selected Interst:")
      //          print(interestManager.self.selectedInterested)
      //        }.animation(.easeIn(duration: 0.2), value: interest.selected)
    }
  }
}

struct InterestBoxView_Previews: PreviewProvider {
  static var previews: some View {
    InterestView(interestManager: InterestManager())
  }
}
