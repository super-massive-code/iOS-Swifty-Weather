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
 */


@MainActor class HomeViewModel: ObservableObject {
    
    @Published var location: String = ""
    @Published var selectedDay: DayDTO = DayDTO.empty()
    @Published var forcast: [DayDTO] = []
    
    init(locationRepo: LocationRepo = LocationRepo(),
         weatherRepo: WeatherRepo = WeatherRepo()) {
        
        weatherRepo.getForcastForPostcode(postCode: locationRepo.usersPostcode()) { dto in
            self.location = dto.location
            self.selectDay(day: dto.forcastDays.first!)
            self.forcast = dto.forcastDays
        }
    }
    
    func selectDay(day: DayDTO) {
        self.selectedDay = day
    }     
}
