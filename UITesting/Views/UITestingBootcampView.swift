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
            ZStack {
                if vm.currentUserIsSignedIn {
                    SignedInHomeView()
                    
                }
                if !vm.currentUserIsSignedIn {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
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
                .accessibilityIdentifier("SignUpTextField") // for UI Test
                
            Button (action: {
                withAnimation(.spring()) {
                    vm.signUpButtonPressed()
                }
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .background(Color.purple.opacity(0.5))
                    .cornerRadius(10)
                    .accessibilityIdentifier("SignUpButton") // for UI Test
            })
        }
        .padding()
    }
}
