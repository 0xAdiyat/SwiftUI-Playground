//
//  AppetizerListView.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationStack{
                List(appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
                }
            .navigationTitle("🍟 Appetizers")

        }
        .onAppear{
            getAppetizers()
        }
    }
    
    func getAppetizers(){
     
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async{
                switch result {
                        
                    case let .success(appetizers):
                        self.appetizers =  appetizers
                        
                    case let .failure(err):
                        print(err.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
