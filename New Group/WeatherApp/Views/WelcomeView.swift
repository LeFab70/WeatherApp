//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Fabrice Kouonang on 2025-07-08.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Text("Weather App")
                        .font(.title.bold())
                    Image(systemName: "cloud.sun.rain.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.orange)
                }
               
                Text("Find your current weather")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
          
            LocationButton(.shareCurrentLocation, action: locationManager.requestLocation)
                .cornerRadius(10)
                .symbolVariant(.fill)
                .foregroundStyle(.white)
                .font(.headline.bold())
            //Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
        .environmentObject(LocationManager())
}
