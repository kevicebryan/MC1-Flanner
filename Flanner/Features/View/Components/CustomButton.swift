//
//  CustomButton.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import SwiftUI

struct CustomButton: View {
  let label: String
  let width: Int

  init(label: String, width: Int = 200) {
    self.label = label
    self.width = width
  }

  var body: some View {
    Text("\(label)")
      .foregroundColor(.white)
      .frame(width: CGFloat(width), height: 40, alignment: .center)
      .background(Colors.dYellow)
      .cornerRadius(20, antialiased: true)
      .padding()
  }
}

struct CustomButton_Previews: PreviewProvider {
  static var previews: some View {
    CustomButton(label: "This is the label")
  }
}
