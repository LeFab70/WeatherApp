//
//  ContentView.swift
//  WeatherApp
//
//  Created by Fabrice Kouonang on 2025-07-08.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    var weatherManager: WeatherManager=WeatherManager()
    @State var weather:ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                   WeatherView(weather: weather)
                }
                else
                    {
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.getCurrentWeather(lation: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error fetching weather: \(error)")
                            }
                        }
                }
                Text("Your current location is:\(location.latitude), \(location.longitude)")
            }
            else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView()
                         .environmentObject(locationManager)
                }
            }
          
        }
        .background(Color(hue: 0.56, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
        //.ignoresSafeArea(edges: .all)
    }
}

#Preview {
    ContentView()
}
