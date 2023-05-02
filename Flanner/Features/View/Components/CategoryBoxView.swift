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
        Text("\(category.name)")
          .frame(width: 100, alignment: .trailing)
          .padding()
        Spacer()
      }.frame(width: 130, height: 130)
        .overlay(
          symbolInPreferencesView(symbol: category.symbol)
        )
        .background(
          !category.selected ? Colors.lBlue : Colors.turq).cornerRadius(16)
        .foregroundColor(!category.selected ? Colors.turq : Colors.lBlue)
        .shadow(color: Color.black.opacity(!category.selected ? 0 : 0.2), radius: 4, x: 4, y: 6)
        .onTapGesture {
          category.selected.toggle()
          if category.selected {
            categoryManager.selectedCategory += 1
          } else {
            categoryManager.selectedCategory -= 1
          }
          print("Selected Interst:")
          print(categoryManager.self.selectedCategory)
        }
        .animation(.easeIn(duration: 0.2), value: category.selected)
    } else {
      VStack {
        Text("\(category.name)")
          .frame(width: 100, alignment: .trailing)
          .padding()
        Spacer()
      }.frame(width: 130, height: 130)
        .overlay(
          symbolInPreferencesView(symbol: category.symbol)
        )
        .background(
          Colors.lDisabled).cornerRadius(16)
        .foregroundColor(Colors.dDdisabled)
        .shadow(color: Color.black.opacity(!category.selected ? 0 : 0.2), radius: 4, x: 4, y: 6)
    }
  }
}

struct CategoryBoxView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryBoxView(category: .constant(CategoryManager().categories[6])).environmentObject(CategoryManager())
//    PreferencesView(categoryManager: CategoryManager())
  }
}
