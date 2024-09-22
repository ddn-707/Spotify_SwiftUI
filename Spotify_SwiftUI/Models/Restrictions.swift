//
//  Restrictions.swift
//  Spotify_SwiftUI
//
//  Created by DND on 16/9/24.
//

import Foundation

public struct Restrictions: Codable {
    public let reason: RestrictionReason
    
    enum CodingKeys: String, CodingKey {
        case reason = "reason"
    }
    
    init(reason: RestrictionReason) {
        self.reason = reason
    }
}
