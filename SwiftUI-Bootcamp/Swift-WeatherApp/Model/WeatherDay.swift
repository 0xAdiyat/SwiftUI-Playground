//
//  Page.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 14/1/24.
//

import SwiftUI



enum Days: String {
       case sun = "SUN", mon = "MON", wed = "WED", tue = "TUE", thu = "THU", fri = "FRI", sat = "SAT"
   }

struct WeatherDay : Identifiable, Hashable{
    let dayOfWeek: String
    let imageName: String
    let temperature: Int
    var id: UUID = .init()
    
    init(dayOfWeek: Days, imageName: String, temperature: Int) {
        self.dayOfWeek = dayOfWeek.rawValue
        self.imageName = imageName
        self.temperature = temperature
    }
}

