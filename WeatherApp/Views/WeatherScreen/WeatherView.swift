//
//  NewWeatherView.swift
//  WeatherApp
//
//  Created by Наташа Яковчук on 25.12.2023.
//

import Foundation
import SwiftUI

struct NewWeatherView: View {
    
    var weather: ResponseBody
    @StateObject var wm = WeatherManager()
    
    var body: some View {
        ZStack {
            
            Background()
            BackgroundImageStyle(image: wm.weatherType)
                .padding(.bottom, 600)
                .padding(.leading, 200)
            
            BackgroundImageStyle(image: wm.weatherType)
                .padding(.trailing, 150)
                .padding(.bottom, 200)
            
            VStack(spacing: 0){
                
                HStack {
                    
                    SmallRectanglesStyle(image: "list.bullet")
                    
                    Spacer()
                    
                    Text("Today")
                        .foregroundStyle(.darkBlue)
                        .bold()
                        .font(.system(size: 29))
                        .fontDesign(.rounded)
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    SmallRectanglesStyle(image: "moon")
                    
                    

                }.padding()
                
                Text("\(Date.now, format: .dateTime.month(.wide).day()), \(Date.now, format: .dateTime.weekday(.wide))")
                    .font(.system(size: 19))
                    .fontWeight(.light)
                    .foregroundStyle(.darkBlue)
                    .fontDesign(.rounded)

                ZStack {
                    Circle()
                        .frame(width: 200)
                        .foregroundStyle(Color.background)
                        .shadow(color: .white.opacity(0.8), radius: 10, x: -10, y: -10)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                    
                    VStack {
                        Image(systemName: wm.weatherType)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                            .foregroundStyle(.violet)
                        
                        Text("\(weather.main.temp.roundDouble())°C")
                            .font(.system(size: 45))
                            .bold()
                            .foregroundStyle(.darkBlue)
                    }

                }.padding()
                
                Text(weather.weather[0].main)
                    .foregroundStyle(.darkBlue)
                    .fontDesign(.rounded)
                    .font(.system(size: 29))
                    .bold()
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 270, height: 7)
                    .foregroundStyle(.white.opacity(0.9))
                    .padding()
                
                Spacer()

            }
            
        } .onAppear() {
            
            if weather.weather[0].main == "Rain" {
                wm.weatherType = "cloud.rain"
            } else if weather.weather[0].main == "Thunderstorm" {
                wm.weatherType = "cloud.bolt"
            } else if weather.weather[0].main == "Drizzle" {
                wm.weatherType = "cloud.drizzle"
            } else if weather.weather[0].main == "Snow" {
                wm.weatherType = "cloud.snow"
            } else if weather.weather[0].main == "Clear" {
                wm.weatherType = "sun.max"
            } else if weather.weather[0].main == "Clouds" {
                wm.weatherType = "cloud"
            }
        }
        
    }
}
#Preview {
    NewWeatherView(weather: previewWeather)
        .environmentObject(WeatherManager())

}
