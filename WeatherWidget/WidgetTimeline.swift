//
//  WidgetTimeline.swift
//  WeatherWidgetExtension
//
//  Created by Ufuk Canlı on 14.07.2021.
//

import SwiftUI
import WidgetKit

struct WeatherTimeline: TimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(
            date: Date(),
            weather: Weather(
                name: "SF",
                temperature: 67,
                unit: "F",
                description: "Cloudy"
            )
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        let entry = WeatherEntry(
            date: Date(),
            weather: Weather(
                name: "SF",
                temperature: 67,
                unit: "F",
                description: "Cloudy"
            )
        )
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .second, value: 60, to: currentDate)!
        
        WeatherService().getWeather { result in
            var weather: Weather
            
            switch result {
            case .success(let fetchedData):
                weather = fetchedData.first!
            case .failure(let error):
                weather = Weather(
                    name: "SF",
                    temperature: 0,
                    unit: "F",
                    description: "Error getting weather info"
                )
                print(error)
            }
            
            let entry = WeatherEntry(date: currentDate, weather: weather)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            
            completion(timeline)
        }
    }
        
}
