//
//  JsonLoader.swift
//  swifty_weather
//
//  Created by Carl Taylor on 18/07/2023.
//

import Foundation

struct JsonLoader {
    
    static func loadCannedApiResponse(bundle: Bundle, fileName: String) -> WeatherResponse {
        let decoder = JSONDecoder()
        let url = bundle.url(forResource: fileName, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let weather = try! decoder.decode(WeatherResponse.self, from: data)
        return weather
    }
}
