//
//  ContentView.swift
//  WeatherApp
//
//  Created by Наташа Яковчук on 22.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your current coordinates are: \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(.darkBlue)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
