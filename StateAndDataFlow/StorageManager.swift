//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Алексей Попов on 23.04.2024.
//

import Foundation
import SwiftUI

struct User {
    var username: String
    var isRegistered: Bool
}

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("username") var username: String = ""
    @AppStorage("isRegistered") var isRegistered: Bool = false
    
    private init() {}
    
    func saveUser(username: String, isRegistered: Bool) {
        self.username = username
        self.isRegistered = isRegistered
    }
    
    func loadUser() -> User {
         User(username: username, isRegistered: isRegistered)
    }
    
    func deleteUser() {
        self.username = ""
        self.isRegistered = false 
    }
}
