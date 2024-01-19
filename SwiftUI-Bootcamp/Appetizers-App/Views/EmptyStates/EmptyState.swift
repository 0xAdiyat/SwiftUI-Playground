//
//  EmptyState.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 19/1/24.
//

import SwiftUI

struct EmptyState: View {
    
    let image: ImageResource
    let message: String
    
    var body: some View {
        
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
                
            }
            .offset(y: -52)
        }
    }
}

#Preview {
    EmptyState(image: .emptyOrder, message: "Example text message")
}
