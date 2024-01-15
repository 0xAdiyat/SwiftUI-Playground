//
//  WeatherView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 13/1/24.
//

import SwiftUI


// ContentView: The main view of the application.
struct WeatherView: View {

    // State variable to control day/night mode
    @State private var isNight = true

    // List of WeatherDay objects, including some nil entries for spacing
    let listOfDays: [WeatherDay?] = [
        nil,
        WeatherDay(dayOfWeek: .sun, imageName: "cloud.sun.fill", temperature: 23),
        WeatherDay(dayOfWeek: .mon, imageName: "sun.max.fill", temperature: 34),
        WeatherDay(dayOfWeek: .wed, imageName: "cloud.sun.fill", temperature: 45),
        WeatherDay(dayOfWeek: .tue, imageName: "tornado", temperature: 64),
        WeatherDay(dayOfWeek: .thu, imageName: "cloud.sun.fill", temperature: 45),
        WeatherDay(dayOfWeek: .fri, imageName: "wind.snow", temperature: 23),
        WeatherDay(dayOfWeek: .sat, imageName: "snow", temperature: 23),
        nil,
    ]

    // Body of the ContentView
    var body: some View {
        ZStack {
            // BackgroundView with dynamic color based on day/night mode
            BackgroundView(isNight: $isNight)
            
            VStack(spacing: 0) {
                // CityTextView displaying the city name
                CityTextView(cityName: "Cupertino, CA", color: isNight ? .white : .black)
           
                // MainWeatherStatusView displaying the main weather status
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 75, isNight: $isNight)

                // Horizontal ScrollView for the weather days
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { scrollView in
                        LazyHStack(spacing: 20) {
                            ForEach(listOfDays.indices, id: \.self) { index in
                                if let day = listOfDays[index] {
                                    // Used GeometryReader for animations and transformations
                                    GeometryReader { geometry in
                                        WeatherDayView(dayOfWeek: day.dayOfWeek, imageName: day.imageName, temperature: day.temperature, isNight: $isNight)
                                            .rotation3DEffect(
                                                Angle(degrees: computeRotationAngle(geometry: geometry)),
                                                axis: (x: 0.0, y: 200.0, z: 0.0)
                                            )
                                            .scaleEffect(computeScaleFactor(geometry: geometry))
                                            .opacity(computeOpacity(geometry: geometry))
                                    }
                                    .frame(width: 100, height: 140)
                                    .id(day.id)
                                } else {
                                    // Placeholder for nil entries
                                    Color.clear.frame(width: 100, height: 140)
                                }
                            }
                        }
                        .onAppear {
                            // Scroll to the center of the list on appear
                            scrollView.scrollTo(listOfDays[listOfDays.count / 2]?.id, anchor: .center)
                        }
                    }
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width)
                
                Spacer(minLength: 40)
                
                // Button to toggle day/night mode
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton("Change Day Time", backgroundColor: isNight ? .white : .black, textColor: isNight ? .black :  .white)
                }
                
                Spacer(minLength: 80)
            }
        }
    }
    // Helper function to compute the rotation angle based on the geometry
    private func computeRotationAngle(geometry: GeometryProxy) -> Double {
        let midX = UIScreen.main.bounds.width / 2
        let distanceFromCenter = Double(geometry.frame(in: .global).midX - midX)
        let maxDistance: Double = 200
        let angle = -distanceFromCenter / maxDistance * 45
        return angle
    }

    // Helper function to compute the scale factor based on the geometry
    private func computeScaleFactor(geometry: GeometryProxy) -> CGFloat {
        let midX = UIScreen.main.bounds.width / 2
        let distanceFromCenter = abs(geometry.frame(in: .global).midX - midX)
        let maxDistance: CGFloat = 200
        let scaleFactor = 1 - min(distanceFromCenter / maxDistance, 1)
        return scaleFactor
    }

    // Helper function to compute the opacity based on the geometry
    private func computeOpacity(geometry: GeometryProxy) -> Double {
        let midX = UIScreen.main.bounds.width / 2
        let distanceFromCenter = abs(geometry.frame(in: .global).midX - midX)
        let maxDistance: CGFloat = 200
        let opacity = 1 - min(distanceFromCenter / maxDistance, 1)
        return Double(opacity)
    }
}

