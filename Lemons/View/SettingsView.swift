//
//  SettingsView.swift
//  Lemons
//
//  Created by Michael Koohang on 7/26/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Button("About") { showSheet = true }
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showSheet) {
                AboutView()
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
