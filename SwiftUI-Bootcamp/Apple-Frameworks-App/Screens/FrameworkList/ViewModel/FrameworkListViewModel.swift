//
//  FrameworkListViewModel.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 16/1/24.
//

import SwiftUI

final class FrameworkListViewModel: ObservableObject{
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

