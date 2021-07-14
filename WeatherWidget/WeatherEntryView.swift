//
//  WeatherEntryView.swift
//  WeatherWidgetExtension
//
//  Created by Ufuk Canlı on 14.07.2021.
//

import SwiftUI

struct WeatherEntryView: View {
    let entry: WeatherEntry
    private let baseColor = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    
    var body: some View {
        ZStack {
            baseColor
            
            VStack {
                Text("San Francisco")
                
                Text("\(entry.weather.temperature)\(entry.weather.unit)")
                    .font(.largeTitle)
                
                Text(entry.weather.description)
                    .font(.footnote)
                
                HStack {
                    Image(systemName: getWeatherIcon(condition: entry.weather.description))
                        .padding()
                    
                    Spacer()
                    
                    Text("Updated: \(entry.date.timeOnly())")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray.opacity(0.5))
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    
    func getWeatherIcon(condition: String) -> String {
        let current = condition.lowercased()
        switch current {
        case _ where current.contains("partly sunny"):
            return "cloud.sun.fill"
        case _ where current.contains("cloudy"):
            return "smoke.fill"
        case _ where current.contains("drizzle"):
            return "cloud.bolt.rain.fill"
        case _ where current.contains("clear"):
            return "sun.max.fill"
        default:
            return "eyes.inverse"
        }
    }
}

//struct WeatherEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherEntryView()
//    }
//}
