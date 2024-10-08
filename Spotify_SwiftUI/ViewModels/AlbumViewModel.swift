//
//  AlbumViewModel.swift
//  Spotify_SwiftUI
//
//  Created by DND on 15/09/2024.
//

import Foundation

class AlbumViewModel: ObservableObject {
    var apiCaller: APICaller = APICaller.shared

    init(){
        getNewReleases()
        getFeaturedPlaylists()
        getRecommendations()
    }
    

    //MARK:  New release albums
    @Published var newReleaseState: FetchState = .good
    @Published var newReleasesAlbums: Albums = Albums(href: "", items: [], limit: 20, next: nil, offset: 0, previous: nil, total: 0)
    
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
    
    public func loadMoreNewReleases(){
        guard newReleaseState == .good else {return}
        self.newReleaseState = .isLoading
        let albums = newReleasesAlbums
        apiCaller.getNewReleaseAlbums(offset: albums.items.count, limit: albums.limit) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.newReleasesAlbums.items.append(contentsOf: model.albums.items)
                    let resultTotal = self?.newReleasesAlbums.items.count ?? 0
                    self?.newReleaseState = (resultTotal < model.albums.total) ? .good : .loadedAll
                }
            case .failure(let error):
                print("Err!: \(error)")
            }
        }
    }
    
    //MARK: Featured playlist
    @Published var featuredPlaylistState: FetchState = .good
    @Published var featuredPlaylist: FeaturedPlaylist = FeaturedPlaylist(message: "", playlists: Playlists(href: "", items: [], limit: 20, next: nil, offset: 0, previous: nil, total: 0))
    
    private func getFeaturedPlaylists(){
        guard featuredPlaylistState == FetchState.good else {
            return
        }
        self.featuredPlaylistState = .isLoading
        let playlists = featuredPlaylist
        apiCaller.getAllFeaturedPlaylists(limit: playlists.playlists.limit, offset: playlists.playlists.items.count) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.featuredPlaylist = model
                    let resultTotal = self?.featuredPlaylist.playlists.items.count ?? 0
                    self?.featuredPlaylistState = (resultTotal < (model.playlists.total)) ? .good : .loadedAll
                }
                break
            case .failure(let error):
                print("getFeaturedPlaylists#Err: \(error.localizedDescription)")
                break
            }
        }
        
    }
    
    public func loadMoreFeaturedPlaylists(){
        guard featuredPlaylistState == FetchState.good else {return}
        self.featuredPlaylistState = .isLoading
        let playlists = featuredPlaylist
        apiCaller.getAllFeaturedPlaylists(limit: playlists.playlists.limit, offset: playlists.playlists.items.count) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.featuredPlaylist.playlists.items.append(contentsOf: model.playlists.items)
                    let resultTotal = self?.featuredPlaylist.playlists.items.count ?? 0
                    self?.featuredPlaylistState = (resultTotal < (model.playlists.total)) ? .good : .loadedAll
                }
                break
            case .failure(let error):
                print("loadMoreFeaturedPlaylists#Err: \(error.localizedDescription)")
                break
            }
        }
    }
    
    //MARK: Recomandation
    @Published var recommendationsState: FetchState = .good
    @Published var recommendations: Recommendations = Recommendations(tracks: [], seeds: [])
    
    private func getRecommendations(){
        guard recommendationsState == FetchState.good else {return}
        self.recommendationsState = .isLoading
        apiCaller.getGenres {[weak self] result in
            switch result {
            case .success(let model):
                let genres = model.genres
                var seeds = Set<String>()
                while seeds.count < 4 {
                    if let seed = genres.randomElement() {
                        if !seeds.contains(seed){
                            seeds.insert(seed)
                        }
                    }
                }
                self?.apiCaller.getRecommendations(genres: seeds) { [weak self] recommendedResult in
                    switch recommendedResult {
                    case .success(let data):
                        DispatchQueue.main.async {
                            self?.recommendations  = data
                            self?.recommendationsState = .loadedAll
                        }
                    case .failure(let error):
                        print("getRecommendations#recommendation: \(error.localizedDescription)")
                        self?.recommendationsState = .error(error.localizedDescription)
                    }
                }
                
            case .failure(let error):
                print("getRecommendations#genres:\(error.localizedDescription)")
                self?.recommendationsState = .error(error.localizedDescription)
            }
        }
    }
}
