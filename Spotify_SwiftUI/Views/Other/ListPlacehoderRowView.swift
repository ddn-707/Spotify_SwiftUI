//
//  ListPlacehoderRowView.swift
//  Spotify_SwiftUI
//
//  Created by DND on 16/9/24.
//

import SwiftUI

struct ListPlacehoderRowView: View {
    let state: FetchState
    let loadMore: () -> Void
    var body: some View {
        switch state {
        case .good:
            Color.clear.onAppear{
                loadMore()
            }
        case .isLoading:
            ProgressView()
                .progressViewStyle(.circular)
                .frame(width: .infinity)
        case .loadedAll:
            EmptyView()
        case .noResult:
            Text("Sorry Could not find anything.")
                .foregroundColor(.gray)
        case .error(let message):
            Text(message)
                .foregroundColor(.pink)

        }
    }
}

