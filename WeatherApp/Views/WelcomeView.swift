//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Наташа Яковчук on 23.12.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            
            BackgroundImageStyle(image: "cloud.drizzle")
                .padding(.bottom, 500)
                .padding(.leading, 150)
            
            BackgroundImageStyle(image: "cloud")
                .padding(.trailing, 150)
            
            BackgroundImageStyle(image: "sun.max")
                .padding(.leading, 100)
                .padding(.top, 550)
            
            VStack{
                VStack(spacing: 20) {
                    Text("Welcome to the Weather App!")
                        .bold()
                        .font(.system(size: 35))
                        .padding()
                        .shadow(radius: 8)
                    
                    Text("Please share your current location to get weather in your area")
                        .padding()
                        .bold()
                        .foregroundStyle(.black.opacity(0.6))
                    
                } .multilineTextAlignment(.center)
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundStyle(.white)
                .shadow(radius: 6)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WelcomeView()
}
