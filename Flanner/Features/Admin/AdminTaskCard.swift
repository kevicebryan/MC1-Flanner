//
//  AdminTaskCard.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import SwiftUI

struct AdminTaskCard: View {
//  @Binding var task: TaskViewModel

  let task: TaskViewModel

  init(task: TaskViewModel) {
    self.task = task
  }

  var body: some View {
    VStack(alignment: .leading) {
      Text(task.name).fontWeight(.bold)
      Text(task.detail).font(.caption2)
      HStack {
        ForEach(task.tags, id: \.self.id) { tag in
          Text(tag.name ?? "tagName").fontWeight(.semibold).foregroundColor(Color(hex: tag.color ?? "d9d9d9")).font(.caption)
        }
      }
    }.padding(.vertical, 4)
  }
}

struct AdminTaskCard_Previews: PreviewProvider {
  static var previews: some View {
//    AdminTaskCard(task: .constant(DTask()))
    AdminView()
  }
}

struct DTask: Identifiable {
  let id = UUID()
  let name = "Jalan ke Puncak Gunung"
  let image = "defaultTaskImage"
  let detail = "the quick brown fox jumps ove the lazy dog"
  let location = ""
  let tags = [DTag(), DTag(), DTag()]
}

struct DTag: Identifiable {
  let id = UUID()
  let name = "Indoor"
  let color = "d9d9d9"
  let weight = 2
}
