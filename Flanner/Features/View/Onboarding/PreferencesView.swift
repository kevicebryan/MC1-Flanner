//
//  categoryView.swift
//  Flanner
//
//  Created by Kevin Bryan on 27/04/23.
//

import SwiftUI

struct PreferencesView: View {
  @StateObject var categoryManager = CategoryManager()
  @State var categories: [Category]
  @State var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
  @State var full: Bool = false

  init(categoryManager: CategoryManager) {
    self.categories = categoryManager.categories
  }

  var body: some View {
    VStack {
      VStack {
        Text("Before we start 😁").font(.title).fontWeight(.bold)
        Text("Please choose your preferences that relate with you and your family.").font(.footnote).multilineTextAlignment(.center).foregroundColor(Colors.turq)
        HStack {
          Spacer()
          Text("\(categoryManager.selectedCategory) / 5").font(.caption)
            .foregroundColor(full ? Colors.turq : .gray)
            .fontWeight(full ? .semibold : .regular)
            .scaleEffect(full ? 1.1 : 1)
            .animation(.easeInOut(duration: 0.2), value: full)
        }
      }.padding(.horizontal, 40)
      LazyVGrid(columns: gridItemLayout, spacing: 16) {
        ForEach(categories.indices, id: \.self) {
          idx in
          CategoryBoxView(category: $categories[idx]).onChange(of: categoryManager.selectedCategory) { _ in
            full = categoryManager.selectedCategory == 5
          }
        }
      }.padding(.horizontal, 40)

      NavigationLink(destination: ThisOrThatView()) {
        CustomButton(label: "Next", width: 300)
      }

    }.environmentObject(categoryManager)
  }
}

struct PreferencesView_Previews: PreviewProvider {
  static var previews: some View {
    PreferencesView(categoryManager: CategoryManager())
  }
}
