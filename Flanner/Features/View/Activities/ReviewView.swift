//
//  ReviewView.swift
//  Flanner
//
//  Created by Nidya Anifa on 03/05/23.
//

import SwiftUI

struct ReviewView: View {
    let record: DummyRecord
    
    var body: some View {
        NavigationView {
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
//                            record.rating = 0
                                    }) {
                                    Text("🥲")
                                            .font(.system(size: 55))
                                        .frame(width: 79, height: 79)
                                        .foregroundColor(Color.black)
                                        .background(Colors.white)
                                        .clipShape(Circle())
                                }
                        Text("Dissapointed")
                    }
                    
                    VStack {
                        Button(action: {
                            print("S")
//                            record.rating = 1
                                    }) {
                                    Text("😐")
                                            .font(.system(size: 55))
                                        .frame(width: 79, height: 79)
                                        .foregroundColor(Color.black)
                                        .background(Colors.white)
                                        .clipShape(Circle())
                                }
                        Text("Neutral")
                    }
                    VStack {
                        Button(action: {
                            print("S")
//                            record.rating = 2
                                    }) {
                                    Text("🥰")
                                            .font(.system(size: 55))
                                        .frame(width: 79, height: 79)
                                        .foregroundColor(Color.black)
                                        .background(Colors.white)
                                        .clipShape(Circle())
                                }
                        Text("Enjoy")
                    }
                }
                Spacer()
                
                NavigationLink(destination: ActivitiesView()
                ) { CustomButton(label: "Submit", width: 280)
                }
                .padding(.top, 20)
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(record: dummyRecords[0])
    }
}
