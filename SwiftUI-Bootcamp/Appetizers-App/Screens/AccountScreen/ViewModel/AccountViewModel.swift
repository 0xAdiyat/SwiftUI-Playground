//
//  AccountViewModel.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 18/1/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    
    @Published var alertItem: APAlertItem?
    
    
    func saveChanges(){
        guard isValidForm else{ return }
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            
            alertItem = APAlertContext.userSaveSuccess
        }catch{
            alertItem = APAlertContext.invalidUserData

        }
    }
    
    func retrieveUser(){
        guard let userData = userData else {return}
        do{
            let data = try JSONDecoder().decode(User.self, from: userData )
            user = data
        }catch{
            alertItem = APAlertContext.invalidUserData

        }
    }
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = APAlertContext.invalidForm
            return false
        }
        
        guard  user.email.isValidEmail else{
            alertItem = APAlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    
}
