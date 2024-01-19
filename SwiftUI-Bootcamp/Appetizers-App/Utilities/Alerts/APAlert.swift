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
    
    //MARK: - API Responses
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
    
    
    //MARK: - Account Alerts
    static let invalidForm      = APAlertItem(title: Text("Invalid Form"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail     = APAlertItem(title: Text("Invalid Email"),
                                            message: Text("Please ensure your email is correct."),
                                            dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess  = APAlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was successfully saved."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData  = APAlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retrieving your profile."),
                                            dismissButton: .default(Text("OK")))
    
}

