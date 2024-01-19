//
//  SwiftUI_BootcampApp.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 13/1/24.
//

import SwiftUI

@main
struct SwiftUI_BootcampApp: App {
    // MARK - this part of the code is related to [Appetizer-App] only
    var orderEnv = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(orderEnv)
//            BarcodeScannerView()
//            FrameworkList()
//            FrameworkGridView()
//            WeatherView()
//            ContentView()
        }
    }
}
