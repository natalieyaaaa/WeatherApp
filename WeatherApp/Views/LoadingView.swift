//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Наташа Яковчук on 23.12.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Background()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    LoadingView()
}
