//
//  Album.swift
//  Spotify_SwiftUI
//
//  Created by DND on 15/09/2024.
//

import Foundation

//TODO: create Album model
public struct Album: Codable {
    public let albumType: String
    public let artists: [Artist]
}
