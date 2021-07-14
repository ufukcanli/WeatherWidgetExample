//
//  Weather.swift
//  WeatherWidgetExtension
//
//  Created by Ufuk Canlı on 14.07.2021.
//

import Foundation

struct Weather: Codable {
    let name: String
    let temperature: Int
    let unit: String
    let description: String
}
