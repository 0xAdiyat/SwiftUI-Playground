//
//  AFButton.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 15/1/24.
//

import SwiftUI

struct AFButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 200, height: 50)
            .background(.black)
            .foregroundStyle(.white)
            .clipShape(.buttonBorder)
    }
}

#Preview {
    AFButton(title: "Learn More")
}
