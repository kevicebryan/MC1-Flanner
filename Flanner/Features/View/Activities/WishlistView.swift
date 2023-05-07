//
//  WishlistView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct WishlistView: View {
  @ObservedObject var tlvm: TaskListViewModel
  @State public var record: TaskViewModel
  @State public var isChecked = false

  var body: some View {
    HStack(spacing: 16) {
      Image(record.image)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipped()
            .cornerRadius(16)
            .padding(.vertical, 8)
            .padding(.leading, 16)
        
      VStack(alignment: .leading) {
        Text(record.name).font(
          record.name.count >= 12 ? .title2 : .title
        ).fontWeight(.bold)
        .lineLimit(1, reservesSpace: true)
          
          Text(record.detail)
              .opacity(0.6)
              .fontWeight(.light)
              .font(.caption2)
              .lineLimit(2, reservesSpace: true)
              .multilineTextAlignment(.leading)
              .foregroundColor(.gray)
          
      }.padding(.all, 8)
        .padding(.leading, -16)
        .frame(width: 180)
        

      Image(systemName: isChecked ? "checkmark.square" : "square")
        .resizable()
        .frame(width: 20, height: 20)
        .foregroundColor(isChecked ? Colors.turq : Color.secondary)
        .onTapGesture {
          self.isChecked.toggle()
          record.task.done = true
          record.task.planned = false
          tlvm.saveToCoreData()
          tlvm.getAllTask()
        }
      Spacer()
    }.background(.white)
      .cornerRadius(20)
      .frame(width: 360, height: 116)
      .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 20)
  }
}

struct WishlistView_Previews: PreviewProvider {
  static var previews: some View {
      WishlistView(tlvm: TaskListViewModel(), record: TaskListViewModel().tasks[0]
      )
  }
}
