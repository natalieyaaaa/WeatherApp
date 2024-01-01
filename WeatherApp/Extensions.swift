//
//  Extensions.swift
//  WeatherApp
//
//  Created by Наташа Яковчук on 24.12.2023.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
//    func CornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape(RoundedCorner(radius: radius, corners: corners))
//    }
//}

//struct RoundedCorner: Shape {
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//    
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: (CGSize(width: radius, height: radius)))
//        return Path(path.cgPath)
//    }

    func Background() -> some View {
        Color(.background)
           .ignoresSafeArea()
    }
    
    func BackgroundImageStyle(image: String) -> some View {
        Image(systemName: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            .foregroundStyle(.blueAccent)
    }
    
    func SmallRectanglesStyle(image: String) -> some View {
        Image(systemName: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .foregroundStyle(.violet)
            .shadow(color: .black.opacity(0.2), radius: 5)
            .background(RoundedRectangle(cornerRadius: 10)
            .frame(width: 60, height: 60)
            .shadow(color: .white.opacity(0.9), radius: 10, x: -10, y: -10)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            .foregroundStyle(Color(.background)))
            .padding()
    }

}
