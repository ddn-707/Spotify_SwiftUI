//
//  Albums.swift
//  Spotify_SwiftUI
//
//  Created by DND on 15/09/2024.
//

import Foundation

public struct Albums: Codable {
    public let href: String
    public var items: [Album]
    public let limit: Int
    public var next: String?
    public let offset: Int
    public var previous: String?
    public var total: Int
    
    enum CodingKeys: String, CodingKey {
        case href = "href"
        case items = "items"
        case limit = "limit"
        case next = "next"
        case offset = "offset"
        case previous = "previous"
        case total = "total"
    }
    init(href: String, items: [Album], limit: Int, next: String? = nil, offset: Int, previous: String? = nil, total: Int) {
        self.href = href
        self.items = items
        self.limit = limit
        self.next = next
        self.offset = offset
        self.previous = previous
        self.total = total
    }
}
