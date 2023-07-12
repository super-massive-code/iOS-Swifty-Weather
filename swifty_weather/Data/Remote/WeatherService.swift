//
//  WeatherService.swift
//  swifty_weather
//
//  Created by Carl Taylor on 10/07/2023.
//

import Foundation

class WeatherService {
    
    private let baseUrl = "https://api.weatherapi.com/v1/"
    
    func getForcast(postcode: String, completion: @escaping (WeatherResponse) -> ()) {
        let urlComponents = NSURLComponents(string: baseUrl + "forecast.json")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: Secrets.weatherApiKey),
            URLQueryItem(name: "days", value: "1"),
            URLQueryItem(name: "aqi", value: "no"),
            URLQueryItem(name: "alerts", value: "no"),
            URLQueryItem(name: "q", value: postcode)
        ]
        let request = URLRequest(url: urlComponents!.url!)    
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            //TODO: handle error
            if let data = data {
                let weatherData = try! JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(weatherData)
            }
        }).resume()    
    }
}
