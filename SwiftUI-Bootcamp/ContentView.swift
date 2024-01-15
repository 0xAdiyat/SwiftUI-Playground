//
//  ContentView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 13/1/24.
//

import SwiftUI


struct ContentView: View {
    struct WeatherDay : Identifiable, Hashable{
        let dayOfWeek: String
        let imageName: String
        let temperature: Int
        var id: UUID = .init()
    }

    
    @State private var isNight = false
    
    @State private var currentPage: String = ""
    let listOfPages: [WeatherDay] = [
        WeatherDay(dayOfWeek: "SUN", imageName: "cloud.sun.fill", temperature: 23),
        WeatherDay(dayOfWeek: "MON", imageName: "sun.max.fill", temperature: 34),
        WeatherDay(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 45),
        WeatherDay(dayOfWeek: "TUE", imageName: "tornado", temperature: 64),
        WeatherDay(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 45),
        WeatherDay(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 23),
        WeatherDay(dayOfWeek: "SAT", imageName: "snow", temperature: 23)
    ]
    // Infinite carousel properties
    @State private var fakedPages: [WeatherDay] = []
    
    
  
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .white, bottomColor:  isNight ? Color("blackCustom"): .white)
            
            VStack(spacing: 0) {
                CityTextView(cityName: "Cupertino, CA", color: isNight ? .white : .black)
           
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 74, color: isNight ? .white : .black)

                
                ScrollView(.horizontal, showsIndicators: false) {
                              ScrollViewReader { scrollView in
                                  LazyHStack(spacing: 20) {
                                      ForEach(fakedPages, id: \.id) { day in
                                          GeometryReader { geometry in
                                              WeatherDayView(dayOfWeek: day.dayOfWeek, imageName: day.imageName, temperature: day.temperature, color: isNight ? .white : .black)
                                                  .rotation3DEffect(
                                                      Angle(degrees: computeRotationAngle(geometry: geometry)),
                                                      axis: (x: 0.0, y: 200.0, z: 0.0)
                                                  )
                                                  .scaleEffect(computeScaleFactor(geometry: geometry))
                                                  .opacity(computeOpacity(geometry: geometry))
                                                  .tag(day.id.uuidString)
                                                  .offsetX(currentPage == day.id.uuidString ) { rect in
                                                      let size = geometry.size
                                                      let minX = rect.minX
                                                      let pageOffset = minX - (size.width * CGFloat(fakeIndex(day)))
                                                      let pageProgress = pageOffset / size.width
                                                      // Check if we need to move to the last or first page
                                                      print(pageProgress)
                                                      if -pageProgress < 1.0 && fakedPages.indices.contains(fakedPages.count - 1) {
                                                          withAnimation{
                                                              currentPage = fakedPages[fakedPages.count - 1].id.uuidString
                                                              if let pageUUID = UUID(uuidString: currentPage) {
                                                                  scrollView.scrollTo(pageUUID, anchor: .center)
                                                              }
                                                          }
                                                      }

                                                      if -pageProgress > CGFloat(fakedPages.count - 1) && fakedPages.indices.contains(1) {
                                                          withAnimation{
                                                              currentPage = fakedPages[1].id.uuidString
                                                              if let pageUUID = UUID(uuidString: currentPage) {
                                                                  scrollView.scrollTo(pageUUID, anchor: .center)
                                                              }
                                                          }
                                                      }

                                                  }
                                          }
                                          .frame(width: 100, height: 140)
                                          .id(day.id)
                                      }
                                  }
                                  .onAppear {
                                      scrollView.scrollTo(listOfPages[listOfPages.count / 2].id, anchor: .center)

                                      guard fakedPages.isEmpty else { return }


                                      fakedPages.append(contentsOf: listOfPages)

                                      if var firstPage = listOfPages.first, var lastPage = listOfPages.last {
                                          currentPage = firstPage.id.uuidString

                                          firstPage.id = .init()
                                          lastPage.id = .init()

                                          fakedPages.append(firstPage)
                                          fakedPages.insert(lastPage, at: 0)
                                      }

                                  }
                              }
                          }
                          .padding()
                          .frame(width: UIScreen.main.bounds.width)
                      
                
                Spacer(minLength: 40)
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton("Change Day Time", backgroundColor: isNight ? .white : .black, textColor: isNight ? .black :  .white)
                }
                Spacer(minLength: 80)
            }
        }
    }
    
    func fakeIndex(_ of: WeatherDay) -> Int{
        return fakedPages.firstIndex(of: of) ?? 0
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

// Helper function to compute the rotation angle based on the geometry
private func computeRotationAngle(geometry: GeometryProxy) -> Double {
    let midX = UIScreen.main.bounds.width / 2
    let distanceFromCenter = Double(geometry.frame(in: .global).midX - midX)
    let maxDistance: Double = 200
    let angle = -distanceFromCenter / maxDistance * 45
    return angle
}

private func computeScaleFactor(geometry: GeometryProxy) -> CGFloat {
    let midX = UIScreen.main.bounds.width / 2
    let distanceFromCenter = abs(geometry.frame(in: .global).midX - midX)
    let maxDistance: CGFloat = 200
    let scaleFactor = 1 - min(distanceFromCenter / maxDistance, 1)
    return scaleFactor
}

private func computeOpacity(geometry: GeometryProxy) -> Double {
    let midX = UIScreen.main.bounds.width / 2
    let distanceFromCenter = abs(geometry.frame(in: .global).midX - midX)
    let maxDistance: CGFloat = 200
    let opacity = 1 - min(distanceFromCenter / maxDistance, 1)
    return Double(opacity)
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


struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var color: Color?
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(color ?? .white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text(String(temperature))
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(color ?? .white)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(color ?? .white, lineWidth: 1)
        )
    }
}


struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View{
    var cityName: String
    var color: Color?
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(color ?? .white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var color: Color?
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .foregroundStyle(.white)
            
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(color ?? .white)
        }
    }
}



 




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
