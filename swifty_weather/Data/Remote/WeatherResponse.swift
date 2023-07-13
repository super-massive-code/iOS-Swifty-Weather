//
//  WeatherResponse.swift
//  swifty_weather
//
//  Created by Carl Taylor on 10/07/2023.
//

import Foundation

struct WeatherResponse: Decodable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

struct Location: Decodable {
    let name: String
}

struct Current: Decodable {
    let last_updated_epoch: Int
    let temp_c: Float
    let wind_mph: Float
    let condition: Condition
}

struct Condition: Decodable {
    let text: String
    let icon: String
}

struct Forecast: Decodable {
    let forecastday: [ForcastDay]
}

struct ForcastDay: Decodable {
    let date_epoch: Int
    let day: Day
}

struct Day: Decodable {
    let maxtemp_c: Float
    let mintemp_c: Float
    let maxwind_mph: Float
    let condition: Condition
}