// ContentView_Previews: Previews for the ContentView
#if DEBUG
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
#endif



// WeatherDayView: Display individual weather day information
struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    @Binding var isNight:  Bool

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(isNight ? .white : .black)
                .opacity(1) // Ensure the initial opacity is set
            
            Image(systemName: imageName)
//                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundStyle(isNight ? .white : .black)
                .symbolRenderingMode(.hierarchical)
            
            Text(String(temperature))
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(isNight ? .white: .black)
                .opacity(1)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isNight ? .white : .black, lineWidth: 1)
        )
        .animation(.easeInOut, value: UUID())
        .transition(.opacity)
    }
}

// BackgroundView: Display the background gradient based on day/night mode
struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .white,  isNight ? .blackCustom: .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
        .animation(.easeInOut, value: UUID())
    }
}

// CityTextView: Display the city name
struct CityTextView: View {
    var cityName: String
    var color: Color?
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(color ?? .white)
            .padding()
            .animation(.easeInOut, value: UUID())
    }
}

// MainWeatherStatusView: Display the main weather status
/// <#Description#>
struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    @Binding var isNight:  Bool
    
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
//                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .foregroundStyle(isNight ? .white : .black)
                .symbolRenderingMode(.hierarchical)
                .padding()
            
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(isNight ? .white : .black)
                .animation(.easeInOut, value: UUID())
        }
    }
}




//private func computeColor(geometry: GeometryProxy,  isNight: Bool) -> Color {
//    let midX = UIScreen.main.bounds.width / 2
//    let distanceFromCenter = abs(geometry.frame(in: .global).midX - midX)
//    let maxDistance: CGFloat = 200
//
//    // Define your start and end colors
//    let startColor: Color = isNight ? .white : .black
//    let endColor: Color = isNight ? .blue : .red
//
//    // Calculate the progress between start and end based on distance
//    let progress = min(distanceFromCenter / maxDistance, 1)
//
//    // Interpolate between start and end colors
//    return Color.interpolate(from: startColor, to: endColor, progress: Double(progress))
//}
//
//extension Color {
//    // Extension to interpolate between two colors
//    static func interpolate(from start: Color, to end: Color, progress: Double) -> Color {
//        var startR: CGFloat = 0, startG: CGFloat = 0, startB: CGFloat = 0, startA: CGFloat = 0
//        var endR: CGFloat = 0, endG: CGFloat = 0, endB: CGFloat = 0, endA: CGFloat = 0
//
//        UIColor(start).getRed(&startR, green: &startG, blue: &startB, alpha: &startA)
//        UIColor(end).getRed(&endR, green: &endG, blue: &endB, alpha: &endA)
//
//        let interpolatedColor = Color(
//            red: startR + CGFloat(progress) * (endR - startR),
//            green: startG + CGFloat(progress) * (endG - startG),
//            blue: startB + CGFloat(progress) * (endB - startB),
//            opacity: startA + CGFloat(progress) * (endA - startA)
//        )
//
//        return interpolatedColor
//    }
//}





// We could have also done
//struct WeatherButton<Label: View>: View {
//    let action: () -> Void
//    let label: Label
//
//    init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
//        self.action = action
//        self.label = label()
//    }
//
//    var body: some View {
//        Button(action: action, label: {
//            label
//                .frame(width: 280, height: 50)
//                .background(Color.white)
//                .cornerRadius(8)
//                .foregroundStyle(Color.black)
//        })
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            // Example of using WeatherButton
//            WeatherButton {
//                print("Tapped")
//            } label: {
//                Text("Change Day Time")
//            }
//        }
//        .padding()
//    }
//}
