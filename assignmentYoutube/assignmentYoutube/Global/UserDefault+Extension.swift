//
//  UserDefault+Extension.swift
//  assignmentYoutube
//
//  Created by Roh on 5/2/24.
//

import Foundation

extension UserDefaults {
    class func setLoggedIn() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    class func isLoggedIn() -> Bool {
        let result = UserDefaults.standard.bool(forKey: "isLoggedIn")
        return result
    }
}
