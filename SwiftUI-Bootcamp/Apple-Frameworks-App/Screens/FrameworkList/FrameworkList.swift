//
//  FrameworkList.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 16/1/24.
//

import SwiftUI
struct FrameworkList: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    
    var body: some View {
        NavigationStack{
                List{
                    ForEach(MockData.frameworks){ framework in
                        NavigationLink(destination: FrameworkDetailListView(framework: framework, isShowingDetailView: $viewModel.isShowingDetailView)){
                            FrameworkTitleViewHorizontal(framework: framework)

                        }
                    }
                }
                .navigationTitle(" Frameworks")
               
            
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    FrameworkList()
}

