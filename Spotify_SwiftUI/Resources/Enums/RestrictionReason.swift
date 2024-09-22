//
//  RestrictionReason.swift
//  Spotify_SwiftUI
//
//  Created by DND on 16/9/24.
//

import Foundation

public enum RestrictionReason: String, Codable {
    case market = "market"
    case product = "product"
    case explicit = "explicit"
}
