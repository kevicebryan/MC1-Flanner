//
//  ProgressBar.swift
//  Flanner
//
//  Created by Figo Alessandro Lehman on 25/04/23.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            ForEach(0..<index){ i in
                Rectangle()
                    .frame(width: Size.screenWidth/10, height: 3)
                    .cornerRadius(20)
                    .foregroundColor(Colors.dYellow)
            }
            ForEach(0..<5-index){ i in
                Rectangle()
                    .frame(width: Size.screenWidth/10, height: 3)
                    .cornerRadius(20)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(index: .constant(2))
    }
}
