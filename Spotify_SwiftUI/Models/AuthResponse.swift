//
//  AuthResponse.swift
//  Spotify_SwiftUI
//
//  Created by ominext on 13/9/24.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
