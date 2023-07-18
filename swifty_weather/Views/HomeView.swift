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
                    Text(viewModel.location)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.selectedDay.name)
                            .font(.system(size: 25, weight: .ultraLight))
                            .foregroundColor(.white)
                        AsyncImage(url: viewModel.selectedDay.iconUrl) { image in
                            image.resizable()
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(viewModel.selectedDay.tempMax)
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                        HStack(spacing: 0) {
                            Image(systemName: "wind")
                                .foregroundColor(.white)
                            Text(viewModel.selectedDay.windSpeed)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Text(viewModel.selectedDay.description)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                Spacer()
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(viewModel.forcast, id: \.self) { day in
                            //todo: split into own file?
                            let selected = day.hashValue == viewModel.selectedDay.hashValue
                            let topColour = selected ? Color(uiColor: .clear) : Color(uiColor: .orange)
                            let bottomColour = selected ? Color(uiColor: .orange) : Color(uiColor: .clear)
                      
                            VStack(alignment: .leading) {
                                Divider()
                                    .frame(height: 7)
                                    .background(topColour)
                                    .padding(0)
                                Text(day.name)
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                                HStack {
                                    AsyncImage(url: day.iconUrl, scale: 1)
                                    VStack {
                                        Text(day.tempMax)
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                        Text(day.tempMin)
                                            .font(.system(size: 20, weight: .ultraLight))
                                            .foregroundColor(.white)
                                    }
                                }
                                Divider()
                                    .frame(height: 7)
                                    .background(bottomColour)
                                    .padding(0)
                            }.onTapGesture {
                                viewModel.selectDay(day: day)
                            }
                        }
                        .background(.blue)
                    }
                }
                .frame(maxHeight:150)
                .scrollIndicators(.hidden)
                // todo: how to wrap content?
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
