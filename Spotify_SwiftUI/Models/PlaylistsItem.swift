//
//  PlaylistsItem.swift
//  Spotify_SwiftUI
//
//  Created by ominext on 17/9/24.
//

import Foundation

public struct PlaylistsItem: Codable {
    public let collaborative: Bool
    public let itemDescription: String
    public let externalUrls: ExternalUrls
    public let href: String?
    public let id: String
    public let images: [ImageModel]
    public let name: String
    public let owner: Owner
    public let primaryColor: String?
    public let itemPublic: Bool?
    public let snapshotid: String
    public let tracks: Followers
    public let type: GetPlaylistsType
    public let uri: String

    enum CodingKeys: String, CodingKey {
        case collaborative = "collaborative"
        case itemDescription = "description"
        case externalUrls = "external_urls"
        case href = "href"
        case id = "id"
        case images = "images"
        case name = "name"
        case owner = "owner"
        case primaryColor = "primary_color"
        case itemPublic = "public"
        case snapshotid = "snapshot_id"
        case tracks = "tracks"
        case type = "type"
        case uri = "uri"
    }

    public init(collaborative: Bool, itemDescription: String, externalUrls: ExternalUrls, href: String, id: String, images: [ImageModel], name: String, owner: Owner, primaryColor: String?, itemPublic: Bool?, snapshotid: String, tracks: Followers, type: GetPlaylistsType, uri: String) {
        self.collaborative = collaborative
        self.itemDescription = itemDescription
        self.externalUrls = externalUrls
        self.href = href
        self.id = id
        self.images = images
        self.name = name
        self.owner = owner
        self.primaryColor = primaryColor
        self.itemPublic = itemPublic
        self.snapshotid = snapshotid
        self.tracks = tracks
        self.type = type
        self.uri = uri
    }
}
