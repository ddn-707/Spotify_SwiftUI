//
//  AlbumViewModel.swift
//  Spotify_SwiftUI
//
//  Created by DND on 15/09/2024.
//

import Foundation

class AlbumViewModel: ObservableObject {
    var apiCaller: APICaller = APICaller.shared

    // New release albums
    @Published var newReleaseState: FetchState = .good
    @Published var newReleasesAlbums: Albums = Albums(href: "", items: [], limit: 20, next: nil, offset: 0, previous: nil, total: 0)

    init(){
        getNewReleases()
    }
    
    
    private func getNewReleases(){
        guard newReleaseState == .good else {return}
        self.newReleaseState = .isLoading
        let albums = newReleasesAlbums
        apiCaller.getNewReleaseAlbums(offset: albums.items.count, limit: albums.limit) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.newReleasesAlbums = model.albums
                    let resultTotal = self?.newReleasesAlbums.items.count ?? 0
                    self?.newReleaseState = (resultTotal < model.albums.total) ? .good : .loadedAll
                }
            case .failure(let error):
                print("Err!: \(error)")
            }
        }
    }
}
