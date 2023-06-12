//
//  SignedInHomeView.swift
//  UITesting
//
//  Created by Kaushal Kumbagowdana on 6/11/23.
//

import SwiftUI

struct SignedInHomeView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Show welcome alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.red.opacity(0.7))
                        .cornerRadius(10) 
                })
                .accessibilityIdentifier("showAlertButton")
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text("Welcome to the app"))
                })
                
                NavigationLink(destination: Text("Destination"), label: {
                    Text("Navigation")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(10)
                        .accessibilityIdentifier("navigationLinkToDestination")
                })
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

struct SignedInHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SignedInHomeView()
    }
}
