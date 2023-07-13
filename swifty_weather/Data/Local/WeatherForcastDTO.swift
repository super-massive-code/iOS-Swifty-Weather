//
//  WeatherForcastDTO.swift
//  swifty_weather
//
//  Created by Carl Taylor on 12/07/2023.
//

import Foundation

struct DayDTO: Hashable {
    let name: String
    let tempMax: String
    let tempMin: String
    let windSpeed: String
    let description: String
    let iconUrl: URL?
    
    static func empty() -> DayDTO {
        DayDTO(name: "", tempMax: "", tempMin: "", windSpeed: "", description: "", iconUrl: nil)
    }
}

struct WeatherForcastDTO {
    let location: String
    let forcastDays: [DayDTO]
}
