//
//  FeaturedPlaylist.swift
//  Spotify_SwiftUI
//
//  Created by ominext on 17/9/24.
//

import Foundation

public struct FeaturedPlaylist: Codable {
    public let message: String
    public var playlists: Playlists

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case playlists = "playlists"
    }

    public init(message: String, playlists: Playlists) {
        self.message = message
        self.playlists = playlists
    }
}
