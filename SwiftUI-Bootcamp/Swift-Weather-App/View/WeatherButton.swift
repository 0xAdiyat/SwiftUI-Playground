//
//  WeatherButton.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 14/1/24.
//

import SwiftUI


struct WeatherButton: View {
    var title: String
    var backgroundColor: Color?
    var textColor: Color?
    
    init(_ title: String, backgroundColor: Color? = nil, textColor: Color? = nil) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor ?? .white)
            .cornerRadius(8)
            .foregroundStyle(textColor ?? .black)
    }
}

