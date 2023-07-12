//
//  HomeViewModel.swift
//  swifty_weather
//
//  Created by Carl Taylor on 11/07/2023.
//

import Foundation

/**
 TODO:
 Share weather?
 Tab's at bottom with forcast - selectable to show detail?
 */


@MainActor class HomeViewModel: ObservableObject {
    
    @Published var dto: WeatherForcastDTO = WeatherForcastDTO.empyty()
    
    init(locationRepo: LocationRepo = LocationRepo(),
         weatherRepo: WeatherRepo = WeatherRepo()) {
        
        weatherRepo.getForcastForPostcode(postCode: locationRepo.usersPostcode()) { dto in
            self.dto = dto
        }
    }    
}
