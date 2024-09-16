//
//  ImageModel.swift
//  Spotify_SwiftUI
//
//  Created by DND on 16/9/24.
//

import Foundation

public struct ImageModel: Codable {
    public let height: Int?
    public let url: String
    public let width: Int?
    
    enum CodingKeys: String, CodingKey {
        case height = "height"
        case url = "url"
        case width = "width"
    }
    
    init(height: Int?, url: String, width: Int?) {
        self.height = height
        self.url = url
        self.width = width
    }
}
