//
//  ContentView.swift
//  Spotify_SwiftUI
//
//  Created by DND on 07/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authManager: AuthManager = AuthManager.shared
    var body: some View {
        if(authManager.isSignedIn){
            TabBarView()
        }else{
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
}
