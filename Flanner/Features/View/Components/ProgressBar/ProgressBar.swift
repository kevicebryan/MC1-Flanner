//
//  ProgressBar.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 25/04/23.
//

import SwiftUI

struct ProgressBar: View {
    var width =  UIScreen.main.bounds.width * 0.8
    @Binding var index: Int
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth: width, maxHeight: 20).foregroundColor(.gray)
                .cornerRadius(20)
            
            Rectangle()
                .frame(width: CGFloat(Int(width)/11 * (index + 1)), height: 20)
                .cornerRadius(20)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(index: .constant(10))
    }
}
