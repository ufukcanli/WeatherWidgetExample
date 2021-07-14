//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by Ufuk Canlı on 14.07.2021.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidget: Widget {
    private var kind: String = "WeatherWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: WeatherTimeline()
        ) { entry in
            WeatherEntryView(entry: entry)
        }
        .configurationDisplayName("SF Weather Widget")
        .description("This widget displays current weather for SF")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
