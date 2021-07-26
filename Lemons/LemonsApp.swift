
import SwiftUI

@main
struct LemonsApp: App {
    
    @State var showSheet: Bool = false
        
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear() {
                    if !UserDefaultsManager.getNewUser() {
                        UserDefaultsManager.setNewUser(appOpened: true)
                        showSheet = true
                    }
                }
                .sheet(isPresented: $showSheet) {
                    AboutView()
                }
        }
    }
}
