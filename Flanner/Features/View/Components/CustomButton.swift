//
//  CustomButton.swift
//  Flanner
//
//  Created by Kevin Bryan on 30/04/23.
//

import SwiftUI

struct CustomButton: View {
    let label: String
    let width: Int
    let isDisabled: Bool
    
    
    init(label: String, width: Int = 200, isDisabled: Bool = false) {
        self.label = label
        self.width = width
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        Text("\(label)")
            .foregroundColor(.white)
            .frame(width: CGFloat(width), height: 40, alignment: .center)
            .background((isDisabled) ? Colors.disabledDYellow : Colors.dYellow)
            .cornerRadius(20, antialiased: true)
            .padding()
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(label: "This is the label", isDisabled: true)
    }
}
