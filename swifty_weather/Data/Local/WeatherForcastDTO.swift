//
//  WeatherForcastDTO.swift
//  swifty_weather
//
//  Created by Carl Taylor on 12/07/2023.
//

import Foundation

struct WeatherForcastDTO {
    let location: String
    let currentTemp: String
    
    static func fromRemoteApiResponse(response: WeatherResponse) -> WeatherForcastDTO {
        
        let location: String
        if (response.location.name == response.location.region) {
            location = response.location.name
        } else {
           location = "\(response.location.name), \(response.location.region)"
        }
        
        return WeatherForcastDTO(
            location: location,
            currentTemp: String(describing: response.current.temp_c)
        )
    }
}
