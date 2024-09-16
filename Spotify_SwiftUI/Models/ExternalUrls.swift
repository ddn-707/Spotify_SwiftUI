//
//  ExternalUrls.swift
//  Spotify_SwiftUI
//
//  Created by DND on 16/9/24.
//

import Foundation

public struct ExternalUrls: Codable {
    public let spotify: String
    
    enum CodingKeys: String, CodingKey {
        case spotify = "spotify"
    }
    
    init(spotify: String) {
        self.spotify = spotify
    }
}
