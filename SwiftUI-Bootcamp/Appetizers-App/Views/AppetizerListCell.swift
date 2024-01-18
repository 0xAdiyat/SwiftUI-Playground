//
//  AppetizerListCell.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack{
//            AsyncImage(url: URL(string: appetizer.imageURL),     transaction: Transaction(
//                animation: .spring(
//                    response: 0.5,
//                    dampingFraction: 0.65,
//                    blendDuration: 0.025)
//            )){ phase in
//                switch phase {
//                    case .success(let image):
//                        image
//                            .transition(.scale)
//                        
//                        //                            .resizable()
//                        //                            .scaledToFit()
//                        
//                    case .failure(_):
//                        Image(systemName: "exclamationmark.circle.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(maxWidth: 24)
//                            .foregroundColor(.appetizersAccent)
//                            .opacity(0.6)
//                    case .empty:
//                        
//                        ProgressView()
//                        
//                    @unknown default:
//                        Image(systemName: "photo.circle.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(maxWidth: 24)
//                            .foregroundColor(.appetizersAccent)
//                            .opacity(0.6)
//                }
//            }
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 120, height: 90, alignment: .center)
//            .cornerRadius(8)
            
            /// Another way of doing it
            AppetizerRemoteImage(urlString: appetizer.imageURL)
            .aspectRatio(contentMode: .fit)
                       .frame(width: 120, height: 90, alignment: .center)
                       .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockDataAppetizer.sampleAppetizer)
}
