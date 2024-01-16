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
            
            Image(framework.imageName)
                .resizable()
                .frame(width: 120, height: 120)
            
            
            VStack(alignment: .leading){
                HStack{
                    Text(framework.name.uppercased())
                        .font(.title2)
                        .fontWeight(.bold)
                        .scaledToFit()
                        .minimumScaleFactor(0.6)
                    Spacer()
                }
                HStack{
                    Text("Description")
                        .font(.title3)
                        .fontWeight(.medium)
                        .scaledToFit()
                        .minimumScaleFactor(0.6)
                    Spacer()
                    Rectangle()
                        .frame(width: 20, height: 3)
                    
                }
            }
            .padding()
            ScrollView{
                Text(framework.description)
                    .font(.subheadline)
                    .foregroundStyle(Color(.label).opacity(0.7))
                    .padding()
                
            }
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
