//
//  XDismissButtonAP.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 18/1/24.
//

import SwiftUI

struct XDismissButtonAP: View {
    
    @Binding var isShowingDetailsView: Bool
    
    var body: some View {
        ZStack(){
            Circle()
                .frame(width: 32, height: 32)
                .foregroundStyle(.white)
            
            Button{
                isShowingDetailsView = false
            }label: {
                
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44,height: 44)
                    .foregroundStyle(Color(.label))
            }
            
        }
    }
}


#Preview {
    XDismissButtonAP(isShowingDetailsView: .constant(false))
}
