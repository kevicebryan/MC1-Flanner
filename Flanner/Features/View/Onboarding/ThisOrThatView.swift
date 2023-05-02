//
//  PreferencesView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 25/04/23.
//

import SwiftUI

// MARK: Function to Update Corresponding Tag

private func updateThisThatTag(index: Int, selectedThisThat: Int) {
  UserModel().updateUserTag(tagName:
    Prompt.thisOrthatTags[index][selectedThisThat], like: true)
}

struct ThisOrThatView: View {
  let buttonWidth = Size.screenWidth/1.3
  let buttonHeight = Size.screenHeight/5
  
  @ObservedObject var um: UserManager
  @State var index = 0
  @State var isSelected1 = false
  @State var isSelected2 = false
    
  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        Text("GOAL & FOCUS 🎯")
          .foregroundColor(Colors.turq)
          .font(.system(size: 12, weight: .bold))
        ProgressBar(index: $index)
//                    .frame(alignment: .top)
        Spacer()
        Text("\(Prompt.thisOrThatPrompts[index])")
          .font(.system(size: 24, weight: .bold))
          .frame(width: buttonWidth)
          .multilineTextAlignment(.center)
                
        ZStack {
          if !isSelected1 {
            Rectangle()
              .foregroundColor(Colors.lBlue)
              .cornerRadius(20, antialiased: true)
                        
            HStack {
              Image(systemName: "\(Prompt.thisOrThatSymbols[index][0])")
                .font(.system(size: 60))
                .padding()
                .foregroundColor(Colors.turq)
              Text("\(Prompt.thisOrThatChoices[index][0])")
                .foregroundColor(Colors.turq)
                .padding()
//                                .frame(width: buttonWidth/2)
                .font(.system(size: 16, weight: .bold))
            }
          }
          else {
            Rectangle()
              .foregroundColor(Colors.turq)
              .cornerRadius(20, antialiased: true)
                        
            HStack {
              Image(systemName: "\(Prompt.thisOrThatSymbols[index][0])")
                .font(.system(size: 60))
                .padding()
              Text("\(Prompt.thisOrThatChoices[index][0])")
                .padding()
//                                .frame(width: buttonWidth/2)
                .font(.system(size: 16, weight: .bold))
            }.foregroundColor(Colors.lBlue)
          }
        }
        .onTapGesture {
          if isSelected2 {
            isSelected2 = false
            isSelected1 = true
          }
          else {
            isSelected1 = true
          }
        }
        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
        .padding().animation(.easeInOut, value: isSelected1)
                
        ZStack {
          if !isSelected2 {
            Rectangle()
              .foregroundColor(Colors.lBlue)
              .cornerRadius(20, antialiased: true)
                        
            HStack {
              Image(systemName: "\(Prompt.thisOrThatSymbols[index][1])")
                .foregroundColor(Colors.turq)
                .font(.system(size: 60))
                .padding()
              Text("\(Prompt.thisOrThatChoices[index][1])")
                .foregroundColor(Colors.turq)
                .padding()
//                                .frame(width: buttonWidth/2)
                .font(.system(size: 16, weight: .bold))
            }
          }
          else {
            Rectangle()
              .foregroundColor(Colors.turq)
              .cornerRadius(20, antialiased: true)
                        
            HStack {
              Image(systemName: "\(Prompt.thisOrThatSymbols[index][1])")
                .font(.system(size: 60))
                .padding()
              Text("\(Prompt.thisOrThatChoices[index][1])")
                .padding()
//                                .frame(width: buttonWidth/2)
                .font(.system(size: 16, weight: .bold))
            }.foregroundColor(Colors.lBlue)
          }
        }
        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
        .onTapGesture {
          if isSelected1 {
            isSelected1 = false
            isSelected2 = true
          }
          else {
            isSelected2 = true
          }
        }.animation(.easeInOut, value: isSelected2)
        Spacer()
        if index != 4 {
          Button {
            index += 1
            isSelected1 = false
            isSelected2 = false
            
            // MARK: Update Corresponding Tag Weight:

            updateThisThatTag(index: index, selectedThisThat: isSelected1 ? 0 : 1)
            
          } label: {
            CustomButton(label: "Next", width: 300, isDisabled: !isSelected1 && !isSelected2)
          }
          .disabled(!isSelected1 && !isSelected2)
          .padding()
        }
        else {
          if isSelected1 || isSelected2 {
            NavigationLink(destination: ContentView(um: um)
              .navigationBarBackButtonHidden(true)
            ) {
              CustomButton(label: "Continue", width: 300, isDisabled: !isSelected1 && !isSelected2)
                .disabled(!isSelected1 && !isSelected2)
                .padding()
            }.simultaneousGesture(TapGesture().onEnded {
              updateThisThatTag(index: index, selectedThisThat: isSelected1 ? 0 : 1)
              um.addNewUser()
            })
          }
          else {
            CustomButton(label: "Continue", width: 300, isDisabled: !isSelected1 && !isSelected2)
              .disabled(!isSelected1 && !isSelected2)
              .padding()
          }
        }
      }.animation(.spring(), value: index)
    }
  }
}

struct ThisOrThatView_Previews: PreviewProvider {
  static var previews: some View {
    ThisOrThatView(um: UserManager(), index: 1)
  }
}
