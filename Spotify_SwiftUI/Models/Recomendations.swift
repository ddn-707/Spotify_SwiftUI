//
//  Recomendations.swift
//  Spotify_SwiftUI
//
//  Created by DND on 17/9/24.
//

import Foundation

public struct Recommendations: Codable {
    public let tracks: [Track]
    public let seeds: [Seed]
    
    enum CodingKeys: String, CodingKey {
        case tracks = "tracks"
        case seeds = "seeds"
    }
    
    init(tracks: [Track], seeds: [Seed]) {
        self.tracks = tracks
        self.seeds = seeds
    }
}
