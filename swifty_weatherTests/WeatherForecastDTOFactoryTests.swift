//
//  WeatherForecastDTOFactoryTests.swift
//  swifty_weatherTests
//
//  Created by Carl Taylor on 18/07/2023.
//

import XCTest

final class WeatherForecastDTOFactoryTests: XCTestCase {
    
    func when_given_complete_7_day_then_parses_correctly() {
        let result =  WeatherForecastDTOFactory().fromRemoteApiResponse(response: loadJsonFixture(fileName: "7_day_complete"))
        let firstDay = result.forcastDays.first!
        
        XCTAssertTrue(result.location == "Doncaster")
        XCTAssertTrue(result.forcastDays.count == 7)
        XCTAssertTrue(firstDay.description == "Partly Cloudy")
        XCTAssertTrue(firstDay.tempMax == "21.6°")
        XCTAssertTrue(firstDay.tempMin == "12.7°")
        XCTAssertTrue(UIApplication.shared.canOpenURL(firstDay.iconUrl!))
        XCTAssertTrue(firstDay.windSpeed == "12.8 mph")
    }
    
    func loadJsonFixture(fileName: String) -> WeatherResponse {
        return JsonLoader.loadCannedApiResponse(bundle: Bundle(for: type(of: self)), fileName: fileName)
    }
}
