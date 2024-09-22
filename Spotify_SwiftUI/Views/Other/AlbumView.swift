//
//  AlbumDetail.swift
//  Spotify_SwiftUI
//
//  Created by DND on 18/9/24.
//

import SwiftUI

struct AlbumView: View {
    
    var album: Album
    var gradient: LinearGradient = LinearGradient(
        colors: [Helper.getRadiomColor(),Helper.getRadiomColor()],
        startPoint: .top,
        endPoint: .bottom)
    
    @ObservedObject var viewModel: AlbumDetailViewModel
    
    init(album: Album) {
        self.album = album
        self.viewModel = AlbumDetailViewModel(albumId: album.id)
    }
    var body: some View {
        ZStack{
            gradient.ignoresSafeArea()
            Color.black.ignoresSafeArea().opacity(0.7)
            ScrollView {
                VStack(alignment: .center) {
                    CoverHeadView(album: album)
                        .padding(0)
                        .padding(.top, 10)
                        .listRowSeparator(.hidden)
                    //TODO: Track list view
                }
            }
        }
    }
}

#Preview {
    AlbumView(
        album: Album(albumType: "", artists: [], availableMarkets: [], externalUrls: ExternalUrls(spotify: ""), href: "", id: "", images: [], name: "", releaseDate: "", releaseDatePrecision: "", totalTracks: 0, type: AlbumType(rawValue: ""), uri: "")
    )
}
