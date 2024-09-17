//
//  Seed.swift
//  Spotify_SwiftUI
//
//  Created by DND on 17/9/24.
//

import Foundation

public struct Seed: Codable {
    public let initialPoolSize: Int
    public let afterFilteringSize: Int
    public let afterRelinkingSize: Int
    public let id: String
    public let type: String
    public let href: JSONNull?
    
    enum CodingKeys: String,CodingKey {
        case initialPoolSize = "initialPoolSize"
        case afterFilteringSize = "afterFilteringSize"
        case afterRelinkingSize = "afterRelinkingSize"
        case id = "id"
        case type = "type"
        case href = "href"
    }
    
    init(initialPoolSize: Int, afterFilteringSize: Int, afterRelinkingSize: Int, id: String, type: String, href: JSONNull?) {
        self.initialPoolSize = initialPoolSize
        self.afterFilteringSize = afterFilteringSize
        self.afterRelinkingSize = afterRelinkingSize
        self.id = id
        self.type = type
        self.href = href
    }
}
