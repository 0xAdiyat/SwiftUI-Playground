//
//  FrameworkTitleViewHorizontal.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 16/1/24.
//

import SwiftUI

struct FrameworkTitleViewHorizontal: View{
    let framework: Framework
    var body: some View{
        HStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 92, height: 92)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding()
        }
        .padding()
    }
}

#Preview {
    FrameworkTitleViewHorizontal(framework: MockData.sampleFramework)
}
