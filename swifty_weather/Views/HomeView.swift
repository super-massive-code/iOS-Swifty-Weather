//
//  ContentView.swift
//  swifty_weather
//
//  Created by Carl Taylor on 10/07/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack() {
                    Text(viewModel.dto.location)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    VStack {
                        Text("Next Hour")
                            .font(.system(size: 25, weight: .ultraLight))
                            .foregroundColor(.white)
                        AsyncImage(url: URL(string: viewModel.dto.iconUrl), scale: 1)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(viewModel.dto.currentTemp)
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                        HStack(spacing: 0) {
                            Image(systemName: "wind")
                            .foregroundColor(.white)
                            Text(viewModel.dto.windSpeed)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Text(viewModel.dto.description)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
