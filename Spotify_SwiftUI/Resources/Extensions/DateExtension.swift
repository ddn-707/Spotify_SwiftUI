//
//  DateExtension.swift
//  Spotify_SwiftUI
//
//  Created by DND on 13/09/2024.
//

import Foundation


extension Date: RawRepresentable {
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
    
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
}
