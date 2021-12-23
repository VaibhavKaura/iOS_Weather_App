//
//  ContentView.swift
//  Weather_App_Project
//
//  Created by Vaibhav Kaura on 22/12/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                }
                else{
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading{
                   LoadingView()
                }
                else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
           .background(Color(hue: 0.606, saturation: 0.487, brightness: 0.354))
           .foregroundColor(.white)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
