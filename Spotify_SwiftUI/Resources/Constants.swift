//
//  Constants.swift
//  Spotify_SwiftUI
//
//  Created by DND on 12/09/2024.
//

import Foundation

struct Constants {
    private static var clientID : String = "397ee46be88a48bbbbf2a533b8041b9b"
    private static var clientSecret: String = "b48cca0da1344a6fa85678db5932e2be"
    static let tokenAPIURL: String = "https://accounts.spotify.com/api/token"
    static let redirectURI = "https://github.com/dinhdung140198/Spotify"
    static let scopes = "user-read-private%20playlist-modify-public%20playlist-read-private%20playlist-modify-private%20user-follow-read%20user-library-modify%20user-library-read%20user-read-email"
    
    static let ud_accessToken = "access_token"
    static let ud_refreshToken = "refresh_token"
    static let ud_expirationDate = "expirationDate"
    
    static func getClientID() -> String {
        if clientID.isEmpty {
            var nsDictionary: NSDictionary?
            if let path = Bundle.main.path(forResource: "ClientConfig", ofType: "plist") {
                nsDictionary = NSDictionary(contentsOfFile: path)
                if let id = nsDictionary?.value(forKey: "ClientID") {
                    clientID = id as! String
                }
            }
        }
        return clientID
    }
    
    static func getClientSecret() -> String {
        if clientSecret.isEmpty {
            var nsDictionary: NSDictionary?
            if let path = Bundle.main.path(forResource: "ClientConfig", ofType: "plist") {
                nsDictionary = NSDictionary(contentsOfFile: path)
                if let id = nsDictionary?.value(forKey: "ClientSecret") {
                    clientSecret = id as! String
                }
            }
        }
        return clientSecret
    }

}
