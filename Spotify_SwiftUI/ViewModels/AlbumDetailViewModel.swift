//
//  AlbumDetailViewModel.swift
//  Spotify_SwiftUI
//
//  Created by DND on 22/9/24.
//

import Foundation
import SwiftUI

class AlbumDetailViewModel: ObservableObject {
    @Published var album: AlbumDetails?
    @Published var durationms: Int = 0
    
    var albumId: String
    var apiCaller: APICaller = APICaller.shared
    
    init (albumId: String){
        self.albumId = albumId
    }
    
    public func fetchAlbumDetails(){
        apiCaller.getAlbumDetails(with: albumId) {[weak self] result in
            switch result {
                case .success(let album):
                DispatchQueue.main.async {
                    self?.album = album
                    self?.durationms = (album.tracks.items.compactMap {
                        $0.durationms
                    }).reduce(0, +)
                }
            case .failure(let error):
                print("fetchAlbumDetails#Error: \(error.localizedDescription)")
            }
        }
    }
}
