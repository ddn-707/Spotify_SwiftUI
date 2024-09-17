//
//  HomeView.swift
//  Spotify_SwiftUI
//
//  Created by DND on 13/09/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var albumViewModel = AlbumViewModel()
    var body: some View {
        NavigationView {
            bodyView
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "gear")
                    }
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationBarHidden(false)
                .navigationTitle("Spotify")
        }
    }
    
    private var bodyView: some View {
        ScrollView {
            VStack {
                NewReleasedAlbumView(viewModel: albumViewModel)
                FeaturedPlaylistView(viewModel: albumViewModel)
            }
        }
    }
}

#Preview {
    HomeView()
}
