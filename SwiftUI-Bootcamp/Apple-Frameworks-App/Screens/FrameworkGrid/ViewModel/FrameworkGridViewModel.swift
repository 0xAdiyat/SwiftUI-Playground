//
//  FrameworkGridViewModel.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 15/1/24.
//

import SwiftUI


final class FrameworkGridViewModel: ObservableObject{
    var selectedFramework: Framework?{
        didSet{
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
}
