//
//  G.swift
//  Spotify_SwiftUI
//
//  Created by DND on 22/9/24.
//

public struct AlbumDetail: Codable {
    public let albumType: AlbumType
    public let artists: [Artist]
    public let availableMarkets: [String]
    public let copyrights: [Copyright]
    public let externalids: Externalids?
    public let externalUrls: ExternalUrls
    public let genres: [JSONAny]
    public let href: String
    public let id: String
    public let images: [ImageModel]
    public let label: String
    public let name: String
    public let popularity: Int?
    public let releaseDate: String
    public let releaseDatePrecision: String
    public let totalTracks: Int
    public var tracks: Tracks
    public let type: AlbumType
    public let uri: String
    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists = "artists"
        case availableMarkets = "available_markets"
        case copyrights = "copyrights"
        case externalids = "external_ids"
        case externalUrls = "external_urls"
        case genres = "genres"
        case href = "href"
        case id = "id"
        case images = "images"
        case label = "label"
        case name = "name"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case totalTracks = "total_tracks"
        case tracks = "tracks"
        case type = "type"
        case uri = "uri"
    }
    
    init(albumType: AlbumType, artists: [Artist], availableMarkets: [String], copyrights: [Copyright], externalids: Externalids?, externalUrls: ExternalUrls, genres: [JSONAny], href: String, id: String, images: [ImageModel], label: String, name: String, popularity: Int?, releaseDate: String, releaseDatePrecision: String, totalTracks: Int, tracks: Tracks, type: AlbumType, uri: String) {
        self.albumType = albumType
        self.artists = artists
        self.availableMarkets = availableMarkets
        self.copyrights = copyrights
        self.externalids = externalids
        self.externalUrls = externalUrls
        self.genres = genres
        self.href = href
        self.id = id
        self.images = images
        self.label = label
        self.name = name
        self.popularity = popularity
        self.releaseDate = releaseDate
        self.releaseDatePrecision = releaseDatePrecision
        self.totalTracks = totalTracks
        self.tracks = tracks
        self.type = type
        self.uri = uri
    }
}
