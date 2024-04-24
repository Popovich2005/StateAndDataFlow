//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

//final class LoginViewViewModel: ObservableObject {
//  
//    @Published var characterCount = 0
//    @Published var isLoggedIn = false
//    
//    var name = ""{
//        didSet {
//            characterCount = name.count
//        }
//    }
//}

final class LoginViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var characterCount = 0
    @Published var isLoggedIn = false
    
    func setName(_ newName: String) {
        name = newName
        characterCount = newName.count
    }
}

