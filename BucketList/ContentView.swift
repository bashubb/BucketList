//
//  ContentView.swift
//  BucketList
//
//  Created by HubertMac on 31/10/2023.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack{
            if isUnlocked {
                Text("Unlocked")
            } else {
              Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    // there problem
                }
                
            }
        } else {
            //device has no biometrics
        }
    }
    
}
#Preview {
    ContentView()
}
