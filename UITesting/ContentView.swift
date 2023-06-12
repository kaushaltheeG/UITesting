//
//  ContentView.swift
//  UITesting
//
//  Created by Kaushal Kumbagowdana on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let currentUserIsSignedIn: Bool
    
    init() {
        // path to set variable or env: Product -> Scheme -> Edit Scheme -> Run -> Toggle to Variable
        // Can be accessed like
         // 1
//            let userIsSignIn: Bool = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false;
         // 2
        let userIsSignIn: Bool = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true : false
        self.currentUserIsSignedIn = userIsSignIn
    }

    var body: some View {
        UITestingBootcampView(currentUserIsSignedIn: self.currentUserIsSignedIn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
