//
//  WishlistView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct WishlistView: View {
    @State public var record: DummyRecord
    @State public var isChecked = false
    
    var body: some View {
        HStack(spacing: 16) {
            Image(record.image)
                .resizable()
                .frame(width: 90, height: 90)
            .cornerRadius(16)
            .scaledToFill()
            .padding(.vertical, 8)
            .padding(.leading, 16)
          VStack(alignment: .leading) {
              Text(record.name).font(
                record.name.count >= 12 ? .title2 : .title
            ).fontWeight(.bold)
            Text(record.name)
                  .opacity(0.6)
                  .fontWeight(.light)
                  .font(.caption2)
                  .lineLimit(3, reservesSpace: true)
          }.padding(.all, 8)
                .padding(.leading, -16)
                .frame(width: 180)
            
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isChecked ? Colors.turq : Color.secondary)
                        .onTapGesture {
                            self.isChecked.toggle()
                            record.done = true
                        }
            Spacer()
        }.background(.white)
            .cornerRadius(20)
            .frame(width: 315, height: 116)
          .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 20)
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView(record: dummyRecords[0])
    }
}
