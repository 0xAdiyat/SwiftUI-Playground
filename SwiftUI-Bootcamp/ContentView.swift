//
//  ContentView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 13/1/24.
//

import SwiftUI

struct ContentView: View {
    struct WeatherDay {
        let dayOfWeek: String
        let imageName: String
        let temperature: Int
    }
    
    let weatherData: [WeatherDay] = [
        WeatherDay(dayOfWeek: "SUN", imageName: "cloud.sun.fill", temperature: 23),
        WeatherDay(dayOfWeek: "MON", imageName: "sun.max.fill", temperature: 34),
        WeatherDay(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 64),
        WeatherDay(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 45),
        WeatherDay(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 45),
        WeatherDay(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 23),
        WeatherDay(dayOfWeek: "SAT", imageName: "snow", temperature: 23)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 0) {
                CityTextView(cityName: "Cupertino, CA")
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .foregroundStyle(.white)
                    
                    Text("76 °C")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 20) {
                        ForEach(weatherData, id: \.dayOfWeek) { day in
                            WeatherDayView(dayOfWeek: day.dayOfWeek, imageName: day.imageName, temperature: day.temperature)
                        }
                    }
                }
                .padding()
                Spacer(minLength: 40)
                
                Button {
                    print("Tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .cornerRadius(8)
                        .foregroundStyle(.black)
                }
                
                Spacer(minLength: 60)
            }
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text(String(temperature))
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 1)
        )
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct BackgroundView: View {
    
    var topColor: Color = .black
    var bottomColor: Color = Color("blackCustom")
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View{
    var cityName: String
    var body: some View{ 
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}
