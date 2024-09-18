//
//  Copyright.swift
//  Spotify_SwiftUI
//
//  Created by DND on 18/9/24.
//

public struct Copyright: Codable {
    public var text: String
    public var type: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case type = "type"
    }
    
    init(text: String, type: String) {
        self.text = text
        self.type = type
    }
}
