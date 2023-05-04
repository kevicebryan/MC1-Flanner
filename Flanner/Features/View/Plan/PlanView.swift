//
//  PlanView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 03/05/23.
//

import SwiftUI

struct PlanView: View {
    @State var index: Int = 0
    var body: some View {
        VStack(alignment: .center){
            Text("PLAN 🧭")
              .foregroundColor(Colors.turq)
              .font(.system(size: 12, weight: .bold))
              .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))
            ProgressBar(index: $index, max: 3)
            
            Spacer()
            
            Rectangle()
                .fill(Colors.turq)
                .cornerRadius(16)
                .frame(width: 354, height: 281)
                .overlay(
                    VStack{
                        Circle()
                            .strokeBorder(.white, lineWidth: 4)
                            .background(Circle().foregroundColor(Colors.cream)
                                .overlay(
                                    Image(systemName: "person.fill.questionmark")
                                    .foregroundColor(Colors.turq)
                                    .font(.system(size: 40))
                                )
                            )
                            .frame(width: 103, height: 103)
//                            .offset(y:-52)
                        
                        Text("\(Prompt.planPrompts[0])")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Colors.cream)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            
                        
                        ForEach(0..<Prompt.planChoices[index].count, id: \.self){ i in
                            Button{
                                
                            } label: {
                                Text("\(Prompt.planChoices[index][i])")
                                    .font(.system(size: 18, weight: .bold))
                                    .frame(width: 270, height: 36)
                                    .foregroundColor(Colors.turq)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(Colors.lBlue)
                        }
//                        Spacer(minLength: 354/2)
                    }
                        .offset(y: -60)
                )
            
            Spacer()
        }
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
