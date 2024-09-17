//
//  Playlists.swift
//  Spotify_SwiftUI
//
//  Created by ominext on 17/9/24.
//

import Foundation

public struct Playlists: Codable {
    public let href: String?
    public var items: [PlaylistsItem]
    public let limit: Int
    public let next: String?
    public let offset: Int
    public let previous: String?
    public let total: Int
    
    enum CodingKeys: String, CodingKey {
        case href = "href"
        case items = "items"
        case limit = "limit"
        case next = "next"
        case offset = "offset"
        case previous = "previous"
        case total = "total"
    }
    
    init(href: String?,
        items: [PlaylistsItem],
        limit: Int,
        next: String?,
        offset: Int,
        previous: String?,
        total: Int
    ) {
        self.href = href
        self.items = items
        self.limit = limit
        self.next = next
        self.offset = offset
        self.previous = previous
        self.total = total
    }
}
