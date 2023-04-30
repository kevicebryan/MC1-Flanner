//
//  categoryBoxView.swift
//  Flanner
//
//  Created by Kevin Bryan on 27/04/23.
//

import SwiftUI

struct CategoryBoxView: View {
  @EnvironmentObject var categoryManager: CategoryManager
  @Binding var category: Category

  var body: some View {
    if categoryManager.selectedCategory < 5 || category.selected {
      VStack {
        Image(systemName: "\(category.symbol)").font(.system(size: 48)).frame(width: 48, height: 48).padding(.bottom, 6)
        Text("\(category.name)")
      }.frame(width: 130, height: 130).background(
        !category.selected ? Colors.lBlue : Colors.turq).cornerRadius(16)
        .foregroundColor(!category.selected ? Colors.turq : Colors.cream)
        .shadow(color: Color.black.opacity(!category.selected ? 0 : 0.2), radius: 4, x: 4, y: 6)
        .onTapGesture {
          category.toggleSelected()
          if category.selected {
            categoryManager.selectedCategory += 1
          } else {
            categoryManager.selectedCategory -= 1
          }
          print("Selected Interst:")
          print(categoryManager.self.selectedCategory)
        }.animation(.easeIn(duration: 0.2), value: category.selected)
    } else {
      VStack {
        Image(systemName: "\(category.symbol)").font(.system(size: 48)).frame(width: 48, height: 48).padding(.bottom, 6).opacity(0.7)
        Text("\(category.name)").opacity(0.7)
      }.frame(width: 130, height: 130).background(
        Colors.lBlue).cornerRadius(16)
        .foregroundColor(Colors.turq)
        .shadow(color: Color.black.opacity(!category.selected ? 0 : 0.2), radius: 4, x: 4, y: 6)
        .opacity(0.7)
    }
  }
}

struct CategoryBoxView_Previews: PreviewProvider {
  static var previews: some View {
    PreferencesView(categoryManager: CategoryManager())
  }
}
