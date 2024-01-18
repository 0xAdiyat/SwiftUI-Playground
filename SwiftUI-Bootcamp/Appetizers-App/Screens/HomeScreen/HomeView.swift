//
//  AppetizerListView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var appetizerListViewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(appetizerListViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            appetizerListViewModel.selectedAppetizer = appetizer
                            appetizerListViewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(appetizerListViewModel.isShowingDetail)
                
            }
            .onAppear{
                appetizerListViewModel.getAppetizers()
            }
            .blur(radius: appetizerListViewModel.isShowingDetail ? 20 : 0)
            
            if appetizerListViewModel.isShowingDetail{
                AppetizerDetailsView(appetizer: appetizerListViewModel.selectedAppetizer ?? MockDataAppetizer.sampleAppetizer, isShowingDetailsScreen: $appetizerListViewModel.isShowingDetail)
            }
            if appetizerListViewModel.isLoading {
//                ProgressView()
                LoadingView()
            }
            
            if appetizerListViewModel.appetizers.isEmpty{
                VStack{
                    Image(.foodPlaceholder)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 90, alignment: .center)
                        .cornerRadius(8)
                    
                    Text("No appetizer found...")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
            }
            
            
        }
        .alert(item: $appetizerListViewModel.alertItem) { item in
            Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
        }
    }
    

}

#Preview {
    HomeView()
}
