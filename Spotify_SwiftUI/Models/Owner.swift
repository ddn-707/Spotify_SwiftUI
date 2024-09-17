//
//  Owner.swift
//  Spotify_SwiftUI
//
//  Created by ominext on 17/9/24.
//

import Foundation

public struct Owner: Codable {
    public let displayName: String?
    public let externalUrls: ExternalUrls
    public let href: String
    public let id: String
    public let type: OwnerType
    public let uri: String
    public let name: String?
    public let images: [ImageModel]?
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case externalUrls = "external_urls"
        case href = "href"
        case id = "id"
        case type = "type"
        case uri = "uri"
        case name = "name"
        case images = "images"
    }
    
    init(displayName: String?, externalUrls: ExternalUrls, href: String, id: String, type: OwnerType, uri: String, name: String?, images: [ImageModel]?) {
        self.displayName = displayName
        self.externalUrls = externalUrls
        self.href = href
        self.id = id
        self.type = type
        self.uri = uri
        self.name = name
        self.images = images
    }
}
