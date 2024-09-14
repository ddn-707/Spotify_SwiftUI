//
//  TabBarView.swift
//  Spotify_SwiftUI
//
//  Created by DND on 13/09/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("home", systemImage: "house")
            }
            SearchView().tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            LibraryView().tabItem {
                Label("Library", systemImage: "music.note.list")
            }
        }
    }
}

#Preview {
    TabBarView()
}
