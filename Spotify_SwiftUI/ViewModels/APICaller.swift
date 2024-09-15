//
//  APICaller.swift
//  Spotify_SwiftUI
//
//  Created by DND on 15/09/2024.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private init(){
        
    }
    
    struct Constants {
        static let baseURL = "https://api.spotify.com/v1"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    public func getNewReleaseAlbums(offset: Int, limit: Int, completion: @escaping (Result<NewReleases,Error>)-> Void){
        
    }
    
    
    private func createRequest(with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) ->Void){
        
    }
}
