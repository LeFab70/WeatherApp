//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Fabrice Kouonang on 2025-07-08.
//

import Foundation
import CoreLocation
class WeatherManager {
    func getCurrentWeather(lation: CLLocationDegrees, longitude: CLLocationDegrees)async throws->ResponseBody{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lation)&lon=\(longitude)&appid=\("4d2a8d21969c9be9ba0e8291538f2eb2")&units=metric") else {
            throw NSError(domain: "Invalid URL", code: 100, userInfo: nil)
        }
        let urlRequest = URLRequest(url: url)
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)? .statusCode==200  else {
            throw NSError(domain: "Invalid response", code: 501, userInfo: nil)
        }
        let decodedData=try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
       
    }
}
struct ResponseBody: Decodable {
    var coord:CoordinatesResponse
    var weather:[WeatherResponse]
    var main:MainResponse
    var name:String
    var wind:WindResponse
    
    struct CoordinatesResponse: Decodable {
        var lon:Double
        var lat:Double
    }
    
    struct WeatherResponse: Decodable {
        var id:Double
        var main:String
        var description:String
        var icon:String
    }
    struct MainResponse: Decodable {
        var temp:Double
        var feels_like:Double
        var temp_min:Double
        var temp_max:Double
        var pressure:Double
        var humidity:Double
    }
    struct WindResponse: Decodable {
        var speed:Double
        var deg:Double
    }
}
