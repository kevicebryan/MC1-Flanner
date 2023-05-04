//
//  ActivitiesView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct ActivitiesView: View {
    @State private var index = 0
    
    var body: some View {
            VStack {
                Text("Our Activities")
                        .fontWeight(.bold)
                        .foregroundColor(Colors.turq)
                        .font(.system(size: 22))
                        .padding(.top, 15)
                
                Picker("Select", selection: $index) {
                    Text("Whislist").tag(0)
                    Text("Done").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                
                
                if index == 0 {
                    WishlistView(record: dummyRecords[0])
                    
                } else {
                    DoneActivitiesView(record: dummyRecords[0])
                }
                Spacer()
            }
        }
    }

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
