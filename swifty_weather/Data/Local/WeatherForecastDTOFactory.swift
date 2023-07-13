//
//  WeatherForecastDTOFactory.swift
//  swifty_weather
//
//  Created by Carl Taylor on 13/07/2023.
//

import Foundation

class WeatherForecastDTOFactory {
    
    func fromRemoteApiResponse(response: WeatherResponse) -> WeatherForcastDTO {
        WeatherForcastDTO(
            location: response.location.name,
            forcastDays: response.forecast.forecastday.map { forecastDay in
                DayDTO(name: dayFromEpoch(epoch: forecastDay.date_epoch),
                       tempMax: transformTemp(temp: forecastDay.day.maxtemp_c),
                       tempMin: transformTemp(temp: forecastDay.day.mintemp_c),
                       windSpeed: transformWind(wind: forecastDay.day.maxwind_mph),
                       description: forecastDay.day.condition.text,
                       iconUrl: transformIconUrl(url: forecastDay.day.condition.icon))
            }
        )
    }
        
    private func transformTemp(temp: Float) -> String {
        "\(String(describing: temp))°"
    }
    
    private func transformWind(wind: Float) -> String {
        "\(String(describing: wind)) mph"
    }
    
    private func transformIconUrl(url: String) -> URL? {
        URL(string: "https:\(url)")
    }
    
    private func dayFromEpoch(epoch: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(epoch))
        if (Calendar.current.isDateInToday(date)) {
            return "Today"
        }
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        return df.string(for: date)!
    }
}
