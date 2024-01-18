//
//  APAlert.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 18/1/24.
//

import SwiftUI


struct APAlertItem : Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
    
}
struct APAlertContext {
    static let invalidData = APAlertItem(title: Text("Server Error"),
                                         message:Text( "The data received from the server was invalid. Please contact support."),
                                         dismissButton: .default(Text("OK")))
    
    static let invalidResponse = APAlertItem(title: Text("Server Error"),
                                             message: Text("Invalid response from the server. Please try again later or contact support."),
                                             dismissButton: .default(Text("OK")))
    
    static let invalidURL = APAlertItem(title: Text("Server Error"), message:Text("There was an issue connecting to the server. If this persists, please contact support.") , dismissButton: .default(Text("OK")))
    
    static let unableToComplete = APAlertItem(
        title: Text("Server Error"),
        message: Text("Unable complete your request at this time. Please check your internet connection."),
        dismissButton: .default(Text("OK"))
    )
    
}

