//
//  DoneActivitiesView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct DoneActivitiesView: View {
    let record: DummyRecord
    
    var body: some View {
        NavigationView {
            HStack(spacing: 16) {
            Image(record.image).resizable().frame(width: 90, height: 90)
                .cornerRadius(16).scaledToFill()
                .padding(.vertical, 8)
                .padding(.leading, 16)
              VStack(alignment: .leading) {
                  Text(record.name).font(
                    record.name.count >= 12 ? .title2 : .title
                )
                  .fontWeight(.bold)
                Text(record.name).opacity(0.6).fontWeight(.light)
                      .font(.caption2)
                      .lineLimit(3, reservesSpace: true)
                  NavigationLink(destination: ReviewView()
                  ) { HStack {
                      Text("Review")
                          .foregroundColor(Colors.turq)
                      Image(systemName: "arrow.right.circle")
                          .foregroundColor(Colors.turq)
                    }
                  }
                  Spacer()
              }
              .padding(.all, 8)
                    .padding(.leading, -16)
                    .frame(width: 195)
                
                Spacer()
            }.background(.white).cornerRadius(20).frame(width: 351, height: 132)
              .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 20)
        }
    }
}

struct DoneActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        DoneActivitiesView(record: dummyRecords[0])
    }
}
