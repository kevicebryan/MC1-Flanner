//
//  DoneActivitiesView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct DoneActivitiesView: View {
  @ObservedObject var tlvm: TaskListViewModel
  @State public var record: TaskViewModel
  
  @State private var isReviweing = false
  @State private var showingAlert = false
  @Binding var isReviewed: Bool
    
  var body: some View {
    ZStack {
      // MARK: FULL SCREEN VIEW
            
      Spacer()
        .fullScreenCover(isPresented: $isReviweing) {
          VStack {
            HStack {
              Button { isReviweing.toggle()
              } label: {
                Image(systemName: "xmark").font(.system(size: 24, weight: .semibold)).foregroundColor(Colors.yellow)
              }
                            
              Spacer()
                            
              Text("Review")
                .fontWeight(.bold)
                .foregroundColor(Colors.turq)
                .font(.system(size: 22))
              Spacer()
            }.padding(.horizontal)
              .padding(.vertical, 20)
            ReviewView(record: TaskListViewModel().tasks[0])
                        
            Button(action: {
              showingAlert = true
              record.task.reviewed = true
              record.task.planned = false
              tlvm.saveToCoreData()
              tlvm.getAllTask()
            }) {
              CustomButton(label: "Submit", width: 280, isDisabled: isReviewed)
                .alert(isPresented: $showingAlert) {
                  Alert(title: Text("Thank you 🎉"), message: Text("Your feedback is very helpful to us."), dismissButton: .default(Text("Close")) { isReviweing = false })
                }
            }
                        
            .padding(.top, 20)
          }.background(Colors.white)
        }
    }
        
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
                
        Text(record.name)
          .opacity(0.6)
          .fontWeight(.light)
          .font(.caption2)
          .lineLimit(3, reservesSpace: true)
                
        if record.task.reviewed == false {
          Button { isReviweing = true } label: { HStack {
            Text("Review")
              .foregroundColor(Colors.turq)
            Image(systemName: "arrow.right.circle")
              .foregroundColor(Colors.turq)
          }
          }
        } else {
          Button { isReviweing = true } label: { HStack {
            Image(systemName: "checkmark.circle")
              .foregroundColor(Colors.turq)
            Text("Reviewed")
              .foregroundColor(Colors.turq)
          }
          }.disabled(true)
        }
      }
      .padding(.all, 8)
      .padding(.leading, -16)
      .frame(width: 195)
            
      Spacer()
    }.background(.white).cornerRadius(20).frame(width: 360, height: 116)
      .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 20)
  }
}

struct DoneActivitiesView_Previews: PreviewProvider {
  static var previews: some View {
    DoneActivitiesView(tlvm: TaskListViewModel(), record: TaskListViewModel().tasks[0], isReviewed: .constant(false))
  }
}
