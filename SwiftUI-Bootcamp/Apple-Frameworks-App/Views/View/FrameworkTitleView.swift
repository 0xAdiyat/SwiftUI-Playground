//
//  FrameworkTitleView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 15/1/24.
//

import SwiftUI

struct FrameworkTitleView: View{
    let framework: Framework
    var body: some View{
        VStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 92, height: 92)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

#Preview {
    FrameworkTitleView(framework: MockData.sampleFramework)
}
