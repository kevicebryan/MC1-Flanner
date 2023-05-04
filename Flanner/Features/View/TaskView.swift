//
//  TaskView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 03/05/23.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        NavigationView {
            VStack{
                ZStack {
                    Image("dummyImage")
                    VStack(spacing: 0){
                        Color.black.opacity(0.6)
                            .frame(height: 90, alignment: .top).padding(0)
                        LinearGradient(
                            colors: [.black.opacity(0.6), .black.opacity(0)], startPoint: .topLeading, endPoint: .bottomLeading
                        )
                        .frame(height: 50, alignment: .top)
                        Spacer()
                    }
                    
                }.ignoresSafeArea()
                    .frame(height: 300)
                
                Spacer()
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(40).overlay(
                        ScrollView {
                            VStack (alignment: .leading, spacing: 10){
                                Text("Berenang")
                                    .font(.system(size: 24, weight: .bold))
                                HStack{
                                    ForEach(0..<3){_ in
                                        Text("💦 Maen Aer")
                                            .font(.system(size: 12, weight: .light))
                                            .padding(6)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(.blue, lineWidth: 1.5)
                                            )
                                        
                                        
                                    }
                                }
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat rhoncus semper. Vivamus finibus ullamcorper lorem ut euismod. Mauris varius quis diam ut tincidunt. Phasellus sit amet orci sem. Maecenas fermentum at elit in gravida. Cras sit amet tempor turpis. Nullam nunc enim, venenatis ut ipsum nec, ornare aliquet sapien. Donec leo elit, maximus at purus ac, hendrerit interdum nisl. Morbi vitae elementum massa. Suspendisse vel malesuada risus, vel tincidunt arcu. Nullam eget tempor leo.\n\nNullam ac elit arcu. Integer odio est, eleifend non dapibus eget, posuere eget arcu. Morbi eu lectus elementum, rhoncus felis pretium, pharetra mi.")
                                    .lineSpacing(5)
                                    .font(.system(size: 14, weight: .regular))
                                    .offset(y: 10)
                                
                                HStack {
                                    Spacer()
                                    Button{
                                        
                                    } label:{
                                        CustomButton(label: "Add to your wishlist", width: 300)
                                    }
                                    Spacer()
                                }.offset(y:25)
                                
                            }
                            .padding(EdgeInsets(top: 30, leading: 25, bottom: 30, trailing: 25))
                        }
                    )
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Activity")
                            .offset(y: 5)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Colors.creamTint)
                    }
                }
            }
        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
