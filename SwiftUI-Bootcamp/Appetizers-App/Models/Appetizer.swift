//
//  Appetizer.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 17/1/24.
//

import SwiftUI

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}


struct MockDataAppetizer{
    static let sampleAppetizer = Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 9.08, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 300, protein: 14, carbs: 0)
    
    static let appetizers = [
        sampleAppetizer, sampleAppetizer, sampleAppetizer,sampleAppetizer, sampleAppetizer
    ]
    
    
    static let orderItem1 = Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 9.08, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 300, protein: 14, carbs: 0)
    
    static let orderItem2 = Appetizer(id: 2, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 9.08, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 300, protein: 14, carbs: 0)
    
    static let orderItem3 = Appetizer(id: 3, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 9.08, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 300, protein: 14, carbs: 0)
    
    static let orderItems  =  [
        orderItem1, orderItem2, orderItem3
    ]
    
    
}


