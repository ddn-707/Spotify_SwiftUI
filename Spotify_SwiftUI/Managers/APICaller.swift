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
        let stringURL = Constants.baseURL + "/browse/new-releases?limit=\(limit)&offset=\(offset)"
        createRequest(with: URL(string: stringURL), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, URLResponse, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(NewReleases.self, from: data)
                    completion(.success(result))
                }catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getAllFeaturedPlaylists(limit: Int, offset: Int, completion: @escaping (Result<FeaturedPlaylist,Error>)->Void){
        let urlString = Constants.baseURL + "/browse/featured-playlists?limit=\(limit)&offset=\(offset)"
        print("url: \(urlString)")
        createRequest(with: URL(string: urlString), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
                guard let data = data , error == nil else {return}
                do {
                    let result = try JSONDecoder().decode(FeaturedPlaylist.self, from: data)
                    completion(.success(result))
                } catch {
                    print("getAllFeaturedPlaylists#Err: \(error)")
                    completion(.failure(APIError.failedToGetData))
                }
            }
            task.resume()
        }
    }
    
    public func getGenres(completion: @escaping(Result<RecommendedGenresResponse,Error>) -> Void) {
        let urlString = Constants.baseURL + "/recommendations/available-genre-seeds"
        createRequest(with: URL(string: urlString), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(RecommendedGenresResponse.self, from: data)
                    completion(.success(result))
                } catch {
                    print("getGenres#Err: \(error)")
                    completion(.failure(APIError.failedToGetData))
                }
            }
            task.resume()
        }
    }
    
    public func getRecommendations(genres: Set<String>, completion: @escaping(Result<Recommendations, Error>) -> Void) {
        let seeds = genres.joined(separator: ",")
        createRequest(with: URL(string: Constants.baseURL + "/recommendations?limit=40&seed_genres=\(seeds)"),
                      type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(Recommendations.self, from: data)
                    completion(.success(result))
                }
                catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }

    
    private func createRequest(with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) ->Void){
        AuthManager.shared.withValidToken { token in
            print("token: \(token)")
            guard let apiURL = url else {return}
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
    }
}
