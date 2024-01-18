//
//  AppetizerDetailsView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 18/1/24.
//

import SwiftUI

struct AppetizerDetailsView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetailsScreen: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 40) {
                                 NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                                 NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                                 NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                             }
            }
            Spacer()
            
            Button{}label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to cart")
                    .font(.title3)
                    .frame(width: 260, height: 50)
                    .foregroundStyle(.white)
                    .background(.appetizersAccent)
                    .clipShape(.rect(cornerRadius: 12))

            }
            .padding(.bottom, 32)
        }
        .frame(width: 300, height: 524)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button{
            
        }label: {
            XDismissButtonAP(isShowingDetailsView: $isShowingDetailsScreen)
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailsView(appetizer: MockDataAppetizer.sampleAppetizer, isShowingDetailsScreen: .constant(false))
}



struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
