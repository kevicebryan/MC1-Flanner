//
//  ProgressBar.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 25/04/23.
//

import SwiftUI

struct ProgressBar: View {
  @Binding var index: Int
  var body: some View {
    HStack {
      ForEach(0..<index + 1, id: \.self) { _ in
        Rectangle()
          .frame(width: Size.screenWidth/10, height: 3)
          .cornerRadius(20)
          .foregroundColor(Colors.yellow)
      }
      ForEach(0..<4 - index, id: \.self) { _ in
        Rectangle()
          .frame(width: Size.screenWidth/10, height: 3)
          .cornerRadius(20)
          .foregroundColor(Color.gray.opacity(0.5))
      }
    }
  }
}

struct ProgressBar_Previews: PreviewProvider {
  static var previews: some View {
    ProgressBar(index: .constant(0))
  }
}
