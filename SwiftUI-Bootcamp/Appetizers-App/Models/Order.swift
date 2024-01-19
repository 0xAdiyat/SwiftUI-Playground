//
//  Order.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 19/1/24.
//

import SwiftUI



final class Order: ObservableObject{
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double{
        items.reduce(0){
            $0 + $1.price
        }
    }
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItem(atOffsets: IndexSet){
        items.remove(atOffsets: atOffsets)
    }
}

