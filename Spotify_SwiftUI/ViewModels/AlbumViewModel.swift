//
//  AlbumViewModel.swift
//  Spotify_SwiftUI
//
//  Created by DND on 15/09/2024.
//

import Foundation

class AlbumViewModel: ObservableObject {

    // New release albums
    @Published var newReleaseState: FetchState = .good
    @Published var newReleaseAlbum: Albums = Albums(href: "", items: [], limit: 20, next: nil, offset: 0, previous: nil, total: 0)
}
