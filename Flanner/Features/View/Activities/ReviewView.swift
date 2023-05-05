//
//  ReviewView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct ReviewView: View {
    @State public var record: TaskViewModel
    @State private var button1Opacity = 1.0
    @State private var button2Opacity = 1.0
    @State private var button3Opacity = 1.0
    @State private var isReviewed = true
    @State private var showingAlert = false
    @State private var navigateThePage = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image(record.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(spacing: 0) {
                    Spacer()
                    LinearGradient(colors: [.black.opacity(0.85), .black.opacity(0.75), .black.opacity(0.2), .white.opacity(0)], startPoint: .bottomLeading, endPoint: .topLeading).frame(height: 100)
                }
                
                VStack(alignment: .leading) {
                    Spacer()
                    Text(record.name)
                        .foregroundColor(Colors.creamTint)
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .padding(.bottom, 10)
                }
                .padding(.bottom, 10)
                .multilineTextAlignment(.center)
            }.frame(width: 345, height: 222)
                .cornerRadius(20)
            Spacer()
            
            Text("Let’s rate your activity!")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.bottom, 5)
            Text("How was your quality time experience?")
                .fontWeight(.regular)
                .font(.system(size: 15))
            
            HStack {
                Button(action: {
                    TaskListViewModel().rateTask(task: record, rating: 1)
                    button2Opacity = 0.4
                    button3Opacity = 0.4
                    isReviewed = false
                }) {
                    VStack {
                        Text("🥲")
                            .font(.system(size: 55))
                            .frame(width: 79, height: 79)
                            .foregroundColor(Color.black)
                            .background(Colors.white)
                            .clipShape(Circle())
                        Text("Dissapointed")
                            .fontWeight(.medium)
                            .foregroundColor(Colors.black)
                            .font(.system(size: 14))
                        
                    }
                }.disabled(!isReviewed)
                
                Button(action: {
                    TaskListViewModel().rateTask(task: record, rating: 2)
                    button1Opacity = 0.4
                    button3Opacity = 0.4
                    isReviewed = false
                }) {
                    VStack {
                        Text("😐")
                            .font(.system(size: 55))
                            .frame(width: 79, height: 79)
                            .foregroundColor(Color.black)
                            .background(Colors.white)
                            .clipShape(Circle())
                        Text("Neutral")
                            .fontWeight(.medium)
                            .foregroundColor(Colors.black)
                            .font(.system(size: 14))
                    }
                }.disabled(!isReviewed)
                
                Button(action: {
                    TaskListViewModel().rateTask(task: record, rating: 3)
                    button2Opacity = 0.4
                    button1Opacity = 0.4
                    isReviewed = false
                }) {
                    VStack {
                        Text("🥰\nEnjoy")
                            .font(.system(size: 55))
                            .frame(width: 79, height: 79)
                            .foregroundColor(Color.black)
                            .background(Colors.white)
                            .clipShape(Circle())
                        Text("Enjoy")
                            .fontWeight(.medium)
                            .foregroundColor(Colors.black)
                            .font(.system(size: 14))
                    }
                }.disabled(!isReviewed)
            }
            Spacer()
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(record: TaskListViewModel().tasks[0])
    }
}
