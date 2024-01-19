//
//  OrderView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

struct OrderView: View {
    

    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                        }
                        .onDelete(perform: order.deleteItem)
                    }
                    .listStyle(.plain)
                    
                    Button{
                        
                    }label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 32)
                }
                
                if order.items.isEmpty{
                    EmptyState(image: .emptyOrder, message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("Orders")
        }
        
    }
    
  
    
}

#Preview {
    OrderView()
}
