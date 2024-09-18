//
//  RecommededView.swift
//  Spotify_SwiftUI
//
//  Created by ominext on 18/9/24.
//

import SwiftUI

struct RecommededView: View {
    @ObservedObject var viewModel: AlbumViewModel
    var body: some View {
        VStack(alignment: .leading){
            recommendedTitle
            ScrollView (.vertical, showsIndicators: false){
                LazyVStack {
                    ForEach(viewModel.recommendations.tracks, id: \.self.id) {
                        recommendedCell(track: $0)
                    }
                }
            }
        }
    }
    
    private var recommendedTitle: some View {
           Text("Recommended Tracks")
               .font(.title)
               .bold()
               .padding(.top, 5)
               .padding(.horizontal)
       }
    private func recommendedCell(track: Track)-> some View {
        let url = track.album?.images.first?.url ?? ""
        return ZStack() {
            Color.gray.opacity(0.2)
            HStack(alignment: .top){
                AsyncImage(url: URL(string: url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                        .frame(width: .infinity, height: .infinity)
                }
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5.0)
                .frame(width: Helper.screenWidth/5.3)
                .padding(.top,5)
                VStack(alignment: .leading, spacing: 10){
                    Text(track.name)
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text(track.artists?.first?.name ?? "")
                        .font(.title3)
                }
            }
            .padding(.horizontal, 5)
            .frame(width: Helper.screenWidth, alignment: .leading)
        }
        .frame(height: (Helper.screenWidth / 5) ,alignment: .center)
    }
}

#Preview {
    RecommededView(viewModel: AlbumViewModel())
}
