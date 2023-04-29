//
//  PreferencesView.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 25/04/23.
//

import SwiftUI

struct PreferencesView: View {
    let buttonWidth = Size.screenWidth/1.3
    let buttonHeight = Size.screenHeight/5
    @State var index = 0
    @State var isSelected1 = false
    @State var isSelected2 = false
    
    var body: some View {
        NavigationView {
            VStack{
                Text("GOAL & FOCUS 🎯")
                    .foregroundColor(Colors.turq)
                    .font(.system(size: 12, weight: .bold))
                ProgressBar(index: $index)
                    .frame(alignment: .top)
                Spacer()
                Text("What's Your Family Preferences?")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                
                ZStack{
                    if !isSelected1 {
                        Rectangle()
                            .foregroundColor(Colors.lBlue)
                            .cornerRadius(20, antialiased: true)
                        
                        HStack{
                            Image(systemName: "figure.run")
                                .resizable()
                                .frame(width: 60, height: 100, alignment: .center)
                                .padding()
                                .foregroundColor(Colors.turq)
                            Text("Sports-Oriented Activities")
                                .foregroundColor(Colors.turq)
                                .padding()
                                .font(.system(size: 15))
                        }
                        
                    }
                    else{
                        Rectangle()
                            .foregroundColor(Colors.turq)
                            .cornerRadius(20, antialiased: true)
                        
                        HStack{
                            Image(systemName: "figure.run")
                                .resizable()
                                .frame(width: 60, height: 100, alignment: .center)
                                .padding()
                                .foregroundColor(Colors.cream)
                            Text("Sports-Oriented Activities")
                                .foregroundColor(Colors.cream)
                                .padding()
                                .font(.system(size: 15))
                        }
                    }
                }
                .onTapGesture {
                    if isSelected2{
                        isSelected2 = false
                        isSelected1 = true
                    }
                    else{
                        isSelected1 = true
                    }
                }
                .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                .padding()
                
                ZStack{
                    if !isSelected2{
                        Rectangle()
                            .foregroundColor(Colors.lBlue)
                            .cornerRadius(20, antialiased: true)
                        
                        HStack{
                            Image(systemName: "figure.run")
                                .resizable()
                                .foregroundColor(Colors.turq)
                                .frame(width: 60, height: 100, alignment: .center)
                                .padding()
                            Text("Sports-Oriented Activities")
                                .foregroundColor(Colors.turq)
                                .padding()
                                .font(.system(size: 15))
                        }
                    }
                    else{
                        Rectangle()
                            .foregroundColor(Colors.turq)
                            .cornerRadius(20, antialiased: true)
                        
                        HStack{
                            Image(systemName: "figure.run")
                                .resizable()
                                .frame(width: 60, height: 100, alignment: .center)
                                .padding()
                                .foregroundColor(Colors.cream)
                            Text("Sports-Oriented Activities")
                                .foregroundColor(Colors.cream)
                                .padding()
                                .font(.system(size: 15))
                        }
                    }
                }
                .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                .onTapGesture {
                    if isSelected1{
                        isSelected1 = false
                        isSelected2 = true
                    }
                    else{
                        isSelected2 = true
                    }
                }
                Spacer()
            }
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(index: 2)
    }
}
