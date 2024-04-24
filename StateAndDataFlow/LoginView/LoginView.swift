//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    private let storageManager = StorageManager.shared

    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $loginViewVM.name)

                    .multilineTextAlignment(.center)
                
                Text("\(loginViewVM.name.count)")
                    .foregroundColor(loginViewVM.name.count < 3
                                     ? Color.red
                                     : Color.green
                    )
            }
            .padding()
                        
            Button(action: loginViewVM.login) {
                Label("OK", systemImage: "checkmark.circle")
                
            }
            .foregroundColor(loginViewVM.name.count < 3
                             ? Color.gray
                             : Color.blue
            )
            .disabled(loginViewVM.name.count < 3)
        }
    }
    
//    private func login() {
//        if !loginViewVM.name.isEmpty {
//            loginViewVM.isLoggedIn.toggle()
//            storageManager.saveUser(username: loginViewVM.name, 
//                                    isRegistered: true
//            )
//        }
//    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
