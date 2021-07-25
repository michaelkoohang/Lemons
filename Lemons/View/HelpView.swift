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
            VStack(alignment: .leading, spacing: 16) {
                ForEach(info, id: \.self) { block in
                    if (block["title"]!.count > 0) {
                        Text(block["title"]!)
                            .font(.system(.headline, design: .serif))
                            .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
                    }
                    Text(block["text"]!)
                        .font(.system(.subheadline, design: .serif))
                }
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView(title: "Test", info: [["title": "Heading", "text": "Body"]])
    }
}
