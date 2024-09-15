//
//  AuthManager.swift
//  Spotify_SwiftUI
//
//  Created by DND on 12/09/2024.
//

import Foundation
import SwiftUI

final class AuthManager: ObservableObject {
    static let shared = AuthManager()
    
    private var refreshingToken = false
    
    private init(){
        let accessToken = UserDefaults.standard.string(forKey: Constants.ud_accessToken)
        _isSignedIn = Published(initialValue: accessToken != nil)
    }
    
    @Published var isSignedIn: Bool
    @AppStorage(Constants.ud_accessToken) private var accessToken: String? {
        didSet {
            isSignedIn = accessToken != nil
        }
    }
    @AppStorage(Constants.ud_refreshToken) private var refreshToken: String?
    @AppStorage(Constants.ud_expirationDate) private var tokenExpirationDate: Date?
    
    public var signInURL: URL? {
        let base = "https://accounts.spotify.com/authorize"
        let urlString = "\(base)?response_type=code&client_id=\(Constants.getClientID())&scope=\(Constants.scopes)&redirect_uri=\(Constants.redirectURI)&show_dialog=TRUE"
        return URL(string: urlString)
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping (Bool)-> Void){
        guard let url = URL(string: Constants.tokenAPIURL) else {return}
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let basicToken = Constants.getClientID() + ":" + Constants.getClientSecret()
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Err!: Failure to get base64String")
            completion(false)
            return
        }
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        request.httpBody = components.query?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, URLResponse, error in
            guard let data = data, error == nil else {
                print("Error: data error")
                completion(false)
                return
            }
            do {
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                self?.cacheToken(result: result)
                print("result: \(result)")
                completion(true)
            }catch {
                print("Error: \(error.localizedDescription)")
                completion(false)
            }
        }
        task.resume()
    }
    
    public func cacheToken(result: AuthResponse){
        DispatchQueue.main.async {
            withAnimation {
                self.accessToken = result.access_token
                if let refresh_token = result.refresh_token {
                    self.refreshToken = refresh_token
                }
                self.tokenExpirationDate = Date().addingTimeInterval(TimeInterval(result.expires_in))
            }
        }
    }
    
    // TODO: HANDLE INVALID TOKEN
    public func withValidToken(completion: @escaping(String) -> Void ){
        guard !refreshingToken else {
            onRefreshBlock.append(completion)
            return
        }
        
        if shouldRefreshToken {
            
        }
    }
    
    private var onRefreshBlock = [((String)-> Void)]()
    
    private var shouldRefreshToken: Bool {
        guard let tokenExpirationDate = tokenExpirationDate else {
            return false
        }
        let now = Date()
        let seconds: TimeInterval = 300
        return now.addingTimeInterval(seconds) >= tokenExpirationDate
    }
}
