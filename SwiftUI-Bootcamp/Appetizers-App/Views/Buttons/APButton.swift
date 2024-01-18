//
//  APButton.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 18/1/24.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(.appetizersAccent)
            .clipShape(.rect(cornerRadius: 12))    }
}

#Preview {
    APButton(title: "Button")
}
