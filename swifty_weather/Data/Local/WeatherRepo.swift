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
            callback(WeatherForecastDTOFactory().fromRemoteApiResponse(response: JsonLoader.loadCannedApiResponse(bundle: Bundle.main, fileName: "forecast")))
        } else {
            remoteService.getForcast(postcode: postCode) { weatherResponse in
                callback(WeatherForecastDTOFactory().fromRemoteApiResponse(response: weatherResponse))
            }
        }
    }
}
