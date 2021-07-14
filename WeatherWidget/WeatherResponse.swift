//
//  WeatherResponse.swift
//  WeatherWidgetExtension
//
//  Created by Ufuk Canlı on 14.07.2021.
//

import Foundation

struct WeatherResponse: Codable {
    let forecast: [Weather]
}
