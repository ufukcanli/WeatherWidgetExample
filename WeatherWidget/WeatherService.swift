//
//  WeatherService.swift
//  WeatherWidgetExtension
//
//  Created by Ufuk Canlı on 14.07.2021.
//

import Foundation

class WeatherService {
    
    let URLString = "https://api.lil.software/weather?latitude=37.7569385&longitude=-122.4733143"
    
    func getWeather(completion: @escaping (Result<[Weather], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: URLString)!) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(self.getWeatherResponse(from: data!)))
        }
        .resume()
    }
    
    private func getWeatherResponse(from data: Data) -> [Weather] {
        let weatherData = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        if let weatherData = weatherData { return weatherData.forecast }
        return [Weather(name: "Error", temperature: 0, unit: "", description: "Error")]
    }
    
}
