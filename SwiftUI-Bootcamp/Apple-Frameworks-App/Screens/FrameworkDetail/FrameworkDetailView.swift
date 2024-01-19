//
//  FrameworkDetailView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 15/1/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
//    let framework: Framework
//    
//    @Binding var isShowingDetailView: Bool
//    @State private var isShowingSafariView = false
    
    @ObservedObject var viewModel :  FrameworkDetailViewModel
    
    var body: some View {
        VStack{
            
            XDismissButton(isShowingDetailView: $viewModel.isShowingDetailView.wrappedValue)
            
            Spacer()
            
            FrameworkTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
//            Link(destination:  URL(string: viewModel.framework.url) ?? URL(string: "www.github.com/0xAdiyat")!, label: {
//                AFButton(title: "Learn More")
//            })
            
            Button{
                viewModel.isShowingSafariView = true
                 
            }label: {
                AFButton(title: "Learn More")
            }
            
        }
        .sheet(isPresented: $viewModel.isShowingSafariView) {
            SafariWebView(url: URL(string: viewModel.framework.url) ?? URL(string: "www.github.com/0xAdiyat")!)
        }
    }
}

#Preview {
    FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)))
}
