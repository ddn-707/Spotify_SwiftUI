//
//  FeaturedPlaylistView.swift
//  Spotify_SwiftUI
//
//  Created by ominext on 17/9/24.
//

import SwiftUI

struct FeaturedPlaylistView: View {
    @ObservedObject var viewModel: AlbumViewModel
    
    static let columnSize = Helper.screenWidth/2
    
    let rows = [
        GridItem(.fixed(columnSize)),
        GridItem(.fixed(columnSize))
    ]
    var body: some View {
        VStack(alignment: .leading){
            featuredPlaylistTitle
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 40) {
                    ForEach(viewModel.featuredPlaylist.playlists.items, id: \.self.id) { play in
                        featuredPlaylistCell(play: play)
                    }
                    ListPlacehoderRowView(state: viewModel.featuredPlaylistState) {
                        viewModel.loadMoreFeaturedPlaylists()
                    }
                }
            }
        }
    }
    
    private var featuredPlaylistTitle: some View {
        Text("Featured Playlist")
            .font(.title)
            .bold()
            .padding(.top, 5)
            .padding(.horizontal)
    }
    
    private func featuredPlaylistCell(play:PlaylistsItem) -> some View {
        let imageUrl = play.images.first?.url ?? ""
        return VStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: Helper.screenWidth/3)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5)
            Text(play.name)
                .font(.title3)
                .bold()
                .padding(.top,5)
            Text(play.owner.name ?? "")
                .font(.subheadline)
        }
        .frame(height: Helper.screenWidth/2.2, alignment: .leading)
    }
}

#Preview {
    FeaturedPlaylistView(
        viewModel: AlbumViewModel()
    )
}
