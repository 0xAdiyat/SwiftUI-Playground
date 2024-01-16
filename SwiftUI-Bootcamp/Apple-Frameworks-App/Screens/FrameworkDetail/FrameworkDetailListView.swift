//
//  FrameworkDetailListView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 16/1/24.
//

import SwiftUI


struct FrameworkDetailListView: View {
    
    let framework: Framework
    
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack{
            
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button{
                isShowingSafariView = true
                 
            }label: {
                AFButton(title: "Learn More")
            }
            
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariWebView(url: URL(string: framework.url) ?? URL(string: "www.github.com/0xAdiyat")!)
        }
    }
}

#Preview {
    FrameworkDetailListView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
}
