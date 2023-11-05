//
//  ContentView.swift
//  BucketList
//
//  Created by HubertMac on 31/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    enum LoadingState{
        case loading, success, failed
    }
    
    struct LoadingView: View {
        var body: some View {
            Text("Loading...")
        }
    }
    
    struct SuccessView: View {
        var body: some View {
            Text("Success!")
        }
    }
    
    struct FailedView: View {
        var body: some View {
            Text("Failed.")
        }
    }
    
    var body: some View {
        var loadingState = LoadingState.loading
        
    
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
            
            
//                .onTapGesture {
//                    FileManager.default.encodeToFile(content: "message", fileName: "test.txt")
//                    let message = FileManager.default.decode(String.self, from: "test.txt")
//                    print(message)
//                }
      
    }
}

#Preview {
    ContentView()
}
