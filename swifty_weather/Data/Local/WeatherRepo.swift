//
//  WeatherRepo.swift
//  swifty_weather
//
//  Created by Carl Taylor on 11/07/2023.
//

import Foundation

class WeatherRepo {
    
    private var remoteService: WeatherService
    
    init(service: WeatherService = WeatherService()) {
        remoteService = service
    }
    
    //TODO: cache results
    func getForcastForPostcode(postCode: String, callback: @escaping (_ result: WeatherForcastDTO) -> (Void)) {
        if (Secrets.weatherApiKey.isEmpty) {
            callback(WeatherForcastDTO.fromRemoteApiResponse(response: loadTestResponse()))
        } else {
            callback(WeatherForcastDTO.fromRemoteApiResponse(response: loadTestResponse()))
            remoteService.getForcast(postcode: postCode) { weatherResponse in
                callback(WeatherForcastDTO.fromRemoteApiResponse(response: weatherResponse))
            }
        }
    }
    
    private func loadTestResponse() -> WeatherResponse {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: "forecast", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let weather = try! decoder.decode(WeatherResponse.self, from: data)
        return weather
    }
}
