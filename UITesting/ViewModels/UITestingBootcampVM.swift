//
//  UITestingBootcampVM.swift
//  UITesting
//
//  Created by Kaushal Kumbagowdana on 6/11/23.
//

import Foundation

class UITestingBootcampVM: ObservableObject {
    
    let placeholderText: String = "Add your name..."
    @Published var textFieldText: String = ""
    @Published var currentUserIsSignedIn: Bool = false
    
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else { return }
        currentUserIsSignedIn = true
    }
    
    func signOutButtonPressed() {
        guard currentUserIsSignedIn else { return }
        currentUserIsSignedIn = false
    }
}
