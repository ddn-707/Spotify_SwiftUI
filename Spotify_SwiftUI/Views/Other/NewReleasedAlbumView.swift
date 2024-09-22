//
//  NewReleasedAlbumView.swift
//  Spotify_SwiftUI
//
//  Created by DND on 14/09/2024.
//

import SwiftUI

struct NewReleasedAlbumView: View {
    @ObservedObject var viewModel: AlbumViewModel
    
    static let itemWidth = Double((Helper.screenWidth - 80) / 2.5)
    
    let rows = [
        GridItem(.fixed(itemWidth)),
        GridItem(.fixed(itemWidth)),
        GridItem(.fixed(itemWidth))
    ]
    var body: some View {
        VStack(alignment: .leading) {
            newReleaseAlbumItem
            ScrollView (.horizontal, showsIndicators: false){
                LazyHGrid(rows: rows) {
                    ForEach(viewModel.newReleasesAlbums.items, id: \.self.id) { 
                        album in
                        newReleaseAlbumCell(album: album)
                    }
                    ListPlacehoderRowView(state: viewModel.newReleaseState) {
                        viewModel.loadMoreNewReleases()
                    }
                }
            }
        }
    }
    
    private var newReleaseAlbumItem: some View {
        Text("New Release Albums")
            .font(.title)
            .bold()
            .padding(.top,5)
            .padding(.horizontal)
    }
    
    private func newReleaseAlbumCell(album: Album) -> some View {
        let albumString = album.images.first?.url ?? ""
        return ZStack{
            Color.gray.opacity(0.2)
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: albumString)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: Helper.screenWidth / 3)

                VStack(alignment: .leading, spacing: 7) {
                    Text(album.name)
                        .font(.title2)
                        .bold()
                    Text(album.artists.first?.name ?? "_")
                        .font(.title3)
                    Text("tracks: \(album.totalTracks)")
                        .font(.subheadline)
                }.padding(.vertical, 10)
            }
            .frame(width: Helper.screenWidth - 80, alignment: .leading)
        }
        .frame(height: (Helper.screenWidth - 80)/2.5, alignment: .center)
        .foregroundColor(.primary)
    }
}

#Preview {
    NewReleasedAlbumView(viewModel: AlbumViewModel())
}
