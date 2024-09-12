//
//  WelcomeView.swift
//  Spotify_SwiftUI
//
//  Created by DND on 12/09/2024.
//

import SwiftUI

struct WelcomeView: View {
    let screenWidth = UIScreen.main.bounds.size.width
    var body: some View {
        ZStack{
            Image("albumCover")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            Color(Color.black)
                .opacity(0.5)
                .ignoresSafeArea()
            VStack{
                titleView
                Spacer()
                logoView
                Spacer()
                buttonView
            }
        }
    }
    
    private var titleView: some View {
        Text("Spotify")
            .font(.largeTitle)
            .foregroundColor(.white)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .frame(
                width: screenWidth - 40,
                alignment: .leading)
    }
    
    private var logoView: some View {
        VStack{
            Image("logo")
                .resizable()
                .frame(
                    width: screenWidth / 3,
                    height: screenWidth / 3,
                    alignment: .center)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            Text("Listen to Millions\nof Songs on\nthe go")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.system(size: 32))
                .multilineTextAlignment(.center)
        }
    }
    
    private var buttonView: some View {
        Text("Signin With Spotify")
            .font(.body)
            .frame(
                width: screenWidth - 80,
                alignment: .center)
            .foregroundColor(.black)
            .padding()
            .background(.white)
            .cornerRadius(25)
    }
}

#Preview {
    WelcomeView()
}
