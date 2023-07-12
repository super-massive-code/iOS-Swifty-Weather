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
    let windSpeed: String
    let description: String
    let iconUrl: String
    
    static func empyty() -> WeatherForcastDTO {
        return WeatherForcastDTO(location: "", currentTemp: "", windSpeed: "", description: "", iconUrl: "")
    }
    
    static func fromRemoteApiResponse(response: WeatherResponse) -> WeatherForcastDTO {        
        return WeatherForcastDTO(
            location: response.location.name,
            currentTemp: "\(String(describing: response.current.temp_c))°",
            windSpeed: "\(String(describing: response.current.wind_mph)) mph",
            description: response.current.condition.text,
            iconUrl: "https:\(response.current.condition.icon)"
        )
    }
}
