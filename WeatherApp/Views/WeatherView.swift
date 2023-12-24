//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Наташа Яковчук on 24.12.2023.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack(spacing: 20) {
                                Image(systemName: "sun.max")
                                    .font(.system(size: 40))
                                
                                Text(weather.weather[0].main)
                            }
                            .frame(maxWidth: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .bold()
                            .padding()
                        }
                        
                        Spacer()
                            .frame(height: 80)
                        
                        AsyncImage(url: URL(string: "https://pngimg.com/d/city_PNG4.png")){ image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 390)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Spacer()
                    }
            }
            .padding()
        }
        .background(.darkBlue)
        .preferredColorScheme(.dark)
    }
}
#Preview {
    WeatherView(weather: previewWeather)
}
