//
//  Track.swift
//  Spotify_SwiftUI
//
//  Created by DND on 16/9/24.
//

import Foundation

public struct Track: Codable {
    public var album: Album?
    public let artists: [Artist]?
    public let availableMarkets: [String]?
    public let discNumber: Int?
    public let durationms: Int
    public let episode: Bool?
    public let explicit: Bool
    public let externalids: Externalids?
    public let externalUrls: ExternalUrls
    public let href: String
    public let id: String
    public let isLocal: Bool
    public let name: String
    public let popularity: Int?
    public let previewurl: String?
    public let trackNumber: Int
    public let type: TrackType
    public let uri: String
    public let restrictions: Restrictions?
    public let images: [ImageModel]?
    
    enum CodingKeys: String, CodingKey {
        case album = "album"
        case artists = "artists"
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationms = "duration_ms"
        case episode = "episode"
        case explicit = "explicit"
        case externalids = "external_ids"
        case externalUrls = "external_urls"
        case href = "href"
        case id = "id"
        case isLocal = "is_local"
        case name = "name"
        case popularity = "popularity"
        case previewurl = "preview_url"
        case trackNumber = "track_number"
        case type = "type"
        case uri = "uri"
        case restrictions = "restrictions"
        case images = "images"
    }
}
