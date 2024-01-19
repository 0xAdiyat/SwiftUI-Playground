//
//  CustomModifiers.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 19/1/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.appetizersAccent)
    }
}


extension View{
    func standardButtonStyle() -> some View{
        self.modifier(StandardButtonStyle())
    }
}
