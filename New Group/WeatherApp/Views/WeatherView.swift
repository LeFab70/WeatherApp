//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Fabrice Kouonang on 2025-07-09.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment:.leading) {
            Color.gray.opacity(0.1)
            VStack(alignment: .leading) {
                Text("\(weather.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Today :  \(Date().formatted(.dateTime.month().day().hour().minute()))").font(.title2).fontWeight(.light)
                Text("\(weather.main.temp, specifier: "%.1f")°C")
                    .font(.title)
            }
            .padding()
        }
        .background(Color(hue: 0.56, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
       .ignoresSafeArea(.all)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
