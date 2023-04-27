//
//  InterestView.swift
//  Flanner
//
//  Created by Kevin Bryan on 27/04/23.
//

import SwiftUI

struct InterestView: View {
  @StateObject var interestManager = InterestManager()
  @State var interests: [Interest]
  @State var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
  @State var full: Bool = false

  init(interestManager: InterestManager) {
    self.interests = interestManager.interests
  }

  var body: some View {
    VStack {
      VStack {
        Text("Before we start").font(.title).fontWeight(.bold)
        Text("Please choose your preferences that relate with you and your family.").font(.footnote).multilineTextAlignment(.center).foregroundColor(Colors.turq)
        HStack {
          Spacer()
          Text("\(interestManager.selectedInterested) / 5").font(.caption)
            .foregroundColor(full ? Colors.turq : .gray)
            .fontWeight(full ? .semibold : .regular)
            .scaleEffect(full ? 1.1 : 1)
            .animation(.easeInOut(duration: 0.2), value: full)
        }
      }.padding(.horizontal, 40)
      LazyVGrid(columns: gridItemLayout, spacing: 16) {
        ForEach(interests.indices, id: \.self) {
          idx in
          InterestBoxView(interest: $interests[idx]).onChange(of: interestManager.selectedInterested) { _ in
            full = interestManager.selectedInterested == 5
          }
        }
      }.padding(.horizontal, 40)
    }.environmentObject(interestManager)
  }
}

struct InterestView_Previews: PreviewProvider {
  static var previews: some View {
    InterestView(interestManager: InterestManager())
  }
}
