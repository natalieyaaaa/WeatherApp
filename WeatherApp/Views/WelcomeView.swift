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
        VStack{ 
            VStack(spacing: 20) {
                Text("Welcome to the Weather App!")
                    .bold()
                    .font(.title)
                    .padding()
                
                Text("Please share your current location to get weather in your area")
                    .padding()
            } .multilineTextAlignment(.center)
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            } 
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
