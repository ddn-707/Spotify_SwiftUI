//
//  Helper.swift
//  Spotify_SwiftUI
//
//  Created by DND on 14/09/2024.
//

import Foundation
import SwiftUI

struct Helper {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    
    static private var backgroundColors: Set<Color> = [
        Color.accentColor,
        Color.accentColor,
        Color.green,
        Color.gray,
        Color.purple,
        Color.blue,
        Color.brown,
        Color.cyan,
        Color.indigo,
        Color.mint,
        Color.orange,
        Color.pink,
        Color.red,
        Color.teal,
        Color.yellow
    ]
    
    static func getRadiomColor() -> Color {
        backgroundColors.randomElement() ?? .accentColor
    }
    
    static func getArtistName(artist: [Artist]) -> String {
        let artistName = artist.compactMap {$0.name}
        return artistName.joined(separator: ",")
    }
}
