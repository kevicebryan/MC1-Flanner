//
//  ActivitiesView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct ActivitiesView: View {
    @State private var index = 0
    @StateObject var tlvm = TaskListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Our Activities")
                    .fontWeight(.bold)
                    .foregroundColor(Colors.turq)
                    .font(.system(size: 22))
                    .padding(.top, 15)
                
                Picker("Select", selection: $index) {
                    Text("Wishlist").tag(0)
                    Text("Done").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                
                
                if index == 0 {
                    ScrollView {
                        ForEach(tlvm.plannedTasks, id: \.self.id) { task in
                            WishlistView(record: task)
                        }
                    }.ignoresSafeArea()
                    
                } else {
                    ScrollView {
                        ForEach(tlvm.doneTasks, id: \.self.id) { task in
                            DoneActivitiesView(record: task, isReviewed: .constant(false))
                        }
                    }.ignoresSafeArea()
                }
                Spacer()
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
