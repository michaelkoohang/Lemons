
import Foundation

// MARK: Manager for handling user defaults
struct UserDefaultsManager {
    static private let defaults = UserDefaults.standard
    static private let NEW_USER_KEY = "new_user"
    
    static func getNewUser() -> Bool {
        return defaults.bool(forKey: NEW_USER_KEY)
    }
    
    static func setNewUser(appOpened: Bool) {
        defaults.setValue(appOpened, forKey: NEW_USER_KEY)
    }
}
