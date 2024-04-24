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
    static let shared = StorageManager() // Создаем shared singleton экземпляр
    
    @AppStorage("username") var username: String = ""
    @AppStorage("isRegistered") var isRegistered: Bool = false
    
    private init() {}
    
    func saveUser(username: String, isRegistered: Bool) {
        self.username = username // Сохраняем имя пользователя
        self.isRegistered = isRegistered // Сохраняем статус регистрации
    }
    
    func loadUser() -> User {
         User(username: username, isRegistered: isRegistered) // Восстанавливаем данные пользователя из UserDefaults
    }
    
    func deleteUser() {
        self.username = "" // Удаляем имя пользователя
        self.isRegistered = false // Удаляем статус регистрации
    }
}
