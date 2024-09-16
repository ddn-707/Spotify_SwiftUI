//
//  Followers.swift
//  Spotify_SwiftUI
//
//  Created by DND on 16/9/24.
//

import Foundation

public struct Followers: Codable {
    public let href: String
    public let total: Int
    
    enum CodingKeys: String ,CodingKey {
        case href = "href"
        case total = "total"
    }
    
    init(href: String, total: Int) {
        self.href = href
        self.total = total
    }
}
