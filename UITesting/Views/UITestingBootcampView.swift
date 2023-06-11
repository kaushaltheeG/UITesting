//
//  UITestingBootcamp.swift
//  UITesting
//
//  Created by Kaushal Kumbagowdana on 6/11/23.
//

import SwiftUI

struct UITestingBootcampView: View {
    @StateObject private var vm: UITestingBootcampVM = UITestingBootcampVM()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black]), startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            if vm.currentUserIsSignedIn {
                Button(action: vm.signOutButtonPressed, label: {
                    Text("I am signed in")
                })
                
            }
            if !vm.currentUserIsSignedIn {
                signUpLayer
            }
            
        }
    }
}

struct UITestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UITestingBootcampView()
    }
}

extension UITestingBootcampView {
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
            Button (action: vm.signUpButtonPressed, label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .background(Color.purple.opacity(0.5))
                    .cornerRadius(10)
            })
        }
        .padding()
    }
}
