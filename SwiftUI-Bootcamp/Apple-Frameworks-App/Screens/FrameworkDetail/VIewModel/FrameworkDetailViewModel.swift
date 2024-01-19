//
//  FrameworkDetailViewModel.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 19/1/24.
//

import SwiftUI

final class FrameworkDetailViewModel:ObservableObject{
    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    @Published  var isShowingSafariView = false
    
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}
