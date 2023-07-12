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
}

struct Location: Decodable {
    let name: String
    let region: String
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
