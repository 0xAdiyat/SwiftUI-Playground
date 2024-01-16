//
//  OffsetReader.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 14/1/24.
//

import SwiftUI

struct OffSetKey: PreferenceKey{
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View{
    @ViewBuilder
    func offsetX(_ addObserver: Bool, completion: @escaping (CGRect) -> ()) -> some View{
        self
            .frame(maxWidth: .infinity)
            .overlay{
                if addObserver{
                    GeometryReader{
                        let rect = $0.frame(in: .global)
                        
                        Color.clear
                            .preference(key: OffSetKey.self,value: rect)
                            .onPreferenceChange(OffSetKey.self, perform: completion)
                    }
                }
            }
    }
}
