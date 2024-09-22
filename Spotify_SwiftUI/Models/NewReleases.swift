//
//  NewReleases.swift
//  Spotify_SwiftUI
//
//  Created by DND on 15/09/2024.
//

import Foundation

struct NewReleases: Codable {
    public let albums: Albums
    
    enum CodingKeys: String, CodingKey {
        case albums = "albums"
    }
    
    init(albums: Albums) {
        self.albums = albums
    }
}
