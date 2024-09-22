//
//  Externalids.swift
//  Spotify_SwiftUI
//
//  Created by DND on 16/9/24.
//

import Foundation

public struct Externalids: Codable {
    public let isrc: String?
    public let upc: String?
    
    enum CodingKeys: String, CodingKey {
        case isrc = "isrc"
        case upc = "upc"
    }
    
    init(isrc: String?, upc: String?) {
        self.isrc = isrc
        self.upc = upc
    }
}

