//
//  NewReleasedAlbumView.swift
//  Spotify_SwiftUI
//
//  Created by DND on 14/09/2024.
//

import SwiftUI
// TODO: map data and handle logic
struct NewReleasedAlbumView: View {
    @ObservedObject var viewModel: AlbumViewModel
    
    static let itemWidth = (Helper.screenWidth - 80) / 2.5
    
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
                    ForEach(viewModel.newReleasesAlbums.items, id: \.self.id) { album in
                        Text("hello")
                    }
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
    //TODO: build UI 
    private func newReleaseAlbumCell() -> some View {
        return ZStack{
            HStack(alignment: .top) {
                Image(systemName: "people")
                AsyncImage(
                    url: URL(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Frewarding.html&psig=AOvVaw20yZz_SV8RELSV6YOFGKE5&ust=1726417868694000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCIjM3_DtwogDFQAAAAAdAAAAABAK")
                ) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: Helper.screenWidth / 3)

                VStack(alignment: .leading, spacing: 7) {
                    Text("Title")
                        .font(.title2)
                        .bold()
                    Text("artist")
                        .font(.title3)
                    Text("tracks: 8")
                        .font(.subheadline)
                }.padding(.vertical, 10)
            }
        }
    }
}

#Preview {
    NewReleasedAlbumView()
}
