//
//  HelpView.swift
//  Bearish
//
//  Created by Michael Koohang on 7/12/21.
//

import SwiftUI

struct HelpView: View {
    
    @State var title: String
    @State var info: [[String:String]]
    
    var body: some View {
        ScrollView {
            ForEach(info, id: \.self) { block in
                if (block["title"]!.count > 0) {
                    Text(block["title"]!)
                        .font(Font.system(size: 21, weight: .medium, design: .default))
                }
                Text(block["text"]!)
                    .frame(maxHeight: 80)
                    .lineLimit(10)
            }
        }
        .padding()
        .navigationTitle(title)
    }
}

//struct HelpView_Previews: PreviewProvider {
//    static var previews: some View {
//        HelpView(title: "Test", info: ["Test"])
//    }
//}
