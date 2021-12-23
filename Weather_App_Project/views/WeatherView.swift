//
//  WeatherView.swift
//  Weather_App_Project
//
//  Created by Vaibhav Kaura on 22/12/21.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack{
                VStack{
                    Text(weather.name)
                        .bold().font(.title)
//
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                            .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        
                        VStack(spacing: 20){
                            if (weather.weather[0].main == "Mist"){
                                Image(systemName: "cloud.fog.fill")
                                    .font(.system(size: 40))
                            }
                            
                            else if(weather.weather[0].main == "Rain"){
                                Image(systemName: "cloud.rain.fill")
                                    .font(.system(size: 40))
                            }
                            else if(weather.weather[0].main == "Drizzle"){
                                Image(systemName: "cloud.drizzle.fill")
                                    .font(.system(size: 40))
                            }
                            else if(weather.weather[0].main == "Thunderstorm"){
                                Image(systemName: "cloud.bolt.rain")
                                    .font(.system(size: 40))
                            }
                            else if(weather.weather[0].main == "Snow"){
                                Image(systemName: "cloud.snow.fill")
                                    .font(.system(size: 40))
                            }
                            else if(weather.weather[0].main == "Clouds"){
                                Image(systemName: "cloud.fill")
                                    .font(.system(size: 40))
                            }
                            else if(weather.weather[0].main == "Haze"){
                                Image(systemName: "sun.haze.fill")
                                    .font(.system(size: 40))
                            }
                            else{
                                Image(systemName: "sun.max.fill")
                                    .font(.system(size: 40))
                            }
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    }
                placeholder: {
                    ProgressView()
                }
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer.snowflake", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.sun.fill", name: "Max Temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.606, saturation: 0.487, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.606, saturation: 0.487, brightness: 0.354))
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
