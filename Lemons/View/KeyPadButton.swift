//
//  KeyPadButton.swift
//  Bearish
//
//  Created by Michael Koohang on 7/12/21.
//

import SwiftUI

struct KeyPadButton: View {
    
    @State var char: String = ""
    @State var image: String = ""
    @State var action: () -> ()
    
    let margin: CGFloat = 8.0
    
    var body: some View {
        Button(action: action) {
            if char.count > 0 {
                Text(char)
                    .frame(minWidth: 70, minHeight: 70, alignment: .center)
                    .background(Color(UIColor.systemBackground))
                    .foregroundColor(.primary)
                    .font(Font.system(size: 24, weight: .bold, design: .default))
                    .cornerRadius(20, antialiased: true)
            } else {
                Image(systemName: image)
                    .frame(minWidth: 70, minHeight: 70, alignment: .center)
                    .background(Color(UIColor.systemBackground))
                    .foregroundColor(.red)
                    .font(Font.system(size: 24, weight: .medium, design: .default))
                    .cornerRadius(20, antialiased: true)
            }
        }
        .shadow(color: Color(UIColor.systemGray3), radius: 5, x: 0.0, y: 0.0)
        .padding(EdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin))
    }
}

struct KeyPadButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadButton(char: "", image: "delete.left", action: {})
    }
}
