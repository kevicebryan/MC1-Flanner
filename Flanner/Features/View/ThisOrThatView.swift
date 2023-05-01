//
//  PreferencesView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 25/04/23.
//

import SwiftUI

struct ThisOrThatView: View {
    let buttonWidth = Size.screenWidth/1.3
    let buttonHeight = Size.screenHeight/5
    @State var index = 0
    @State var isSelected1 = false
    @State var isSelected2 = false
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
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
                                .foregroundColor(Colors.cream)
                            Text("\(Prompt.thisOrThatChoices[index][0])")
                                .foregroundColor(Colors.cream)
                                .padding()
//                                .frame(width: buttonWidth/2)
                                .font(.system(size: 16, weight: .bold))
                        }
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
                .padding()
                
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
                                .foregroundColor(Colors.cream)
                            Text("\(Prompt.thisOrThatChoices[index][1])")
                                .foregroundColor(Colors.cream)
                                .padding()
//                                .frame(width: buttonWidth/2)
                                .font(.system(size: 16, weight: .bold))
                        }
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
                }
                Spacer()
                Button{
                    index += 1
                    isSelected1 = false
                    isSelected2 = false
                } label: {
                    if(!isSelected1 && !isSelected2){
                        CustomButton(label: "Next", isDisabled: true)
                    }
                    else{
                        CustomButton(label: "Next")
                    }
                   
                }
                .disabled(!isSelected1 && !isSelected2)
                    .padding()
            }
        }
    }
}

struct ThisOrThatView_Previews: PreviewProvider {
    static var previews: some View {
        ThisOrThatView(index: 0)
    }
}
