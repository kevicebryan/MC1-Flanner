//
//  ReviewView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct ReviewView: View {
    @State public var record: DummyRecord
    @State private var button1Opacity = 1.0
    @State private var button2Opacity = 1.0
    @State private var button3Opacity = 1.0
    @State private var isReviewed = true
    
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
                    VStack {
                        Button(action: {
                            print("S")
                            record.rating = 0
                            button2Opacity = 0.4
                            button3Opacity = 0.4
                            isReviewed = false
                                    }) {
                                    Text("🥲")
                                            .font(.system(size: 55))
                                        .frame(width: 79, height: 79)
                                        .foregroundColor(Color.black)
                                        .background(Colors.white)
                                        .clipShape(Circle())    
                                }
                        Text("Dissapointed")
                    }.opacity(button1Opacity)
                    
                    VStack {
                        Button(action: {
                            print("S")
                            record.rating = 1
                            button1Opacity = 0.4
                            button3Opacity = 0.4
                            isReviewed = false
                                    }) {
                                    Text("😐")
                                            .font(.system(size: 55))
                                        .frame(width: 79, height: 79)
                                        .foregroundColor(Color.black)
                                        .background(Colors.white)
                                        .clipShape(Circle())
                                        
                                }
                        Text("Neutral")
                    }.opacity(button2Opacity)
                    
                    VStack {
                        Button(action: {
                            print("S")
                            record.rating = 2
                            button2Opacity = 0.4
                            button1Opacity = 0.4
                            isReviewed = false
                                    }) {
                                    Text("🥰")
                                            .font(.system(size: 55))
                                        .frame(width: 79, height: 79)
                                        .foregroundColor(Color.black)
                                        .background(Colors.white)
                                        .clipShape(Circle())
                                        
                                }
                        Text("Enjoy")
                    }.opacity(button3Opacity)
                }
                Spacer()
                
                NavigationLink(destination: ActivitiesView()
                ) { CustomButton(label: "Submit", width: 280, isDisabled: isReviewed)
                }
                .padding(.top, 20)
            }
        }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(record: dummyRecords[0])
    }
}
