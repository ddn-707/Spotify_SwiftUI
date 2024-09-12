//
//  AuthManager.swift
//  Spotify_SwiftUI
//
//  Created by DND on 12/09/2024.
//

import Foundation

final class AuthManager: ObservableObject {
    static let shared = AuthManager()
    
    private init(){
        let accessToken = UserDefaults.standard.string(forKey: Constants.ud_accessToken)
        _isSignedIn = Published(initialValue: accessToken != nil)
    }
    
    @Published var isSignedIn: Bool
}
