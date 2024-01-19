//
//  AppetizerTabView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

struct AppetizerTabView: View {
//    var orderEnv = Order() // required to place it here in order to enable preview. Otherwise it will crash
    
    @EnvironmentObject var order: Order

    var body: some View {
        TabView{

            HomeView()
                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
                    Label("Home",systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account",systemImage: "person")

                }
            
            OrderView()
                .tabItem {
                    Label("Order",systemImage: "bag")
                }
                .badge(order.items.count)

            
        }
        .tint(.appetizersAccent)
//        .environmentObject(orderEnv) // required to place it here in order to enable preview. Otherwise the preview will crash

    }
}

#Preview {
    AppetizerTabView()
}
