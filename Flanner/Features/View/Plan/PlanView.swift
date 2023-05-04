//
//  PlanView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 03/05/23.
//

import SwiftUI

struct PlanView: View {
  @Binding var showView: Bool
  @Binding var isAnswering: Bool
  
  @State var selectedTags: [TagViewModel] = []
  @State var plans: [TaskViewModel] = []
  
  @State var index: Int = 0
  @State var barIndex: Int = 0
  @State var isPopup = false
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack(alignment: .center) {
          // MARK: CLOSE PLAN BUTTON

          HStack {
            Button {
              showView.toggle()
              isAnswering.toggle()
            } label: {
              Image(systemName: "xmark").font(.system(size: 24, weight: .semibold)).foregroundColor(Colors.turq)
            }
            Spacer()
          }.padding(.horizontal)
          
          Text("PLAN 🧭")
            .foregroundColor(Colors.turq)
            .font(.system(size: 12, weight: .bold))
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))
          ProgressBar(index: $barIndex, max: 3)
            
          Spacer()
            
          // MARK: QUESTION BOX

          Rectangle()
            .fill(Colors.turq)
            .cornerRadius(16)
            .frame(width: 354, height: (index == 2 || index == 3) ? 434 : 281)
            .overlay(
              VStack {
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
                  
                Text("\(Prompt.planPrompts[index])")
                  .font(.system(size: 18, weight: .bold))
                  .foregroundColor(Colors.cream)
                  .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                // MARK: CHOICES

                ForEach(0 ..< Prompt.planChoices[index].count, id: \.self) { i in
                  Button {
//                    if index != 2 {
//                      index += 1
//                    }
//                    else {
//                      isPopup.toggle()
//                    }
                    
                    // add the tag to selectedTags
                    print("PRESSED BUTTON: \(Prompt.planTags[index][i])")
                    let selectedTag = TagModel().getTagByName(name: Prompt.planTags[index][i])
                    
                    if selectedTag != nil {
                      selectedTags.append(TagViewModel(
                        tag: selectedTag!))
                      print("added \(selectedTag?.name ?? "NOTHING") to selectedTags")
                    }
                    
                    if index < 2 {
                      if Prompt.planChoices[index][i] == "I feel energized!" {
                        index += 2
                      
                      } else {
                        index += 1
                      }
                      barIndex += 1
                    } else {
                      isPopup.toggle()
                    }
                    
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
        if isPopup {
          Colors.black
            .opacity(0.35)
            .ignoresSafeArea()
          Rectangle()
            .foregroundColor(.white)
            .cornerRadius(15)
            .frame(width: 297, height: 361)
            .overlay(
              VStack(alignment: .center, spacing: 0) {
                Text("🎉")
                  .font(.system(size: 72))
                  .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                Text("We've got your result!")
                  .font(.system(size: 21, weight: .bold))
                Text("Here’s an activity to try with your family")
                  .font(.system(size: 12, weight: .regular))
                  .padding(EdgeInsets(top: 10, leading: 0, bottom: 25, trailing: 0))
                
                NavigationLink(destination: ResultView(showView: $showView, isAnswering: $isAnswering, plans: plans).navigationBarBackButtonHidden()) {
                  CustomButton(label: "See Details")
                }
                .simultaneousGesture(TapGesture().onEnded {
                  plans = TaskListViewModel().getPlanResult(selectedTags: selectedTags)
                  print("Successfully generated Plans with:")
                  for plan in plans {
                    print("1. \(plan.name)")
                  }
                })
              }
            )
        }
      }
    }
  }
}

struct PlanView_Previews: PreviewProvider {
  static var previews: some View {
    PlanView(showView: .constant(true), isAnswering: .constant(true), index: 2, isPopup: true)
  }
}
