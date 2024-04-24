//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    private let storageManager = StorageManager.shared

    
    var body: some View {
    
        VStack {
//            Text("Hi, \(loginViewVM.name)")
            Text("Hi, \(storageManager.loadUser().username)")
            
                .font(.title)
                .padding(.top, 100)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
                
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM)
            
            Spacer()
            
            ButtonLogOutView()
            
        }
        .padding()
        
    }
    
}

#Preview {
    ContentView()
        .environmentObject(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    @ObservedObject var contentViewVM: ContentViewViewModel
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

struct ButtonLogOutView: View {
    @EnvironmentObject var loginViewVM: LoginViewViewModel
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        Button(action: logOut) {
            Text("LogOut")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 20))
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
    
  private func logOut() {
        if storageManager.isRegistered {
            storageManager.deleteUser()
        }
      loginViewVM.name = ""
    }
}

